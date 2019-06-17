;; File for testing the initial version of the spatial QA version of LISSA
;; June 10/19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "ttt/src/load"); needed: lissa6.lisp references ttt:...
(setq *use-latency* nil)
(load "core/lissa6.lisp")
(load "core/general-word-data.lisp")
(load "core/eval-lexical-ulfs.lisp")
(load "core/stem.lisp")

(defparameter *level* nil)
(princ "level: ") (finish-output)
(setq *level* (write-to-string (read)))

(load (format nil "rules-input-level-~a.lisp" *level*))

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

