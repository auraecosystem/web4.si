;; 1. Define Classes
(define-class <entity> ())

(define-class <asteroid> (<entity>) size)
(define-class <spaceship> (<entity>) callsign)

;; 2. Declare Generic Function accepting 2 arguments
(define-generic (collide obj1 obj2))

;; 3. Define Specialized Multimethods

;; Case A: Asteroid vs. Spaceship
(define-method (collide (a <asteroid>) (s <spaceship>))
  (format #t "~a asteroid smashes into ~a!\n" 
          (slot-ref a 'size) (slot-ref s 'callsign)))

;; Case B: Spaceship vs. Asteroid (reversed signature)
(define-method (collide (s <spaceship>) (a <asteroid>))
  (format #t "~a fires lasers at ~a asteroid!\n" 
          (slot-ref s 'callsign) (slot-ref a 'size)))

;; Case C: Asteroid vs. Asteroid
(define-method (collide (a1 <asteroid>) (a2 <asteroid>))
  (format #t "Two ~a asteroids shatter each other!\n" 
          (slot-ref a1 'size)))
;; 4. Instantiation and Multi-Dispatch Invocation
(define rock1 (make <asteroid> 'size 'huge))
(define rock2 (make <asteroid> 'size 'medium))
(define ship  (make <spaceship> 'callsign "Falcon"))

(collide rock1 ship)   ; Resolves to Case A -> "huge asteroid smashes into Falcon!"
(collide ship rock1)   ; Resolves to Case B -> "Falcon fires lasers at huge asteroid!"
(collide rock1 rock2)  ; Resolves to Case C -> "Two huge asteroids shatter each other!"
