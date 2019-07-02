for i in 1:50
    i % 3 == 0 && i % 5 == 0 ? println(i, "FizzBuzz ") : 
    i % 3 == 0 ? println(i, "Fizz ") : 
    i % 5 == 0 ? println(i, "Buzz ") : 
    println(i)
end