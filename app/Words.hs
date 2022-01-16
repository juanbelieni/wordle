module Words where

import           Data.List                      ( nub )

isValid :: String -> Bool
isValid word = length word == 5 && length (nub word) == 5

getWords :: IO [String]
getWords = do
  file <- readFile "words.txt"
  return $ filter isValid $ lines file

data Match = CorrectSpot Char | WrongSpot Char | NoMatch Char
  deriving (Eq, Show)

match :: String -> String -> [Match]
match word guess = zipWith matchChar word guess
 where
  matchChar c g | c == g        = CorrectSpot g
                | g `elem` word = WrongSpot g
                | otherwise     = NoMatch g
