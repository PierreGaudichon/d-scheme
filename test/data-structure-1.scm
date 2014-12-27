(define human (height weigh) (lambda (s)
 (cond
  ((= s "height") height)
  ((= s "weigh") weigh))))

(define jon (human 175 70))

"Should output 70."
(jon "weigh")
