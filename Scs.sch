(define (get-unvisited neighbors visited)
  (filter (lambda (node) (not (member node visited))) 
          neighbors))
