(loop for i from 1 to 100 do
  (cond
    ((and
        (= (rem i 3) 0)
        (= (rem i 5) 0))
      (format t "FizzBuzz~%"))
    ((= (rem i 3) 0)
      (format t "Fizz~%"))
    ((= (rem i 5) 0)
      (format t "Buzz~%"))
    (T
      (format t "~a~%" i))))