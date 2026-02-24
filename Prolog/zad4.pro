% Please define a predicate latin/2, which transforms Latin numbers into arabic numbers. 
% Latin numbers are supposed to be represented by ordinary lists, for example [x,l,v,i,i] denotes 47.

latin([],0).
latin([i],1).
latin([v],5).
latin([x],10).
latin([l],50).

latin([i,i|T], N) :- latin(T, N1), N is N1 + 2.
latin([i,v|T], N) :- latin(T, N1), N is N1 + 4.
latin([i,x|T], N) :- latin(T, N1), N is N1 + 9.
latin([x,l|T], N) :- latin(T, N1), N is N1 + 40.
latin([x,c|T], N) :- latin(T, N1), N is N1 + 90.
latin([c,d|T], N) :- latin(T, N1), N is N1 + 400.
latin([c,d|T], N) :- latin(T, N1), N is N1 + 900.

latin([H|T], N) :- latin([H], N1), latin(T, N2), N is N1 + N2.