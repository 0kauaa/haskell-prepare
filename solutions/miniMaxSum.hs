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
-- Complete the 'miniMaxSum' function below.
--
-- The function accepts INTEGER_ARRAY arr as parameter.
--

miniMaxSum :: [Int] -> IO () 
miniMaxSum arr = do
    putStrLn (show minSum ++ " " ++ show maxSum)
        where
            minSum = sum $ Data.List.take 4 $ Data.List.sort arr
            maxSum = sum $ Data.List.take 4 $ Data.List.reverse $ Data.List.sort arr

lstrip = Data.Text.unpack . Data.Text.stripStart . Data.Text.pack
rstrip = Data.Text.unpack . Data.Text.stripEnd . Data.Text.pack

main :: IO()
main = do

    arrTemp <- getLine

    let arr = Data.List.map (read :: String -> Int) . Data.List.words $ rstrip arrTemp

    miniMaxSum arr
