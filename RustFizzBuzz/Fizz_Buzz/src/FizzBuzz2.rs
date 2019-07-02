fn main() {
  for n in range(1, 101) {
    println(
      if n % 15 == 0 {
        ~"FizzBuzz"
      } else if n % 3 == 0 {
        ~"Fizz"
      } else if n % 5 == 0 {
        ~"Buzz"
      } else {
        n.to_str()
      }
    );
  }
}