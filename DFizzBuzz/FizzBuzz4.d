import std.stdio;

void main() {
    for (uint i = 0; i < 100; i++) {
        if (i%5 && i%3) write(i);
        if (!(i%3)) write("Fizz");
        if (!(i%5)) write("Buzz");
        writeln();
    }
}