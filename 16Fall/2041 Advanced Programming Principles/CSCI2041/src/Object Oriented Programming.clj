;this is stack function for OOP stack.

(def stack           ;stack is like a class in OOP
	(fn []
		(letfn
			[(make [top]                       ;make is like a private constructor, top is like a private variable
				(fn [method & argument]        ;method is gonna be a keyword input  fn here is a closure
					(letfn
						[(empty? []            ;"methods"
							(= top '()))
						(push [object]
							(make (cons object top)))
						(pop []
							(if (empty?)
								(error "stack is empty")  ;error function is below, we wrote it
								(make (rest top))))
						(peek []
							(if (empty?)
								(error "stack is empty")
								(first top)))]
							;outside the brackets inside the letfn. not inside peek
							(cond                              ;dispatcher 
								(= method :empty?)
								(empty?)
								(= method :push)
								(push (first arguments))
								(= method :pop)
								(pop)
								(= method :peek)
								(peek)
								true
								(error "no such method")))))]
			(make '()))))



(def error
	(fn [message]
		(throw (Exception. message))))


;REPL
;>(def s0 (stack))
;>(s0 :empty?) => true
;>(def s1 (s0 :push "A"))
;>(s1 :empty?) => false
;>(s1 :peek) => "A"
;>(def s2 (s1 :push "B"))
;>(s2 :peek) => "B"
;>(def s3 (s2 :pop))
;>(s3 :peek) => "A"


(def pushes                    ;this is so we dont have to use def for each stack
	(fn [stack objects]
		(if (empty? objects)
			stack
			(pushes 
				(stack :push (first objects))
				(rest objects)))))




;>(pushes (stack) '(A B C))

;the only thing missing for OOP is inheritance
