#lang sicp
;splitting the list using fun function
(define (fun pred lii)
(cond ((null? lii) '())
((pred (car lii))
(cons (car lii) (fun pred (cdr lii))))
(else (fun pred (cdr lii))))
)

 (define (quicksort lst)
  (cond
    ((or (null? lst) ; empty list is sorted
         (null? (cdr lst))) ; single-element list is sorted
     lst)
    (else
      (let ((pivot (car lst)) ; Select the first element as the pivot
            (rest (cdr lst)))
        (append
          (quicksort (fun (lambda (x) (< x pivot)) rest)) 
          (list pivot) 
          (quicksort (fun (lambda (x) (>= x pivot)) rest))))))) 

;main function to do quick sort on a list of integers
(define (make-qsort comp-fun lst)
  (if (eq? comp-fun <)
      (quicksort lst)
      (reverse (quicksort lst))))
