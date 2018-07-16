(def bind
  (fn
    ([name]
      (bind scope name))
    ([scope name]
      (if
        (empty? scope)
        (throw (Exception."unbound name"))
        (if
          (contains? (first scope) name)
          (get (first scope) name)
          (recur (rest scope) name))))))

(def scope
  (list
    (assoc
      (hash-map)
      '+ +
      '- -
      '* *
      '/ /
      '< <
      'true true
      'false false
      ;etc for primitive functions
      )))

(def evaluate
  (fn
    ([form] (evaluate form scope))
    ([form scope]
      (if
        (constant? form)
        form
        (if
          (symbol? form)
          (bind scope form)
          (if
            (quote? form)
            (second form)
            ;all the other predefined functions
            ;and special forms
            (apply
              (evaluate (first form) scope)
              (map
                (fn [argument]
                  (evaluate argument scope))
                (rest form)))))))))

(def evaluatewcond
  (fn
    ([form]
      (evaluate form scope))
    ([form scope]
      (cond
        (constant? form)
        form
        (symbol? form)
        (bind scope form)
        (quote? form)
        (second form)
        true
        (apply
          (evaluate (first form) scope)
          (map
            (fn [argument]
              (evaluate argument scope))
            (rest form)))))))

(def evaluate-let ;Should turn this into a macro so we don't use stack space
  (fn [form scope]
    (loop
      [pairs (second form)
       map (hash-map)]
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

(def evaluate1
  (fn
    ([form]
      (evaluate form scope))
    ([form scope]
      (cond
        (constant? form)
        form
        (symbol? form)
        (bind scope form)
        (quote? form)
        (second form)
        (let? form)
        (evaluate-let form scope)
        true
        (apply
          (evaluate (first form) scope)
          (map
            (fn [argument]
              (evaluate argument scope))
            (rest form)))))))

(def evaluate-if
  (fn [form scope]
    (if
      (evaluate (first (rest form)) scope)
      (evaluate (first (rest (rest form))) scope)
      (evaluate (first (rest (rest (rest form)))) scope))))




(def evaluate-fn
  (fn [form scope]
    (make-closure
      (first (rest form))
      (first (rest (rest form)))
      scope)))

(def evaluate-call
  (fn [closure arguments scope]
    (loop
      [parameters (closure-parameters closure)
       arguments arguments
       map (hash-map)]
      (if
        (empty? parameters)
        (evaluate
          (closure-body closure)
          (cons map (closure-scope closure)))
        (recur
          (rest parameters)
          (rest arguments)
          (assoc map
            (first parameters)
            (evaluate
              (first arguments)
              scope)))))))


(def evaluate2
  (fn
    ([form]
      (evaluate form scope))
    ([form scope]
      (cond
        (constant? form)
        form
        (symbol? form)
        (bind scope form)
        (quote? form)
        (second form)
        (let? form)
        (evaluate-let form scope)
        (if? form)
        (evaluate-if form scope)
        (fn? form)
        (evaluate-fn form scope)
        true
        (let
          [function (evaluate (first form)) scope]
          (if
            (closure? function)
            (evaluate-call function (rest form) scope)
        (apply
          (evaluate (first form) scope)
          (map
            (fn [argument]
              (evaluate argument scope))
            (rest form)))))))))
