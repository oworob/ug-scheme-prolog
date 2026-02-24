% A predicate describing the length of a list can be defined as follows.

length2(0,[]).
length2(N,[_|L]) :- length2(M,L), N is M+1.

% Please define predicates member/2 oraz fac/2, fib/2 i gcd/3 analogous.

member2(X,[X|_]).
member2(X,[_|T]) :- member2(X,T).

fac2(0,1).
fac2(N,M) :-
    N>0, % otherwise it wil look for more results for -1,-2,-3....
    N2 is N-1,
    fac2(N2,M2),
    M is N*M2.

fib2(0,0).
fib2(1,1).
fib2(I,N) :-
    I>1, % same as fac
    Ip is I-1,
    Ipp is I-2,
    fib2(Ip, Np),
	fib2(Ipp, Npp),
    N is Np + Npp.

gcd2(N,N,N).
gcd2(N,M,D) :- 
    N > M, 
    N2 is N-M,
    gcd2(N2,M,D).
gcd2(N,M,D) :- 
    M > N, 
    M2 is M-N,
    gcd2(N,M2,D).