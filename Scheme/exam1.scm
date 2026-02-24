; 1.
; a) Please define a function (delete x l), whose value is the list l without the first occurrence of x.

(define (delete x l)
  (cond
   ((null? l) l)
   ((eq? (car l) x) (cdr l))
   (else (cons (car l)(delete x (cdr l))))
   )
)

(define a '(1 2 3 4 2))
(delete 2 a)


; b) Please define a function (count x l), whose value is the number of occurrences of x in list l.

(define (count x l)
  (cond
   ((null? l) 0)
   ((eq? (car l) x) (+ (count x (cdr l)) 1))
   (else (count x (cdr l)))
   )
)

(define a '(1 2 3 4 2 2 3))
(count 3 a)


; 2.
; a) Please define a function (filter pred l) for a one-argument predicate pred, whose value is the list containing all element of the list l fulfilling pred. 
; Examples:
; > (filter even ’(4 3 5 6))
; ’(4 6)
; > (filter list? ’((4 3) 7 (1 2 3) 10)
; ’((4 3) (1 2 3))

(define (filter pred l)
  (cond
   ((null? l) '())
   ((pred (car l)) (cons (car l) (filter pred (cdr l))))
   (else (filter pred (cdr l)))
   )
)

(define (smallerthanthree x)
	(< x 3)
)

(define a '(1 2 3 4 2 2 3))
(filter smallerthanthree a)

; b) Suppose binary trees are represented as lists:
; (element left-subtree right-subtree)
; The empty tree is represented by the empty list. 
; Please define a function (inorder t) for a binary tree in the above representation, whose value is the list of elements of t in inorder. 
; Example:
; (inorder ’(4 (3 () ()) (2 (9 () ()) (7 () ()))))
; -> ’(3 4 9 2 7)

;     4
;    / \
;   3   2
;      / \
;     9   7

(define (inorder t)
  (cond
   ((null? t) '())
   ((pair? t)
    (append (inorder (cadr t))
            (list (car t))
            (inorder (caddr t))))
   (else (list t))))

(define a '(4 (3 () ()) (2 (9 () ()) (7 () ()))))
(inorder a)


; 3. Suppose the following definitions are given.
(define a 2)

(define (p a)
  (define (pp b)
    (set! a (* 2 b))
    (+ a b))
  (pp 2)
)
; Using the environment model please show how the expression (p 3) is evaluated.

; 1. (p 3)
; 2. (pp 2) inside (p 3)
; 3. a is set to b*2=4 inside (pp 2)
; 4. (+ 4 2)
; 5. 6
