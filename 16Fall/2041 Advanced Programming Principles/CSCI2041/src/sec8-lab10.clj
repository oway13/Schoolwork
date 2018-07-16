(def error
  (fn [message]
    (throw (Exception. message))))

(def queue
  (fn []
    (letfn
      [(make [start]
         (fn [method & argument]
              (letfn
                [(empty? []
                   (= start '()))
                 (dequeue []
                   (if
                     (empty?)
                     (error "Queue is empty.")
                     (make (rest start))))
                 (enqueue [object]
                   (make (concat start object)))
                 (front []
                   (if
                     (empty?)
                     (error "Queue is empty.")
                     (first start)))]
                (cond
                  (= method :empty?)
                  (empty?)
                  (= method :dequeue)
                  (dequeue)
                  (= method :enqueue)
                  (enqueue (first argument))
                  (= method :front)
                  (front)
                  true
                  (error "No such method")))))]
      (make '()))))


;(def ayy (queue))
;(def s1 (ayy :enqueue "A"))
;(println (s1 :front))
;(def s2 (s1 :enqueue "B"))
;(println (s2 :front))
;(def s3 (s2 :dequeue))
;(println (s3 :front))
