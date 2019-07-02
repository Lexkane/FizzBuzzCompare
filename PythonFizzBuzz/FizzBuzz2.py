class FizzBuzzItem:
 
    def __init__(self, value):
        self._value = value
 
    def __str__(self):
        if self is FizzBuzzItem.Fizz:
            return "Fizz"
        elif self is FizzBuzzItem.Buzz:
            return "Buzz"
        elif self is FizzBuzzItem.FizzBuzz:
            return "FizzBuzz"
        else:
            return str(self._value)
 
    def __repr__(self):
        return str(self)
 
    @staticmethod
    def Number(number):
        return FizzBuzzItem(number)
 
# Pretend that these are opaque
FizzBuzzItem.Fizz = FizzBuzzItem(object())
FizzBuzzItem.Buzz = FizzBuzzItem(object())
FizzBuzzItem.FizzBuzz = FizzBuzzItem(object())
 
def fizz_buzz(i):
    if i % 15 == 0:
        return FizzBuzzItem.FizzBuzz
    elif i % 5 == 0:
        return FizzBuzzItem.Buzz
    elif i % 3 == 0:
        return FizzBuzzItem.Fizz
    else:
        return FizzBuzzItem.Number(i)
 
for i in range(1, 101):
    print(fizz_buzz(i))

for f in map(fizz_buzz, range(1, 101)):
    print(f)
