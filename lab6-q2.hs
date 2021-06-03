myTake _ [] = []
myTake 0 _ = []
myTake n (x:xs) = x:rest
  where rest = myTake (n - 1) xs   


drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' n xs@(_:xs')
   | n > 0     = drop' (n-1) xs'
   | otherwise = xs



-- |main = do 
 -- |  let y = [1..10]   
   -- |print (myTake 5 y)  
   -- |let x = [1..10]   
   -- |print (drop' 3 x)   
