
-module(fizzbuzz).

-export([run/0]).

-include_lib("eunit/include/eunit.hrl").

run() -> run(1).

run(N) -> lists:foreach(fun(S) -> io:format("~s~n", [S]) end, run(N, [])).

run(N, Res) when N > 100 -> Res;
run(N, Res) when (N rem 3 =:= 0) and (N rem 5 =:= 0) -> run(N + 1, Res ++ ["FizzBuzz"]);
run(N, Res) when N rem 3 =:= 0 -> run(N + 1, Res ++ ["Fizz"]);
run(N, Res) when N rem 5 =:= 0 -> run(N + 1, Res ++ ["Buzz"]);
run(N, Res) -> run(N + 1, Res ++ [integer_to_list(N)]).

fizz_test() -> [1, 2, "Fizz"] = run(3, []).