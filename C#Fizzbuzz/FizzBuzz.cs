class Program
{
    static void Main(string[] args)
    {
        Console.WriteLine(FizzBuzz(1,100))
    }
    static string FizzBuzz(int start, int count)
    {
        return Enumerable
                    .Range(start,count)
                    .Select(FizzBuzzOne)
                    .Aggregate((x,y)=>x+Enviroment.NewLine +y);
    }
    static string FizzBuzzOne(int i)
    {
        if (i%(3*5)==0) return "FizzBuzz";
        
        if (i%5)==0) return "Buzz";
        
        if (i%3)==0) return "Fizz";
        return i.ToString();
    }
}