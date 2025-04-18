#lang racket

(define (two-sum nums target)
  (let loop1 ((i 0))
    (if (>= i (length nums))
        '()
        (let loop2 ((j (+ i 1)))
          (cond
            [(>= j (length nums)) (loop1 (+ i 1))]
            [(= (+ (list-ref nums i) (list-ref nums j)) target)
             (list i j)]
            [else (loop2 (+ j 1))])))))