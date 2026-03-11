% Please define the following predicates for lists.

% a) last(X,L), which is fulfilled if X is the last element of L.

last(X,[X]).
last(X,[_|Z]) :- last(X,Z).

% b) delete(X,L1,L2), which is fulfilled if L2 is the list L1 without the element X.

delete(_,[],[]).
delete(X,[H1|T1],[H2|T2]) :- H2 = H1, H1 \= X, delete(X,T1,T2).
delete(X,[X|T1],L2) :- delete(X,T1,L2).

% c) delete(L1,L2), which is fulfilled if L2 is the list L1 without L1's last three elements.

delete([],[]).
delete([_],[]).
delete([_,_],[]).
delete([_,_,_],[]).
delete([H1|T1],[H2|T2]) :- H1 = H2, delete(T1,T2).

% d) reverse(L1,L2), which is fulfilled if L2 is the list L2 in reversed order.

reverse(L1,L2) :- reverse(L1, L2,[]).
reverse([],L2,L2).
reverse([H1|T1],L2,A) :- reverse(T1,L2,[H1|A]).

% e) evenlength(L) and oddlength(L), which are fulfilled if the length of L is even and odd, respectively.

evenlength([]).
evenlength([_,_|T]) :- evenlength(T).

oddlength([_]).
oddlength([_,_|T]) :- oddlength(T). 

% f) shift(L1,L2), which is fulfilled if L2 the list L1 after one rotation to left. 
% Example: ?- shift([1,2,3,4,5],L). -> L = [2,3,4,5,1] 

shift([H1|T1],L2) :- shift(T1,L2,H1).
shift([H1|T1],[H2|T2],X) :- H1 = H2, shift(T1,T2,X).
shift([],[X],X).

% g) quadrat(L1,L2), which is fulfilled if L2 contains the squares of the elements of L1.
% Example: ?- quadrat([1,2,3,4,5],L). -> L = [1,4,9,16,25] 

quadrat([],[]).
quadrat([H1|T1],[H2|T2]) :- H2 is H1*H1, quadrat(T1,T2).

% h) combine(L1,L2,L3), which is fulfilled if L3 contains the pairs of the elements of L1 and L2.
% Example: ?- combine([1,2,3,4],[a,b,c,d],L). -> L = [[1,a],[2,b],[3,c],[4,d]] 

combine([],[],[]).
combine([H1|T1],[H2|T2],[H3|T3]) :- H3 = [H1,H2], combine(T1,T2,T3).

% i) palindrom(L), which is fulfilled if L contains a palindrom.
% Example:
% ?- palindrom([a,b,c]). -> false
% ?- palindrom([a,b,c,d,c,b,a]) -> true

palindrom(L) :- reverse(L,L).

% j) p(X,L,Y,Z), which is fulfilled if Y is the predecessor of X in L and Z is the successor of X in L.
% Example: p(3,[1,2,3,4,5],2,4) -> true

p(X,[Y,X,Z|_],Y,Z).
p(X,[_|T],Y,Z) :- p(X,T,Y,Z).

% k) q(X,L1,L2), which is fulfilled if L2 is the beginning of the list L1 up to the (first) double occurence of element X.
% Example: q(3,[1,2,3,3,1,2,4],[1,2,3,3]) -> true

q(X,[X,X|_],[X,X]).
q(X,[H|T1],[H|T2]) :- q(X,T1,T2).