;; File for testing example rule files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "ttt/src/load"); needed: lissa6.lisp references ttt:...
(defparameter *use-latency* nil)
(defparameter *count* nil)
(load "core/lissa6.lisp")
(load "core/general-word-data.lisp")
(load "core/eval-lexical-ulfs.lisp")
(load "core/stem.lisp")

(defparameter *level* nil)
(format t "~%~%~%~%~%~%~%~%~%")
(princ "level: ") (finish-output)
(setq *level* (parse-integer (write-to-string (read))))

(load (format nil "rules-input-level-~a.lisp" *level*))

(defun test (query answer)
;````````````````````````````
; Test whether the gist clause extracted for a
; given query is equivalent to a given answer
;
  (equalp answer
    (cadr (choose-result-for (mapcar #'tagword query) '*specific-answer-from-example-input*))))


(defun run-tests (tests)
;````````````````````````````
; Runs a list of tests ((query answer) pairs),
; returns the number of tests where the correct pattern
; is extracted, and prints which queries fail
; 
  (let ((n (length tests)) (i 0))
    (dolist (ti tests)
      (if (test (first ti) (third ti))
        (setf i (1+ i))
        (format t "Test failed: ~a~%" (first ti))))
  (format t "Number tests passed: ~a/~a~%" i n)))


(cond
;````````````````````````````
; Run all the tests here, depending on which level is given
;
  ((= *level* 1) (run-tests ;; "How did you get here today?"
    '(((I refuse to answer this question \.) => (NIL Gist \: nothing found \.))
    ((I drove \.)                            => (I drove myself here today \.))
    ((I took my own car \.)                  => (I drove myself here today \.))
    ((I had a friend drive me here \.)       => (Someone drove me here today \.))
    ((I got a ride with my friend \.)        => (Someone drove me here today \.))
    ((I actually own a car \.)               => (I drove myself here today \.))
    ((I don\'t live very far away \,
      so I walked \.)                        => (I walked here today \.))
    ((The bus \.)                            => (I took the bus here today \.))
    ((I used the shuttle from
      graduate housing \.)                   => (I took the bus here today \.))
    ((I\'m living on campus \,
      so I was already here \.)              => (I walked here today \.))
    ((I\'m living off campus \,
      so I took an uber to campus today \.)  => (Someone drove me here today \.))
    ((I caught an uber with a friend \.)     => (Someone drove me here today \.)))
  ))
  ;; ((= *level* 2) (run-tests
  
  ;; ))
  ;; ((= *level* 3) (run-tests
  
  ;; ))
)

;; tests:
;; (setq clause '(Is the Nvidia block on the Mercedes block ?))
;; (trace choose-result-for choose-result-for1)
;; (trace instance) ; more detailed tracing
;; (trace eval-lexical-ulfs); still more detailed
;; (form-ulf-from-clause clause)
;; (setq clause '(Is there a red block on the Mercedes block ?))
;; (form-ulf-from-clause clause)
;; (setq clause '(Is there a red Nvidia block on top of the Mercedes block ?))
;; (form-ulf-from-clause clause)
;; (setq clause '(is the Mcdonalds block to the left of a red block ?))

