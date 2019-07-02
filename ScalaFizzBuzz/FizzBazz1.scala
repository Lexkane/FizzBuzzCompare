package org.scalabound.scatdd

object FizzBuzz {
  
  def eval(x: Int) = (x % 3, x % 5) match {
    case(0, 0, _) => "FizzBuzz"
    case(0, _, _) => "Fizz"
    case(_, 0, _) => "Buzz"
    case _ => "" + x
  }

}