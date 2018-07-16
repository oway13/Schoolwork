(def op
  (fn [expr]
    (first expr)))

(def left
  (fn [expr]
    (second expr)))

(def right
  (fn [expr]
    (second (rest expr))))

(def make-if
  (fn [test then else]
    (list 'if test then else)))

(def if-test
  (fn [expr]
      (second expr)))

(def if-then
  (fn [expr]
    (second (rest expr))))

(def if-else
  (fn [expr]
    (second (rest (rest expr)))))

(def if?
  (fn [expr]
    (= (first expr) 'if)))


(def ifify
  (fn [prop]
    (cond
      (not (list? prop))
      prop
      (= (op prop) 'not)
      ;not
      (make-if (ifify (left prop)) 'false 'true)
      (= (op prop) 'and)
      ;and
      (make-if (ifify (left prop)) (ifify (right prop)) 'false)
      (= (op prop) 'or)
      ;or
      (make-if (ifify (left prop)) 'true (ifify (right prop)))
      (= (op prop) 'imply)
      ;imply
      (make-if (ifify (left prop)) (ifify (right prop)) 'true)
      (= (op prop) 'equiv)
      ;equiv
      (make-if (ifify (left prop)) (ifify (right prop))
        (make-if (ifify (right prop)) 'false 'true)))))

(def normalize
  (fn [ifs]
    (if
      (and (list? ifs) (list? (if-test ifs)) (if? (if-test ifs)))
      (normalize
        (make-if
         (if-test (if-test ifs))
          (normalize
            (make-if
              (if-then (if-test ifs))
              (normalize (if-then ifs))
              (normalize (if-else ifs))))
          (normalize
            (make-if
              (if-else (if-test ifs))
              (normalize (if-then ifs))
              (normalize (if-else ifs))))))
      ifs)))

(def substitute
  (fn [ifs sym bool]
    (if
      (not (list? ifs))
      (if
        (= ifs sym)
        bool
        ifs)
      (make-if
        (if-test ifs)
        (substitute (if-then ifs) sym bool)
        (substitute (if-else ifs) sym bool)))))

(def simplify
  (fn [norm]
    (cond
      (not (list? norm)) ;base case
      norm

      (= (if-test norm) 'true) ;rule 7
      (simplify (if-then norm))

      (= (if-test norm) 'false) ;rule 8
      (simplify (if-else norm))

      (and (= (if-then norm) 'true) (= (if-else norm) 'false)) ;rule 9
      (simplify (if-then norm))

      (= (if-then norm) (if-else norm)) ;rule 10
      (simplify (if-then norm))

      (and (symbol? (if-test norm)) (if? norm)
        (or (not (symbol? (if-then norm))) (not (symbol? (if-else norm))))) ;rule 11
      (do
        (simplify (substitute (if-else norm) (if-test norm) 'false))
        (simplify (substitute (if-then norm) (if-test norm) 'true))
        ))))

(def tautology?
  (fn [prop]
      (= (simplify (normalize (ifify prop))) true)))


;(println (ifify '(imply (not (and p q)) (or (not p) (not q)))))
;(println (normalize (ifify '(imply (not (and p q)) (or (not p) (not q))))))
;(println (simplify (normalize (ifify '(imply (not (and p q)) (or (not p) (not q)))))))
;(println (tautology? '(imply (not (and p q)) (or (not p) (not q)))))

;(println (tautology? '(or (and p q) (and (not p) (not q)))))
;(println (tautology? '(and (or p (not p)) (or (not p) p))))
;(println (tautology? '(equiv (or (and p q) (and p r)) (and p (or q r)))))