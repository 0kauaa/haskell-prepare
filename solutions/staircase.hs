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
-- Complete the 'staircase' function below.
--
-- The function accepts INTEGER n as parameter.
--

staircase :: Int -> IO()
staircase n =
    let line i = putStrLn ((Data.List.replicate (n-i) ' ') ++ (Data.List.replicate i '#'))
    in mapM_ line [1..n]


lstrip = Data.Text.unpack . Data.Text.stripStart . Data.Text.pack
rstrip = Data.Text.unpack . Data.Text.stripEnd . Data.Text.pack

main :: IO()
main = do
    nTemp <- getLine
    let n = read $ lstrip $ rstrip nTemp :: Int

    staircase n
