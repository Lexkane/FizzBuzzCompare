for i in range(1, 101):
    if i % 15 == 0:
        result = 'FizzBuzz'
    elif i % 5 == 0:
        result = 'Buzz'
    elif i % 3 == 0:
        result = 'Fizz'
    else:
        result = i
    print(result)