% A binary tree T is either empty - represented by the term nil - or consists of an element X (the root element) and two subtrees L and P - represented by the term node(X,L,P).
% Please define the following predicates for binary trees.

% a) size(T,N), which is fulfilled if N is the number of elements of tree T.

size(nil,0).
size(node(_,L,R),N) :- size(L,H1), size(R,H2), N is H1 + H2 + 1.

% size(node(1,node(2,nil,nil),node(3,nil,node(4,nil,nil))), X) -> 4
%       1
%      / \
%     2   3
%          \
%           4

% b) search(T,X), which is fulfilled if X appears in tree T.

search(node(X,_,_),X).
search(node(_,L,R),X) :- search(L,X); search(R,X).

% c) max(T,X), which is fulfilled if X is the largest element of tree T.

maxtree(node(X,nil,nil),X).
maxtree(node(H,L,nil), X) :- maxtree(L, XL), X is max(H, XL).
maxtree(node(H,nil,R), X) :- maxtree(R, XR), X is max(H, XR).
maxtree(node(H,L,R), X) :- maxtree(R, XR), maxtree(L,XL), X is max(H, max(XR, XL)).

% d) times(N,T1,T2), which is fulfilled if T2 is the tree T1 in which each element has been multiplied with N.

times(_,nil,nil).
times(N,node(H1,L1,R1),node(H2,L2,R2)) :- H2 is H1*N, times(N,L1,L2), times(N,R1,R2).

% e) preorder(T,L), which is fulfilled if L is the list of T's elements in preorder.

preorder(nil, []).
preorder(node(H, L, R), [H|T]) :-
    preorder(L, Left),
    preorder(R, Right),
    append(Left, Right, T).