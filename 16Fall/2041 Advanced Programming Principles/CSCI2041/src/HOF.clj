(def every1
  (fn [P S]
    (if
      (empty? S)
      true
      (if
        (P (first S))
        (recur P (rest S))
        false))))


;Can Use and, or instead of if for more readability
(def every2
  (fn [P S]
    (or
      (empty? S)
      (and
        (P (first S))
        (recur P (rest S))))))


(def some1
  (fn [P S]
    (if
      (empty? S)
      false
      (if
        (P (first S))
        true
        (recur P (rest S))))))


(def some2
  (fn [P S]
    (and
      (not (empty? S))
      (or
        (P (first S))
        (recur P (rest S))))))


(def member?
  (fn [E S]
    (some1
      (fn [E']    ;P, E' takes on successive values from S
        (= E E')) ;P
      S)))

(def subset?
  (fn [S1 S2]
    (every1
      (fn [E1]
        (some
          (fn [E2]
            (= E1 E2))
          S2))
      S1)))


(def subset1?
  (fn [S1 S2]
    (every1
      (fn [E1]
        (member? E1 S2))
      S1)))



(def filter1
  (fn [P S]
    (if
      (empty? S)
      '()
      (if
        (P (first S))
        (cons
          (first S)
          (filter1 P (rest S))) ;Not tail recursive
        (recur P (rest S)))))) ;Tail recursive


(def right-reduce1
  (fn [F S I]
    (if
      (empty? S)
      I
      (F (first S) (right-reduce1 F (rest S) I)))))


;I swear this guy is saying buttblast
(def left-reduce1
  (fn [F S I]
    (if
      (empty? S)
      I
      (F (left-reduce1 F (butlast S) I) (last S)))))

(def mean
  (fn [S]
    (/
      (left-reduce1 + S 0)
      (count S))))



(def multiply-sum
  (fn [M & S]
    (* M (reduce-left + S 0))))

(def partial1
  (fn [F & A1]
    (fn [& A2]
      (apply F (concat A1 A2)))))

;(def twice (partial1 * 2))
;(twice 4) => 8

(def member1?
  (fn [E S]
    (some (partial1 = E) S)))

(def comp1
  (fn [f g]
    (fn [& a]
      (f (apply g a)))))


