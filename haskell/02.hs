-- Get the penultimate element of a list.

import Data.Time.Clock.POSIX
-- Set the types
first_string :: String -- :: String sets the type.
main :: IO() -- IO() is the type for printing to screen

first_string = "hello"

coin :: Bool -> Bool
coin = \_ -> True

new_coin :: Bool
new_coin = coin False

another_coin :: Bool
another_coin = coin new_coin

another_coin' :: Bool
another_coin' = coin (coin False)

plus :: Int -> Int -> Int -- I don't quite get this yet.
plus x y = x + y

test :: Int
test = 3

message :: String -> String
message name =
  case name of
    "Dave" -> "I cannot do that"
    "Sam" -> "Play it again"
    _ -> "underscore is the default value"

another_message :: String -> String
another_message again
  | again == "Dave" = "I cannot do that"
  | again == "Sam" = "Play it again"
  | otherwise = "is otherwise a special form?"


a_list = []
b_list = "Sauce" : a_list
-- Do the same thing as prefix
c_list = "pie" : "WTF" : []
d_list :: Num a => [a]
d_list = [1,2,3,4]
e_list :: Num a => [a]
e_list = (:) 3 ((:) 2 ((:) 1 []))

first_or_nothing :: [String] -> String
first_or_nothing [] = ""
first_or_nothing (x:_) = x

joined :: [String] -> String
joined [] = ""
joined [a] = a
joined (a:b) = a ++ ", " ++ joined b


main = do
  let mylist = [1,2,3,4,5,6,7,8,9,0]
  putStrLn first_string
  getPOSIXTime >>= print
  let test = plus 3 4
  putStrLn (show test)
  putStrLn (message "Dave")
  putStrLn (another_message "Bob")
  putStrLn (show e_list)
  putStrLn ("The e_list variable has " ++ (show(length(e_list))) ++ " elements.")
  putStrLn ("The c_list variable has " ++ (show(length(c_list))) ++ " elements.")
  putStrLn ("Join these stupid elements " ++ (show(joined(c_list))) ++ " now, damnit")
