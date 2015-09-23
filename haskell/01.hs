-- Get the last element of a list
--    * (my-last '(a b c d))<br>
--    (D)<p>

-- The following is from:
-- learnyouahaskell.com/

double x = x + x
-- double_two x y = double x + double y

-- bob = "test" -- this is still a function
-- functions can not begin with capital letters in haskell.
-- appending lists with ++  [1,2,3] ++ [4,5,6] => [1,2,3,4,5,6]
-- strings are lists?  "hel" ++ "lo" => "hello"
-- ['h','e'] ++ ['l','l','o'] => 'hello'
-- lisp's cons operator is ':'
-- 'Good' : " kitty!" => "Good kitty!"
-- 1 : [2,3,4] => [1,2,3,4]
-- list indexes: [1,2,3] ! 2 => 3   [1,2,3] ! 0 => 1
-- head == car, tail == cdr, last(reversehead), init(reverse cdr) [1,2,3] => [1,2]
-- length, null, reverse, take 3 [1,2,3,4] => [1,2,3] (takes first 3)
-- drop drops the first n elements
-- minimum maximum sum product
-- infix operations:  3 `elem` [1,2,3,4] ==  elem 3 [1,2,3,4]
-- [x * 2 | x <- [1..4]] => [2,4,6,8]
-- all numbers divisible by 7 from 1..1000:
-- [x | x <- [1 .. 1000], mod x 7 == 0]

main = do
  putStrLn "hello"
  let first_try = mylast mylist
  print first_try
  let second_try = mylast' mylist
  print second_try
--  first <- mylast mylist
--  second <- mylast' mylist
--  putStrLn("The answer is " ++ first ++ " from first, and " ++ second ++ " from second.")

-- The following are two ways of doing this
mylist = [1,2,3,4,5,6,7,8,9,0]

mylast :: [a] -> [a]
mylast [] = []
mylast [a] = [a]
mylast (a:b) = mylast b

mylast' :: [a] -> [a]
mylast' [] = []
mylast' [a] = [a]
mylast' (a:b) = if null(tail (a:b))
                then [a]
                else mylast b

-- λ> 



