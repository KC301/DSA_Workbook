#lang racket

(define (two-sum nums target)
  (define indexed (map cons nums (build-list (length nums) identity)))
  (define sorted (sort indexed < #:key car))

  (define (search left right)
    (cond
      [(>= left right) '()]
      [else
       (define sum (+ (car (list-ref sorted left)) (car (list-ref sorted right))))
       (cond
         [(= sum target)
          (list (cdr (list-ref sorted left)) (cdr (list-ref sorted right)))]
         [(< sum target) (search (+ left 1) right)]
         [else (search left (- right 1))])]))

  (search 0 (- (length sorted) 1)))