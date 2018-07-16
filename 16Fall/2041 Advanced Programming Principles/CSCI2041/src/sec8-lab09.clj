(def enext
  (fn [x index]
    (if
       (== index 0)
      1
      (* (/ x index) (enext x (- index 1))))))


(def euler
  (fn
    ([x]
      (euler x 0))
    ([x index]
      (list
        (enext x index)
        (fn []
          (euler x (+ index 1)))))))

(def next-term
  (fn [terms]
    (first terms)))

(def remaining-terms
  (fn [terms]
    ((second terms))))

(def sum
  (fn [terms epsilon]
    (if
      (< (first terms) epsilon)
      0
      (+ (next-term terms) (sum (remaining-terms terms) epsilon)))))


'(println (sum (euler 1.0) 0.000001))