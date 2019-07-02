def divisible?(x, y)
  x % y == 0
end

def show_int(x)
  if divisible? x, 15
    'FizzBuzz'
  elsif divisible? x, 3
    'Fizz'
  elsif divisible? x, 5
    'Buzz'
  else
    x.to_s
  end
end

(1..100).each do |x|
  puts show_int x
end