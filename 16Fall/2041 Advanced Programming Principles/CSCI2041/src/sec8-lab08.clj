(declare lambda?)

(def lambda-symbol?
  (fn [name scope]
    (cond
      (not (or (list? scope) (vector? scope)))
      false
      (empty? scope)
      false
      (contains? (first scope) name)
      true
      :else
      (recur (rest scope) name))))

(def lambda-parameters?
  (fn [P]
    (and
      (or (list? P) (vector? P))
      (distinct? P))))

(def lambda-fn?
  (fn [L scope]
    (if
      (lambda-parameters? (second L))
      (if
        (list? (second (rest L)))
        (lambda? (second (rest L)) scope)
        (lambda-symbol? (second (rest L)) scope))
      false)))

(def lambda-call?
  (fn [L scope]
    (cond
      (list? (first L))
      (lambda? (first L))
      (symbol? (first L))
      (lambda-symbol? (first L) scope)
      :else
      (recur (rest L) scope))))

(def lambda?
  (fn
    ([L]
      (lambda? L '()))
    ([L scope]
      (if
        (list? L)
        (if
          (= (first L) 'fn)
          (lambda-fn? L (cons (second L) scope))
          (lambda-call? L scope))
        (lambda-symbol? L scope)))))


;true
(println (contains?))
(println (lambda? '(fn [a] a)))
;(println (lambda? '(fn [a] (fn [] a))))
;(println (lambda? '(fn [a] (fn [a] a))))
;(println (lambda? '(fn [a] (fn [b] a))))
;(println (lambda? '(fn [a] ((fn [b] a) a))))
;(println (lambda? '(fn [a b] a)))
;(println (lambda? '(fn [a b] b)))
;(println (lambda? '(fn [a b] (a (b)))))
;(println (lambda? '(fn [a b] (a (fn [b] a)))))
;(println (lambda? '(fn [a b c] (a (fn [d e] (a b)) c))))

;false
;(println (lambda? 'a))
;(println (lambda? '(a)))
;(println (lambda? '(a b)))
;(println (lambda? '(fn [] a)))
;(println (lambda? '(fn [a] b)))
;(println (lambda? '(fn [a] (a b))))
;(println (lambda? '(fn [a b] (c (fn [c] (c a))))))
;(println (lambda? '(fn [a b] ((fn [c] (a b)) c))))
