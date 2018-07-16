(declare splitting)
(declare merging)

(def mergesort
  (fn [less? unsorted]
    (if
       (or
         (empty? unsorted)
         (empty? (rest unsorted))
         )
        unsorted
       (splitting less? unsorted '() '())
      )
    )
  )


(def splitting
  (fn [less? unsorted left right]
    (if
      (empty? unsorted)
      (let
        [left (mergesort less? left)
        right (mergesort less? right)]
        (merging less? left right)
        )
      (if
        (empty? (rest unsorted))
        (let
          [left (mergesort less? left)
           right (mergesort less? right)]
          (merging less? left right)
          )
        (splitting less? (rest (second unsorted)) (cons left (first unsorted)) (cons right (second unsorted)))
        )
      )
    )
  )


(def merging
  (fn [less? left right]
    (if
      (empty? left)
        right
      (if
        (empty? right)
        left
        (if
          (< (first left) (first right))
          (cons (first left) (merging less? (rest left) right))
          (cons (first right) (merging less? left (rest right)))
          )
        )
      )
    )
  )


(println (mergesort < '(9 8 7 6 5 4 3 2 1)))