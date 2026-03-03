% Please define predicates plus/3, times/3 and sum-up/2 (using recursion).
% Predicate sum-up(N,X) is fulfilled, if X is the sum from 0 to N.

% a)

plus(X,0,X).
plus(X,Y,Z) :- 
    X2 is X + 1, 
    Y2 is Y - 1,
    Y > 0,
    plus(X2,Y2,Z).

% b)

times(0,_,0).
times(X,1,X).
times(X,Y,Z) :-
    Y > 0,
    Y2 is Y - 1,
    times(X, Y2, Z2),
    Z is Z2 + X.

% c)

sum-up(0,0).
sum-up(N,X) :-
    N > 0,
    N2 is N - 1,
    sum-up(N2,X2),
    X is X2 + N.