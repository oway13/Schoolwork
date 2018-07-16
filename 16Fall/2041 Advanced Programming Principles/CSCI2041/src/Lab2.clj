(def matching
  (fn [table pattern subject]
    (cond
      (keyword? pattern)


        (if
          (= (get table pattern) nil)
          (assoc table pattern subject)
          (if
            (= (get table pattern) subject)
            table
            nil
            )
          ;if pattern has a value in table, test if its value equals subject, decide to return table or nil
          )
      (and
        (seq? pattern)
        (seq? subject))
          (matching table (first pattern) (first subject))
          (matching table (rest pattern) (rest subject))
      :else
        (if
          (= pattern subject)
              ;test to decide whether to return table or nil
          true ;fix
          nil ;fix
            )
      )
    )
  )



(def match
  (fn [pattern subject])
    (matching {} pattern subject)
  )

