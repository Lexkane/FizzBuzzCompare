package main

import (
  "fmt"
)

func is_divisible(x int, y int) bool {
  return x%y == 0
}

func show_int(x int) string {
  switch {
  case is_divisible(x, 15):
    return "FizzBuzz"
  case is_divisible(x, 3):
    return "Fizz"
  case is_divisible(x, 5):
    return "Buzz"
  default:
    return fmt.Sprintf("%d", x)
  }
}

func main() {
  for i := 0; i <= 100; i++ {
    fmt.Println(show_int(i))
  }
}
