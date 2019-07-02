let fizzbuzz:(Int) -> String = { i in
    switch (i % 3 == 0, i % 5 == 0)
    {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    default:
        return "\(i)"
    }
}