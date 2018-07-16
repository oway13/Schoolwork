(defmacro when1 [test & forms]
  (list 'if test (cons 'do forms)))

(when1 (= x 0) (println "x is 0") 5)

;Macro Expansion on our when1 call
; '(if
;     (= x 0)
;     (do
;       (println "x is 0")
;       5))
;This code is substituted for the
;original call to when1 during compilation

(defmacro none [& forms]
  (cons 'and
    (map
      (fn [form]
        (list 'not form))
      forms)))


