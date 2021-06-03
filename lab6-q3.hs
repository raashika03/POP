data List a = Nil | Snoc (List a) a deriving (Show)
scar :: List a -> a
scar Nil = error "Empty"
scar (Snoc Nil x) = x
scar (Snoc l x) = scar l


scdr :: List a -> List a
scdr Nil = error "Empty"
scdr (Snoc Nil x) = Nil
scdr (Snoc l x) = Snoc (scdr l) x 

toList :: [a] -> List a
toList [] = Nil
toList l = Snoc (toList (init l)) (last l)

fromList :: List a -> [a]
fromList Nil = []
fromList l = ((scar l) : fromList (scdr l))
