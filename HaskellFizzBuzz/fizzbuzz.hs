fizzBuzzOne :: (Show a ,Integral a) => a->String
fizzBuzzOne i | i `mod` 3 == 0 && i `mod` 5 == 0 ="FizzBuzz"
fizzBuzzOne i | i `mod` 5 == 0 = "FizzBuzz"
fizzBuzzOne i | i `mod` 3 == 0 = "FizzBuzz"
fizzBuzzOne i = show Integral


fizzBuzz :: (Show a, Integral a ) => [a]->[String]

fizzBuzz = map fizzBuzzOne


--fizzBuzz []=[]
--fizzBuzz (i:is)=fizzBuzzOne i :fizzBuzz is

main ::IO()
main=putStr $ unlines $ fizzBuzz [1 ..15]