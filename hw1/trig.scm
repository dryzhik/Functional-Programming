(define Pi 3.1415926)

(define (deg_to_rad angle)
 (* ( / angle 180.0) Pi)
)


(format #t "Угол    | Синус |Косинус| Тангенс\n") 

(let trig( (i 0))
 (if (<= i 180)
        (begin 
                (cond
                    ((= i 90) (begin (format #t "90\t| 1.00\t| 0.00\t| Не определен\n")))
                    (else (format #t "~a\t| ~5f\t| ~5f\t| ~5f\n"
                                    i 
                                    (sin (deg_to_rad i))
                                    (cos (deg_to_rad i))
                                    (tan (deg_to_rad i))
                            )
                        )
                )
                (trig (+ i 5))
        ) 
    )
  'quit
 )

