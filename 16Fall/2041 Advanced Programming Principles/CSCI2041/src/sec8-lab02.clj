(def matching
  (fn [table pattern subject]
    (cond
      (keyword? pattern) ;Base Case, If Pattern is a keyword
      (if
        (nil? (get table pattern)) ;Then If Pattern is a keyword but does not have a value in table
        (assoc table pattern subject) ;Then Associate the value of Subject with Pattern in Table
        (if
          (= (get table pattern) subject) ;Else If Pattern is a keyword, has a value in table, and that value is subject
          table ;Then Return the Current State of the Table
          nil)) ;Else Pattern is a keyword, has a value in table, and that value isn't subject, return false
      (and ;Recursive Case
        (seq? pattern) ;Else if Pattern is a Seq and Subject is a Seq and Not (Pattern is empty or Subject is empty)
        (seq? subject)
        (not 
          (or
            (empty? pattern)
            (empty? subject))))
        (let
          [table (matching table (first pattern) (first subject))];Then Recursively call Matching with the Firsts of both,
          (matching table (rest pattern) (rest subject)))         ;and the Rests of both pattern and subject
      :else ;Else Case
        (if
          (= pattern subject) ;Else If Pattern isn't a keyword, but it equals subject
          (hash-map) ; Then return true, as represented by an empty map
          nil ;Else return false, as represented by nil
          ))))

(def match
  (fn [pattern subject]
    (matching (hash-map) pattern subject)))


;(println (match '() '()))
;(println (match '() '(a b c)))
;(println (match '(a b c) '(a b c)))
;(println (match '(a (b c)) '(a (b c))))
;(println (match '(a b) '(a (b))))

;(println (match '(:a) '(test)))
;(println (match '(:a is a :b) '(this is a test)))
;(println (match '(:a is a :b) '(this is a (hard test))))
;(println (match '(:a is :b) '((a rose) is (a rose))))
;(println (match '(:a is :a) '((a rose) is (a rose))))
;(println (match '(cons (first :a) (rest :b)) '(cons (first x) (rest x))))

;(println (match '(:a) '()))
;(println (match '(:a is a :b) '(this is not a test)))
;(println (match '(:a is a :b) '(x is y)))
;(println (match '(:a is :a) '((a rose) is (not a rose))))
;(println (match '(cons (first :a) (rest :a)) '(cons (first x) (rest y))))



