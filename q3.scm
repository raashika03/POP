#lang sicp
(define (divides? m n)
  (if (eq? (modulo n m) 0)
      #t
      #f))

(define (mark-true n)
  (cons n #t))

(define (mark-divisors n ns)
  (cond ((null? ns) '())
        ((and (unmarked? (car ns)) 
              (divides? n (car ns))) 
           (cons (cons (car ns) #f) (mark-divisors n (cdr ns))))
        (else (cons (car ns) (mark-divisors n (cdr ns))))))

(define (unmarked? n)
  (not (pair? n)))

(define (sieve x)
  (cond ((null? x) '())
        ((unmarked? (car x)) 
           (cons (mark-true (car x)) 
                 (sieve (mark-divisors (car x) (cdr x)))))
        (else (cons (car x) (sieve (cdr x))))))

(define l (list 2 3 4 5 6 7))
(sieve l)