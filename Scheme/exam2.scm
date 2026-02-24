; 1.
; a) Define a function (member x l), whose value is #t, if x appears in list l and #f otherwise.

(define (member x l)
  (cond
    ((null? l) #f)
    ((eq? (car l) x) #t)
    (else (member x (cdr l)))
  )
)

(member 3 '(1 2 4))

; b) Define a function (delete x l), whose value is the list l without all occurences of x.
; Attention! In at least one part you have to use the following function fold:

(define (fold f e l)
  (if (null? l) 
    e
    (f (car l) (fold f e (cdr l)))
  )
)
; e -> wartosc poczatkowa
; f -> funkcja wykonywana na kolejnych elementach listy
; l -> lista
; np. (fold + 0 '(1 2 3 4 5)) -> 15

(define (delete x l)
  (fold
    (lambda (elem acc) ; -> f
      (if (= elem x)
          acc
          (cons elem acc)
      )
    )
    '() ; -> e
    l)
)

; 2.
; a) Define a function (twice l), whose value is the list in which all elements appear twice - in the original order of their occurence.
; Example:
; (twice '(4 3 5 6)) -> '(4 4 3 3 5 5 6 6)

(define (twice l)
  (cond
    ((null? l) '())
    (else (cons (cons (car l) (car l)) (twice (cdr l))))
  )
)

; b) Define a function (sum f r) for a one-argument function f, whose value is f(i) for i=0 to r.
; Example:
; (sum square 4) -> 30 = 1 + 4 + 9 + 16

(define (sum f r)
  (cond
  ((eq? r 0) 0)
  (else (+ (f r) (sum f (- r 1))))
  )
)

(define (square x)
  (* x x)
)

(sum square 4) ; -> 30



; 3. 
; a) Suppose the following function definitions are given.
; (define (alternate x) (alternate (- x)))
; (define (test x y z) (if (= x y) 0 z))
; Show, how the following expressions get evaluated.
; (i) (if (= 1 1) 0 (alternate 3))

; (ii) (test 1 1 (alternate 3))




; 4.
; a) Define a predicate reverse(L1,L2), that is fulfilled if L2 is list in reversed order.
; Example:
; ?- reverse([1,2,3,4],L) -> L = [4,3,2,1]

reverse(L1,L2) :- reverse(L1,L2,[]).
reverse([],L,L).
reverse([H1|T1],L2,A) :- append([H1],A,R), reverse(T1,L2,R).

; b) Define a predicate split(X,L,L1,L2), that is fulfilled, if list L1 contains the elements of L smaller than X and L2 elements greated than X.
; Example:
; ?- split(5,[2,7,4,8,-1,5],L1,L2) -> L1 = [2,4,-1], L2 = [7,8]

split(_,[],[],[]).
split(X,[H|T],[H|S],G) :- H =< X, split(X, T, S, G).
split(X,[H|T],S,[H|G]) :- H > X, split(X, T, S, G).


; 5.
; Suppose the following definition of a predicate append is given.

append([],L,L).
append([X|L1],L2,[X|L3]) :- append(L1,L2,L3).

; Give the answer trees for the following queries.
; a) ?- append([Z],[3,4],[2,3,4]).
; b) ?- append([2],[Z,4],[Z,3,4]).