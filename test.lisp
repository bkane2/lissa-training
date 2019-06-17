;; File for testing example rule files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "ttt/src/load"); needed: lissa6.lisp references ttt:...
(defparameter *use-latency* nil)
(defparameter *count* nil)
(load "core/lissa6.lisp")
(load "core/general-word-data.lisp")
(load "core/eval-lexical-ulfs.lisp")
(load "core/stem.lisp")

(defparameter *gist?* nil)
(defparameter *verbose* nil)
(format t "~%~%~%~%~%~%~%~%~%")
(princ "gist (g) or ulf (u) ?: ") (finish-output)
(setq *gist?* (if (equalp (write-to-string (read)) "g") t nil))
(princ "verbose (t or nil) ?: ") (finish-output)
(setq *verbose* (if (equalp (write-to-string (read)) "t") t nil))

(load (format nil "rules-input-~a.lisp" (if *gist?* "gist" "ulf")))


(defun test-gist (query answer)
;``````````````````````````````
; Test whether the gist clause extracted for a
; given query is equivalent to a given answer
;
  (let ((gist
        (cadr (choose-result-for (mapcar #'tagword query) '*specific-answer-from-example-input*))))
    (if *verbose* (format t "> The extracted gist is:~%: ~a~%> The correct gist is:~%: ~a~%" gist answer))
    (equalp answer gist)))


(defun test-ulf (query answer)
;````````````````````````````
; Test whether the ulf extracted for a
; given query is equivalent to a given answer
;
  (equalp answer
    (form-ulf-from-clause query)))


(defun run-tests (tests gist?)
;``````````````````````````````
; Runs a list of tests ((query answer) pairs),
; returns the number of tests where the correct pattern
; is extracted (check gist or ulf depending on 'gist?'),
; and prints which queries fail
; 
  (let ((n (length tests)) (i 0))
    (dolist (ti tests)
      (if *verbose*
        (format t "Testing: ~a~%``````````````````````````````````````~%" ti))
      (if (if gist? (test-gist (first ti) (third ti))
                    (test-ulf (first ti) (third ti)))
        (setf i (1+ i))
        (format t "Test failed: ~a~%" (first ti))))
  (format t "Number tests passed: ~a/~a~%" i n)))


(cond
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Run all the tests here, depending on if we're testing gist clause
; extraction or ulf extraction

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (*gist?* (run-tests
  ;```````````````````````````````````````````````````````````
  ; Gist tests
  ; Theme: "How did you get here today?"
  ;
    '(((I refuse to answer this question \.) => (NIL Gist \: nothing found \.))
    ((I drove \.)                            => (I drove myself here today \.))
    ((I took my own car \.)                  => (I drove myself here today \.))
    ((I had a friend drive me here \.)       => (Someone drove me here today \.))
    ((I drove here with my wife \.)          => (I drove here today with my wife \.))
    ((I got a ride with my friend \.)        => (Someone drove me here today \.))
    ((I actually own a car \.)               => (I drove myself here today \.))
    ((I don\'t live very far away \,
      so I walked \.)                        => (I walked here today \.))
    ((The bus \.)                            => (I took the bus here today \.))
    ((The bus wasn\'t running today \, so
      I had a friend drive me \.)            => (Someone drove me here today \.))
    ((I used the shuttle from
      graduate housing \.)                   => (I took the bus here today \.))
    ((I\'m living on campus \,
      so I was already here \.)              => (I walked here today \.))
    ((I\'m living off campus \,
      so I took an uber to campus today \.)  => (Someone drove me here today \.))
    ((I caught an uber with a friend \.)     => (Someone drove me here today \.))
    ((My car wasn\'t working today\, so I
      ended up taking the bus \.)            => (I took the bus here today \.)))
  t))


  (t (run-tests
  ;```````````````````````````````````````````````````````````
  ; ULF tests
  ; Theme: Blocksworld queries to ULF
  ;
    '(
      (() ())
    )
  nil))
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

