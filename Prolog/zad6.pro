% Predicate fac/2 can also be defined as follows:

fac(X,N) :- fac(X,N,1).
fac(0,A,A).
fac(X,N,A) :- X > 0, A1 is A * X, X1 is X - 1, fac(X1,N,A1).

% Please define the predicates from exercise 5 using this technique. (Note: The variable A of fac/3 is called accumulator.)

% a)

plus(X,Y,Z) :- plus(X,Y,Z,Y). % last argument -> initial accumulator value
plus(0,_,A,A).
plus(X,Y,Z,A) :- 
    X > 0, 
    A2 is A + 1,
    X2 is X - 1,
    plus(X2,Y,Z,A2).

% b)

times(X,Y,Z) :- times(X,Y,Z,0).
times(0,_,A,A).
times(X,Y,Z,A) :-
    X > 0,
    X2 is X - 1,
    A2 is A + Y,
    times(X2,Y,Z,A2).

% c)

sum-up(N,X) :- sum-up(N,X,0).
sum-up(0,A,A).
sum-up(N,X,A) :-
    N > 0,
    N2 is N - 1,
    A2 is A + N,
    sum-up(N2,X,A2).

% d)

fib(I,N) :- fib(I,N,0,1).
fib(0,A,A,_).
fib(I,N,A,B) :-
    I > 0,
    I2 is I - 1,
    B2 is B + A,
    A2 is B,
    fib(I2, N, A2, B2).