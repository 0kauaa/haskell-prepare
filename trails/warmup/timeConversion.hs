{-# LANGUAGE DuplicateRecordFields, FlexibleInstances, UndecidableInstances #-}

module Main where

import Control.Monad
import Data.Array
import Data.Bits
import Data.List
import Data.List.Split
import Data.Set
import Data.Text
import Debug.Trace
import System.Environment
import System.IO
import System.IO.Unsafe

--
-- Complete the 'timeConversion' function below.
--
-- The function is expected to return a STRING.
-- The function accepts STRING s as parameter.
--

timeConversion :: String -> String
timeConversion s = let
    tag     = Data.List.reverse $ Data.List.take 2 $ Data.List.reverse s
    strHour = if Data.List.take 2 s == "12" && tag == "AM" then "00" else Data.List.take 2 s
    intHour = read strHour :: Int
    rest    =  Data.List.take 6 $ Data.List.reverse $ Data.List.take 8 $ Data.List.reverse s
    
    in 
        if tag /= "AM" && strHour /= "12"
        then show (intHour + 12) ++ rest 
        else strHour ++ rest

main :: IO()
main = do
    -- some lines were commented to run outside of hakerrank
    --stdout <- getEnv "OUTPUT_PATH"
    --fptr <- openFile stdout WriteMode

    s <- getLine

    let result = timeConversion s

    putStrLn result -- added to run outside of hackerrank
    --hPutStrLn fptr result

    --hFlush fptr
    --hClose fptr
