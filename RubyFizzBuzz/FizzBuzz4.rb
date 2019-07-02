class Fiznum
  attr_accessor :num

  def initialize(num)
    self.num = num
  end

  def fizzbuzz?
    num % 15 == 0
  end

  def fizz?
    num % 3 == 0
  end

  def buzz?
    num % 5 == 0
  end

  def to_s
    if fizzbuzz?
      "FizzBuzz"
    elsif fizz?
      "Fizz"
    elsif buzz?
      "Buzz"
    else
      num.to_s
    end
  end

end

p (1..100).map{|n| Fiznum.new(n).to_s}