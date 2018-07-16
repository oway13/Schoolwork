(def depth-first
	(fn [visit graph vertex]      ;visit is a 1-ary function
		(depth-firsting visit graph vertex (atom #{}))))  
		

(def depth-firsting       ;the function that does all the work
	(fn [visit graph vertex visited]  ;visited is our set of vertexes we have visited already, this helps us avoid endless loops
		(if
			(not (contains? (deref visited) vertex))
			(do
				(reset! visited (conj (deref visited) vertex)) ;conj here adds an element to the set by making a new set with the element added
				(visit vertex)
				(neighbors  ;neighbors is a higher order helper function that we will write later
					(fn [other-vertex]
						(depth-firsting visit graph other-vertex visited))
					graph vertex)))))

(def neighbors
	(fn [function graph vertex]
		(loop [vertexes (get graph vertex)]
			(if (not (empty? vertexes))
				(do
					(function (first vertexes))
					(recur (rest vertexes)))))))

;Now we write the programs for the breadth first traversal
;these are queue operations

(def make-queue
	(fn []
		'()))

(def enqueues
	(fn [queue vertexes]
		(concat queue vertexes)))

(def dequeue
	(fn [queue]
		(rest queue)))

(def front
	(fn [queue]
		(first queue)))

(def queue-empty?
	(fn [queue]
		(empty? queue)))

;we can rewrite these:

(def enqueues concat)
(def dequeue rest)
(def front first)
(def queue-empty? empty?)

;so to rename things we don't need to go through the trouble of making functions
;now lets do our breadth first traversal

(def breadth-first
	(fn [visit graph vertex]
		(let [visited (atom #{})]
			(breadth-firsting visit graph (enqueues (make-queue) (list vertex)) visited)
			(deref visited))))

(def breadth-firsting
	(fn [visit graph queue visited]
		(if (not (queue-empty? queue))
			(let [vertex (front queue)]
				(if (contains? (deref visited) vertex)
					(recur visit graph (dequeue queue) visited)
					(do
						(reset! visited (conj (deref visited) vertex))
						(visit vertex)
						(recur visited graph (enqueues (dequeue queue) (get graph vertex)) visited)))))))

;



