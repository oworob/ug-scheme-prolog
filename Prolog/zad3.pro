% Suppose the following predicate f/2 is given:

f(1,one).
f(s(1),two).
f(s(s(1)),three).
f(s(s(s(X))),N) :- f(X,N). 

% How does Prolog answer to the following questions?

f(s(1),A)
% -> A = two

f(s(s(1)),two)
% -> false

f(s(s(s(s(s(s(1)))))),C)
% -> f(s(s(s((1)))),C) -> f(1,C) -> C = one

f(D,three)
% -> D = s(s(1))