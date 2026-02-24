% 4.
% a) Please define a predicate member2(X,L), that is fulfilled if the element X appears at least two times in the list L.

member2(X,L) :- member2(X,L,0).
member2(X,[H|T],A) :-  H \= X, member2(X,T,A).
member2(X,[X|T],A) :- A2 is A + 1, member2(X,T,A2).
member2(_,[],2).

member2(3,(1,2,3,2,2,1)) % -> false

% b) Please define a predicate down(N,L), that is fulfilled if L is the list [N,...0]

down(X,[X|T]) :- down(X,T).
down(X,[H1,H2|T]) :- H2 is H1 - 1, down(X,[H2|T]).
down(_,[0]).

down(4,[4,3,2,1,0]) % -> true


% 5. Suppose the following definition of a predicate append is given.
append([],L,L).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).
% Using answer trees please show how Prolog answers to the query:
% ?- append([1,2],[Z],[1,2,3]).

?-append([1,2],[Z],[1,2,3]).
?-append([1|2],[Z],[1|2,3]). -> L1 = [2], L2 = [Z], L3 = [2,3] -> ?-append([2],[Z],[2,3]).
?-append([2|],[Z],[2|3]). -> L1 = [], L2 = [Z], L3 = [3] -> ?-append([],[Z],[3]).
?-append([],[Z],[3]). -> ?-append([],L,L). -> L = [Z] = [3] -> Z = 3