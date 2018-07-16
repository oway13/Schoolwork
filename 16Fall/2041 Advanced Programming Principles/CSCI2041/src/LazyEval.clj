(def make-fibs
  (fn [f1 f2]
    (list f1
      (fn []
        (make-fibs f2 (+ f1 f2))))))

(def fibs-first
  (fn [fibs]
    (first fibs)))

(def fibs-rest
  (fn [fibs]
    ((second fibs))))  ;extra pair of parens to call the function
                       ;in second with no args

;Walks through an infinite list, grabbing only the values that it asks for



(def fibs-take
  (fn [fibs count]
    (if
      (= count 0)
      '()
      (cons
        (fibs-first fibs)
        (fibs-take
          (fibs-rest fibs)
          (- count 1))))))

(def fibs-drop
  (fn [fibs count]
    (if
      (= count 0)
      fibs
      (recur
        (fibs-rest fibs)
        (- count 1)))))



(println (fibs-take (make-fibs 1 1) 5))

;Both Universe Functions
(def hang
  (fn []
    (recur)))

(def halt
  (fn [] nil))

(def teste
  (fn [p t e]
    (if p t e)))

;Parallel Universe Functions
  ;(test true (hang) (halt))
  ;      -> function hangs (diverges / never terminates)
  ;(test false (hang) (halt))
  ;      -> Terminates and returns nil

;Real Universe Functions
  ;(test true (hang) (halt))
  ;      -> function hangs (diverges / never terminates)
  ;(test false (hang) (halt))
  ;      -> function hangs (diverges / never terminates)
  ;(teste (fn [] true) (fn [] (hang)) (fn [] (halt)))
  ;      -> function hangs (diverges / never terminates)
  ;(test (fn [] false) (fn [] (hang)) ( [] (halt)))
  ;      -> Terminates and returns nil

(defmacro z [function & arguments]
  (cons function
    (map
      (fn [argument]
        (list 'fn [] argument))
      arguments)))
(z test false (hang (halt)))
; ~~> (test (fn [] false) (fn [] (hang)) ( [] (halt)))



(def eagerexpo
  (fn [b p]
    (if
      (= p 0)
      1
      (if
        (odd? p)
        (* b (eagerexpo b (- p 1)))
        (let [t (eagerexpo (/ p 2))]
          (* t t))))))

(def lazyexpo
  (fn [b p]
    (let [p (p)]
      (if
        (= p 0)
        1
        (let [b (b)]
          (if
            (odd? p)
            (* b (z lazyexpo b (- p 1)))
            (let [t (z expo b (/ p 2))]
              (* t t))))))))

