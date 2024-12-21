module Acronym (abbreviate) where

import Data.Char   ( isAlpha, isLower, isUpper, toUpper )

abbreviate :: String -> String
abbreviate = map (toUpper . head) . mconcat . map shatter . words . map dashToSpace
  where dashToSpace '-' = ' '
        dashToSpace c   = c
        shatter = shatter' . filter isAlpha
        shatter' w
          | null w    = []
          | isMixed   = map return uppers
          | otherwise = [w]
          where isMixed = (not . null) uppers && (not . null) lowers
                uppers  = filter isUpper w
                lowers  = filter isLower w
