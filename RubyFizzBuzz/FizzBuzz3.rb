whichfizz = ->(a, b, n) {
  if (a == 0 && b == 0)
    "FizzBuzz"
  elsif (a == 0)
    "Fizz"
  elsif (b == 0)
    "Buzz"
  else
    n.to_s
  end
}

fizzbuzz = ->(n) {
  whichfizz.(n % 3, n % 5, n)
}

p (1..100).map(&fizzbuzz)