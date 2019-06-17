(defvar *gist-kb* (make-hash-table :test #'equal)); for storage of gist
                ; clauses, particularly ones obtained from user inputs;
(clrhash *gist-kb*)

(defparameter *level* nil)
(defparameter *mode* nil)
(defparameter *user-id* "Test")

(setf *root-dir* *default-pathname-defaults*)


(princ "level: ") (finish-output)
(setq *level* (write-to-string (read)))


;
; load ttt
;
(setf *temp-dir* "ttt/src")
(setf *default-pathname-defaults* (truename *temp-dir*))
(load "load")
(setf *default-pathname-defaults* *root-dir*)


;
; load shared code
;
(setf *temp-dir* "core")
(setf *default-pathname-defaults* (truename *temp-dir*))
(load "lissa6")
(load "lissa6-schema.lisp")
(load "general-word-data.lisp")
(load "choose-gist-clause-trees-for-input.lisp")
(load "choose-reaction-to-input.lisp")
(load "choose-reactions-to-input.lisp")
(load "schema-for-reactions-to-answer-plus-question.lisp")
(load "schema-for-reactions-to-question+clause.lisp")
(load "eval-lexical-ulfs.lisp")
(load "stem.lisp")
(setf *default-pathname-defaults* *root-dir*)


;
; Start dialogue
;
(load (format nil "rules-input-level-~a.lisp" *level*))
(load "rules-for-example-reaction.lisp")
(load "rules-for-question-reaction.lisp")

(lissa *mode*)