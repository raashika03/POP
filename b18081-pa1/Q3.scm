#lang sicp


(define (for i end-cond end-fn fn var)
    (if (end-cond i)
      var
      (for (end-fn i) end-cond end-fn fn (fn var))
    )
)

; function to check for positiveness
(define (is-positive x)(> x 0))

;used fermat test for finding primeness
(define (square x)(* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))     


(define (is-prime n)
  (define (test a)
    (= (expmod a n n) a))
  (define (iter a)
    (if (< a n)
        (if (test a)
            (iter (+ a 1))
            #f)
        #t))
  (iter 1))



;recursive function to find the filtered element after application of predicates on them 
; lii- list of integers
(define (recur_filter pred lii)
(cond ((null? lii) '())
((pred (car lii))
(cons (car lii) (recur_filter pred (cdr lii))))
(else (recur_filter pred (cdr lii)))))



;a recursive function to create a list of integers from lower bound to uppper bound so that it can be used as the main list for filtering the elements after application of predicates on them
(define (lst-int lb ub)
	;base condition
	;if lower bound is greater than upper bound then return an empty list
(if (> lb ub)
'()
;else cons function is creating pair which is used for creating list of elements
; first lower bound is paired then lb is incremented and recursively paired in the list
(cons lb (lst-int (+ lb 1) ub))))

;function filter-all that takes a list of predicates, a lower bound and an upper bound (in order), and returns a list of integers in the (inclusive) range that satisfy all the predicates
;lb- lower bound
;ub- upper bound
;input format (filter-all (list is-positive is-prime) -4 10)
(define (filter-all lst lb ub)
  (define z(if (<= lb 2) (recur_filter (list-ref lst 0) (lst-int 2 ub))
    (recur_filter (list-ref lst 0) (lst-int lb ub))
    ))
  (recur_filter (list-ref lst 1) z ))