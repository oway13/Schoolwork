(def star ;Similar to *
  (fn [etc j k]
    (etc (* j k))))
;(star
 ; (fn [n]  ;etc
  ;  (+ n d)) ;etc This doesn't work because of d?
  ;a b) ;j k
;WE don't really need CPS here, it's just a silly example that doesn't work


(def thru
  (fn [etc start end]
    (loop
      [index start]
      (if
        (< index end)
        (do
          (etc index)
          (recur (+ index 1)))))))


(println "Thru Examples")
(thru println 1 11) ;Calls c as many times as needed
(thru println 10 0) ;Never Calls c
(thru println 0 1) ;Calls c once

(thru
  (fn [j]
    (thru
      (fn [k]
        (println j " " k " " (+ j k)))
      0 10))
  0 10)



;If we have n distinct object we get n! permutations
(def permute
  (fn [etc S]
    ;generate permutations of S
    ; Call etc on each one
        ;How would we do this?
    ))
;Algorithm works by exchanging (swapping) elements of S
;In an ordinary boring languge, S would be an array
      ;How would it be represented in Clojure?




(println "Permutation Examples")