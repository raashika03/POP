#lang sicp
(define (stream-car s)
  (car s))

(define (stream-cdr s)
  (force (cdr s)))

(define (stream-map proc stream)
  (if (stream-null? stream)
      the-empty-stream
      (cons-stream (proc (stream-car stream))
                   (stream-map proc (stream-cdr stream)))))

(define (partial-sums stream)
  (let ((first (stream-car stream)))
    (cons-stream
      first
      (stream-map (lambda (x) (+ x first)) (partial-sums (stream-cdr stream))))))

(define (integers-starting-from n)
  (cons-stream n (integers-starting-from (+ n 1))))

(define integers (integers-starting-from 1))


(stream-car (partial-sums integers))
(stream-car (stream-cdr (partial-sums integers)))