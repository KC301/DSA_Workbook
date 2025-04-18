#lang racket

(define (two-sum nums target)
  (define ht (make-hash))

  (define (loop lst i)
    (cond
      [(null? lst) '()]
      [else
       (define num (car lst))
       (define complement (- target num))
       (cond
         [(hash-has-key? ht complement)
          (list (hash-ref ht complement) i)]
         [else
          (hash-set! ht num i)
          (loop (cdr lst) (+ i 1))])]))

  (loop nums 0))