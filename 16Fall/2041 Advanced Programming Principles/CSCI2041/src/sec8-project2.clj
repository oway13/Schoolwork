(def evaluate)  ;  To allow mutual recursion.

;  SCOPE. The global scope. SCOPEs are stacks (lists) of HASH-MAPs.

(def scope
  (list
    (assoc
      (hash-map)
      '+     +
      '-     -
      '*     *
      '/     /
      '=     =
      '<     <
      'true  true
      'false false)))



;  CLOSURE?. Test if OBJECT is a closure (but not a Clojure!) created by FN.

(def closure?
  (fn [object]
    (and
      (vector? object)
      (= (get object 0) 'closure))))

;  CLOSURE-BODY. Return the body of CLOSURE: a form.

(def closure-body
  (fn [closure]
    (get closure 2)))

;  CLOSURE-PARAMETERS. Return the parameter list of CLOSURE: a list of zero or
;  more distinct symbols.

(def closure-parameters
  (fn [closure]
    (get closure 1)))

;  CLOSURE-SCOPE. Return the defining scope of CLOSURE.

(def closure-scope
  (fn [closure]
    (deref (get closure 3))))

;  CONSTANT?. Test if FORM is a constant.

(def constant?
  (fn [form]
    (or
      (nil? form)
      (number? form)
      (string? form)
      (= form true)
      (= form false))))

;  FN-CALL?. Test if FORM is a call to the special form FN.

(def fn-call?
  (fn [form]
    (and
      (not (empty? form))
      (= (first form) 'fn))))

;  EVALUATE-CALL. Evaluate a call to a Perjure closure (but not a Clojure!).

(def evaluate-call
  (fn [closure arguments scope]
    (loop
      [parameters (closure-parameters closure)
       arguments  arguments
       map        (hash-map)]
      (if
        (empty? parameters)
        (evaluate
          (closure-body closure)
          (cons map
            (closure-scope closure)))
        (recur
          (rest parameters)
          (rest arguments)
          (assoc map
            (first parameters)
            (evaluate (first arguments) scope)))))))

;  EVALUATE-FN. Evaluate FORM, a call to the special form FN, in SCOPE.

(def evaluate-fn
  (fn [form scope]
    (vector 'closure
      (second form)
      (first (rest (rest form)))
      (atom scope))))

;  EVALUATE-IF. Evaluate FORM, a call to the special form IF, in SCOPE.

(def evaluate-if
  (fn [form scope]
    (if
      (evaluate (first (rest form)) scope)
      (evaluate (first (rest (rest form))) scope)
      (evaluate (first (rest (rest (rest form)))) scope))))

;  EVALUATE-LET. Evaluate FORM, a call to the special form LET, in SCOPE.

(def evaluate-let
  (fn [form scope]
    (loop
      [pairs (second form)
       map   (hash-map)]
      (if
        (empty? pairs)
        (evaluate
          (first (rest (rest form)))
          (cons map scope))
        (recur
          (rest (rest pairs))
          (assoc map
            (first pairs)
            (evaluate
              (second pairs)
              (cons map scope))))))))

;  EVALUATE-SYMBOL. Return the binding of SYMBOL in SCOPE.

(def evaluate-symbol
  (fn
    ([symbol]
      (evaluate-symbol symbol scope))

    ([symbol scope]
      (if
        (empty? scope)
        (throw (Exception. (str "Unbound symbol: " symbol)))
        (if
          (contains? (first scope) symbol)
          (get (first scope) symbol)
          (recur symbol (rest scope)))))))

;  IF-CALL?. Test if FORM is a call to the special form IF.

(def if-call?
  (fn [form]
    (and
      (not (empty? form))
      (= (first form) 'if))))

;  LET-CALL?. Test if FORM is a call to the special form LET.

(def let-call?
  (fn [form]
    (and
      (not (empty? form))
      (= (first form) 'let))))

;  QUOTE-CALL?. Test if FORM is a call to the special form QUOTE.

(def quote-call?
  (fn [form]
    (and
      (not (empty? form))
      (= (first form) 'quote))))

; LETFN-CALL?. Test if FORM is a call to the special form LETFN

(def letfn-call?
  (fn [form]
    (and
      (not (empty? form))
      (= (first form) 'letfn))))



;EVALUATE-LETFN.
(def evaluate-letfn
  (fn [form scope]
    (loop
      [fns (second form)
       map   (hash-map)]
      (if
        (empty? fns)
        (do
          (doseq [[fn closure] map]
            (reset! (get closure 3) (cons map scope)))
          (evaluate
            (second (rest form))
            (cons map scope)))
        (recur
          (rest (rest fns))
          (assoc map
            (first fns)
            (evaluate
              (second fns)
              (cons map scope))))))))

;  EVALUATE. The level 2 Perjure evaluator.

(def evaluate
  (fn
    ([form]
      (evaluate form scope))

    ([form scope]
      (cond
        (constant? form)
        form

        (symbol? form)
        (evaluate-symbol form scope)

        (fn-call? form)
        (evaluate-fn form scope)

        (if-call? form)
        (evaluate-if form scope)

        (let-call? form)
        (evaluate-let form scope)

        (quote-call? form)
        (second form)

        (letfn-call? form)
        (evaluate-letfn form scope)

        true
        (let
          [function (evaluate (first form) scope)]
          (if
            (closure? function)
            (evaluate-call function (rest form) scope)
            (apply function
              (map
                (fn [argument]
                  (evaluate argument scope))
                (rest form)))))))))

(println
  (evaluate
    '(letfn
       (abs
         (fn (a)
           (if
             (< a 0)
             (- a)
             a)))
       (abs -1))))

(println
  (evaluate
    '(letfn
       (factorial
         (fn (n)
           (if
             (= n 0)
             1
             (* n (factorial (- n 1))))))
    (factorial 5))))


(println
  (evaluate
    '(letfn
       (dum
       (fn (x)
         (if
           (= x 0)
           0
           (dee (- x 1))))
         dee
       (fn (x)
         (if
           (= x 0)
           0
           (dum (- x 1)))))
    (dum 5))))

