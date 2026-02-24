% 1.
% a) Please define a predicate member(X,L), that is fulfilled if X appears in the list L.

member(X,[X|T]).
member(X,[H|T]) :- member(X,T).

% b) Please extend predicate member(X,L,), so that it is fulfilled, if X appears int L at an arbitrary level. 
% Examples:
% ?- member(4,[1,2,[3,4,[5]],[6,7]]). -> true
% ?- member(0,[1,2,[3,4,[5]],[6,7]]). -> false

member(X,[H|_]) :- is_list(H), member(X,H).


% 2.
% a) Please define a predicate suffix(L1,L2), that is fulfilled if list L1 equals the end of L2.
% Examples:
% ?- suffix([1,2,3],[1,2,3,4,5,6]). -> false
% ?- suffix([1,2,3],[3,4,5,1,2,3]). -> true

suffix(L,L).
suffix(L,[_|T2]) :- suffix(L,T2).

% b) Please define a predicate palindrom(L), that is fulfilled if list L contains a palindrom. 
% Examples: 
% ?- palindrom([a,b,a,a]). -> false 
% ?- palindrom([a,b,a,b,a]). -> true

last(X,[X|[]]).
last(X,[_|T]) :- last(X,T).

withoutlast([_],[]).
withoutlast([H|T1],[H|T2]) :- withoutlast(T1,T2).

palindrom([]).
palindrom([_]).
palindrom([H|T]) :- last(H,T), withoutlast(T,T2), palindrom(T2).


% 3.
% a) Please define a predicate split(X,L,L1,L2), that is fulfilled if list L1 contains the elements of L smaller than or equal X and L2 the ones greater than X. 
% Example:
% ?- split(5,[2,7,4,8,-1,5],L1,L2). -> L1 = [2,4,-1,5], L2 = [7,8]

split(_,[],[],[]).
split(X,[H|T],[H|S],G) :- H =< X, split(X, T, S, G).
split(X,[H|T],S,[H|G]) :- H > X, split(X, T, S, G).

% b) Please define a predicate split(P,L,L1,L2), that is fulfilled if list L1 contains the elements of L fulfilling predicate P and L2 the ones not filfilling P.
% Example:
% odd(X) :- 1 is X mod 2.
% ?- split(odd,[2,7,4,8,-1,5],L1,L2). -> L1 = [7,-1,5], L2 = [2,4,8]

split(P,[H|T],[H|L1],L2) :- call(P,H), split(P,T,L1,L2).
split(P,[H|T],L1,[H|L2]) :- not(call(P,H)), split(P,T,L1,L2).
split(_,[],[],[]).


% 4. 
% Binary trees T can be represented by terms: nil is the empty tree and node(X,L,R) is the tree with root X, left subtree L, and right subtree R.
% Please define the following predicates for binary trees.
% a) search(T,X), that is fulfilled if X appears in T.

search([X,_,_],X).
search([_,L,R],X) :- search(L,X); search(R,X).

% b) prod(T,P), that is fulfilled if P is the product of all elements in T.

% c) postorder(T,L), that is fulfilled if list L contains the element of T in post order.
