import Data.Char
import Data.Char

type Text = [Char]
type Wordd = [Char]


sort [] = []
sort [x] = [x]
sort xs = merge (sort ys) (sort zs)
 where (ys,zs) = half xs
half xs = (take n xs, drop n xs)
 where n = length xs `div` 2
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) 
 | x <= y = x : merge xs (y:ys)
 | otherwise = y : merge (x:xs) ys

sortWords :: [Wordd] -> [Wordd]
sortWords = sort
sortRuns :: [(Int,Wordd)] -> [(Int,Wordd)]
sortRuns = reverse . sort

showRun :: (Int,Wordd) -> String
showRun (n,w) = w ++ ": " ++
 show n ++ "\n"
 
spann :: (a -> Bool) -> [a] -> ([a], [a])
spann p [] = ([], [])
spann p (x:xs) = if p x then (x:ys,zs)
 else ([],x:xs)
 where (ys,zs) = spann p xs

countRuns :: [Wordd] -> [(Int,Wordd)]
countRuns [] = []
countRuns (w:ws) = (1+length us,w) : countRuns vs
 where (us,vs) = spann ( == w) ws


commonWords :: Int -> Text -> String
commonWords n = concat . map showRun . take n . sortRuns . countRuns . sortWords . map (map Data.Char.toLower) . words