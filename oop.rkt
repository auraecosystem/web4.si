(define-syntax define-class
  (syntax-rules (extends)
    ;; Form 1: Derived Class (with inheritance)
    ((define-class (class-name field ...)
       (extends parent-class parent-arg ...)
       ((method-name arg ...) body ...) ...)
     (define (class-name field ...)
       (let ((parent (parent-class parent-arg ...)))
         (lambda (message)
           (case message
             ((method-name) (lambda (arg ...) body ...))
             ...
             (else (parent message)))))))

    ;; Form 2: Base Class (no inheritance)
    ((define-class (class-name field ...)
       ((method-name arg ...) body ...) ...)
     (define (class-name field ...)
       (lambda (message)
         (case message
           ((method-name) (lambda (arg ...) body ...))
           ...
           (else (error "Unknown method" message))))))))

;; Message invocation macro
(define-syntax send
  (syntax-rules ()
    ((send obj method-name arg ...)
     ((obj 'method-name) arg ...))))
