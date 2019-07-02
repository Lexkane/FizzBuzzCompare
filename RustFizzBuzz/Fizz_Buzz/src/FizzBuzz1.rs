use std::fmt;
 
enum FizzBuzzItem {
    Fizz,
    Buzz,
    FizzBuzz,
    Number(i32),
}
 
impl fmt::Display for FizzBuzzItem {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match *self {
            FizzBuzzItem::Fizz => f.write_str("Fizz"),
            FizzBuzzItem::Buzz => f.write_str("Buzz"),
            FizzBuzzItem::FizzBuzz => f.write_str("FizzBuzz"),
            FizzBuzzItem::Number(num) => write!(f, "{}", num),
        }
    }
}
 
impl fmt::Debug for FizzBuzzItem {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        fmt::Display::fmt(self, f)
    }
}
 
fn fizz_buzz(i: i32) -> FizzBuzzItem {
    if i % 15 == 0 {
        FizzBuzzItem::FizzBuzz
    } else if i % 5 == 0 {
        FizzBuzzItem::Buzz
    } else if i % 3 == 0 {
        FizzBuzzItem::Fizz
    } else {
        FizzBuzzItem::Number(i)
    }
}
 
fn main(){
    for i in 1..101 {
        println!("{}", fizz_buzz(i));
    }
    for f in (1..101).map(fizz_buzz) {
        println!("{}", f);
}

 }