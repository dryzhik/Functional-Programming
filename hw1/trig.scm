; Определение функции для перевода градусов в радианы
(define (degrees-to-radians deg)
  (* (/ deg 180) pi)) ; Умножаем градусы на pi/180, чтобы получить радианы

; Основная функция, вычисляющая значения синуса, косинуса и тангенса
(define (compute-trig-values)
  (let loop ((deg 0)) ; Начинаем с угла 0 градусов
    (if (> deg 90)    ; Если угол превышает 90 градусов,
        '()           ; возвращаем пустой список
        (let* ((rad (degrees-to-radians deg)) ; Переводим угол в радианы
               (sin-value (sin rad))           ; Вычисляем синус
               (cos-value (if (= deg 90) 0 (cos rad))) ; Косинус, обрабатываем случай 90 градусов
               (tan-value (if (= deg 90) +inf.0 (tan rad)))) ; и тангенс, обрабатываем случай 90 градусов
          (cons (list deg sin-value cos-value tan-value) ; Добавляем значения в список
                (loop (+ deg 5))))))) ; Рекурсивно вызываем функцию для следующего угла

; Вывод заголовка таблицы
(display "Угол (град) | Синус | Косинус | Тангенс\n")
(display "----------------------------------------\n")

; Вычисление и вывод значений для каждого угла
(for-each (lambda (values)
            (let ((deg (car values))          ; Получаем значение угла
                  (sin-val (cadr values))    ; Синус
                  (cos-val (caddr values))   ; Косинус
                  (tan-val (cadddr values))) ; и тангенс из списка
              (display (format "~a          | ~a    | ~a     | ~a\n" deg sin-val cos-val tan-val))))
          (compute-trig-values)) ; Передаем результаты вычислений в функцию вывода
