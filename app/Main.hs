module Main where

import           Control.Monad
import           Data.Functor
import           Random
import           System.Exit
import           System.IO
import           Words




printGuess :: String -> String -> IO ()
printGuess word guess = do
  let matches = match word guess
  mapM_ (putStr . withColor) matches
  putStrLn ""
 where
  withColor (CorrectSpot c) = "\ESC[1;32m" ++ [c] ++ "\ESC[0m"
  withColor (WrongSpot   c) = "\ESC[1;93m" ++ [c] ++ "\ESC[0m"
  withColor (NoMatch     c) = [c]

loop :: String -> IO ()
loop word = forever $ do
  words <- getWords

  putStr "> " >> hFlush stdout
  guess <- getLine

  if isValid guess && guess `elem` words
    then printGuess word guess
    else putStrLn "Invalid guess"

  when (word == guess) $ do
    putStrLn "You win!"
    exitSuccess

main :: IO ()
main = do
  words <- getWords
  word  <- randomElement words
  loop word
