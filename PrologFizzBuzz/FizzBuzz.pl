
fizzbuzzify(X, Y) :- 0 is X mod 15, Y = 'fizzbuzz', !.
fizzbuzzify(X, Y) :- 0 is X mod 5, Y = 'buzz', !.
fizzbuzzify(X, Y) :- 0 is X mod 3, Y = 'fizz', !.
fizzbuzzify(X, Y) :- Y is X, !.

fizzbuzz(X) :- X > 1, Xprev is X-1, fizzbuzz(Xprev).
fizzbuzz(X) :- fizzbuzzify(X, W), print(W), nl.

fizzbuzz :- forall(
				member(Y, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]), 
					(fizzbuzzify(Y, Z), print(Z), nl)
			).