divisible :: Int -> Int -> Bool
divisible x y = x `rem` y == 0

showInt :: Int -> String
showInt x | x `divisible` 15 = "FizzBuzz"
          | x `divisible` 3  = "Fizz"
          | x `divisible` 5  = "Buzz"
          | otherwise        = show x

fizzbuzz :: [String]
fizzbuzz = [showInt x | x <- [1..100]]

main = mapM_ putStrLn fizzbuzz