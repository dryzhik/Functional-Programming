(define data '(3 4 2 7 5 8 1 0 9 4 6 3))

(define (Quick_sort lst)
    (if (null? lst)
        '()
        (let* ((pivot   (car lst))
               (smaller (filter (lambda (x) (< x pivot)) (cdr lst)))
               (larger  (filter (lambda (x) (>= x pivot)) (cdr lst)))
              )
              (append (Quick_sort smaller) (list pivot) (Quick_sort larger))
        )
    )
)

(format #t "Quick_sort ~a\n" (Quick_sort data))