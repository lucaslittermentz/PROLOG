sequ(1,X,X).
sequ(Z,X,Y) :- N1 is Z-1, sequ(N1,X,Y1), Y is (Z*X)+Y1.
seq(X,Y) :- sequ(X,X,Y).
seq(X) :- seq(X,Y), write('X = '), write(Y), nl.

fib(0,1).
fib(1,1).
fib(N,X) :- N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.
fib(X) :- fib(X,N), write('fib('), write(X), write(') = '), write(N), nl.

fat(0,1).
fat(X,Y) :-
	X>0,
	X1 is X-1,
	fat(X1,Y1),
	Y is X*Y1.
fat(X) :- fat(X,Y), write('fat('), write(X), write(') = '), write(Y), nl.