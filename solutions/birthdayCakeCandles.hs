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
-- Complete the 'birthdayCakeCandles' function below.
--
-- The function is expected to return an INTEGER.
-- The function accepts INTEGER_ARRAY candles as parameter.
--

birthdayCakeCandles :: [Int] -> Int
birthdayCakeCandles candles = let 
    tallest = Data.List.maximum candles 
    in
        Data.List.length $ Data.List.filter (==tallest) candles

lstrip = Data.Text.unpack . Data.Text.stripStart . Data.Text.pack
rstrip = Data.Text.unpack . Data.Text.stripEnd . Data.Text.pack

main :: IO()
main = do
    -- some lines were commented to run outside of hakerrank
    --stdout <- getEnv "OUTPUT_PATH"
    --fptr <- openFile stdout WriteMode

    candlesCountTemp <- getLine
    let candlesCount = read $ lstrip $ rstrip candlesCountTemp :: Int

    candlesTemp <- getLine

    let candles = Data.List.map (read :: String -> Int) . Data.List.words $ rstrip candlesTemp

    let result = birthdayCakeCandles candles

    putStrLn $ show result -- added to run outside of hackerrank
    --hPutStrLn fptr $ show result

    --hFlush fptr
    --hClose fptr
