module Random
  ( randomElement
  ) where

import           Data.Functor
import           System.Random                  ( randomIO )

randomElement :: [a] -> IO a
randomElement xs = randomIO <&> (`mod` length xs) <&> (xs !!)
