import std.stdio;
import std.conv;

string fizzbuzz(immutable ulong num)
{
	return (num % 15 == 0)? "FizzBuzz": (num % 3 == 0)? "Fizz": (num % 5 == 0)? "Buzz": num.to!string();
}

string genfbtable(immutable ulong num)
{
	string ret = "[\"0\",";
	for(ulong i = 1; i <= num; i++)
	{
		ret ~= '"' ~ fizzbuzz(i) ~ '"';
		ret ~= i == num ? "]" : ",";
	}
	return ret;
}

void main()
{
	immutable ulong num = 100;
	string[] table = mixin(genfbtable(num));
	for(ulong i = 1; i <= num; i++)
		writeln(i, " ", table[i]);
}