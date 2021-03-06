(require-extension r7rs)

(require-extension tcp-server posix)

(declare (uses communicate))
(declare (uses packages))
(declare (uses config))

(define totalplayers 0)

(define (debug msg)
  (format (current-error-port) msg))

(define (listener)
  (accept-player (current-input-port))
  (communicate))

(debug (string-append "[pigman] Starting server on port " (number->string cfg-port) "~%"))

((make-tcp-server 
   (tcp-listen cfg-port) 
   listener)
 #t)
