(defn fizzbuzz
  ([i]
   (cond
     (=0 (mod i (* 3 5 ))) "FizzBuzz"
     (=0 (mod i (*5))) "Buzz"
     (=0 (mod i (*3))) "Fizz"
     :else (str i )))
  ([start end]
   (apply str (interpose "\n"
                         (map fizzbuzz(range start end))))))

