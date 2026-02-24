% Prolog odpowiada na pytania TAK/NIE
% :- => IF
% , -> AND
% ; -> OR

% FACTS
parent(tom,bob).
parent(tom,liz).
parent(pam,bob).

% QUERIES (pytania)
?-parent(tom,bob).
% -> true

?-parent(bob,X).
% -> X=ann;
% -> X=pat;
% Ten fakt przewiduje że Bob jest rodzicem wszystkiego!

% RULES (reguły)

mother(X,Y):-female(X),parent(X,Y).
grandparent(X,Y):-parent(X,Z),parent(Z,Y).

female(pam).
?-mother(pam,bob).
% -> true


% LISTY

length1([],0). % <- fakt

length1([HEAD|TAIL],N):-length1(TAIL,M),N is M+1. % <- reguła
% zamiast HEAD można dać _ bo nie będzie używany

?-length1([1,2],2)
% -> length([1,2],2)
% -> length([2],M), 2=M+1
% -> length([],P), M=P+1, 2=M+1 (P=0 bo length([],0)) (kolejne reguły się rekurencyjnie dodają)
% -> M=0+1=1
% -> 2=1+1
% -> True

% W Prologu 2 != 0 + 1 + 1
% 'is' zamiast '=' sprawi że Prolog to policzy
% generalnie 'is' i '=' używamy zamiennie w zależności od tego które zadziała ¯\_(ツ)_/¯