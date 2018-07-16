(def choose
  (fn
    ([etc n k]
      (choose etc '() n k 0))
    ([etc c n k e]
      (if
        (== k 0)
        (etc c)
        (loop
          [index e]
          (if
            (< index n)
            (do
              (choose etc (cons index c) n (- k 1) (+ index 1))
              (recur (+ index 1)))))))))

;(choose println 4 2)
;(println)
;(choose println 6 5)
;(println)
;(choose println 0 1)
;(println)
;(choose println 4 0)
;
;Returns this
;(1 0)
;(2 0)
;(3 0)
;(2 1)
;(3 1)
;(3 2)
;
;(4 3 2 1 0)
;(5 3 2 1 0)
;(5 4 2 1 0)
;(5 4 3 1 0)
;(5 4 3 2 0)
;(5 4 3 2 1)
;
;
;()
