#lang sicp
;Recursive function to find length of the list, lst
(define (len lst)
  (if (null? lst)0
      (+ 1 (len(cdr lst)))))

;function which computes the minimum no. of moves given a path represented as a list of 0s and 1s
(define (fewest-moves path)
  (if (= (car path) 0)
  ;if first element of the list is zero
      (if (>= 4 (len path)) 1 ;if length of the list is greater than or equal to four then follow black square move
          (if (= (cadr path) 0); incrmenting the moves by 1
           (+ 1 (fewest-moves (cdr path)))
           (+ 1 (fewest-moves (cddddr path)))
           ))
  ;if first element of the list is one
      (if (>= 2 (len path)) 1 ;if length of the list is greater than or equal to two then follow white square move
          (if (= (caddr path) 1) ; incrmenting the moves by 1
              (+ 1 (fewest-moves (cdr path)))
              (+ 1 (fewest-moves (cddr path)))
           ))
      ))
                    
