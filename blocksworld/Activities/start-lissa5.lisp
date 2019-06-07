
;; fast start-up: with this file, we can use
;;   (load "start-lissa5.lisp") or (load "start-lissa5")
;;   (lissa t)
;; to get under way
;(load *ttt-addr*)
;(load "C:/inetpub/wwwroot/RocSpeakRafayet/ttt/ttt/src/load")

(load "lissa5-schema.lisp"); schematic dialog steps
(format t "ONE")
(load "choose-gist-clause-trees-for-input.lisp")
(format t "TWO")
(load "choose-reaction-to-input.lisp")
(format t "THREE")
(load "rules-for-hobbies-input.lisp")
(format t "FOUR")
(load "rules-for-like-to-read-input.lisp")
(load "rules-for-things-like-to-read-input.lisp")
(load "rules-for-spend-your-days-input.lisp")
(load "rules-for-things-in-neighborhood-input.lisp")

(format t "~%~%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ~
             ~% TO RUN LISSA IN PRINT-MODE OR TALK-MODE, USE RESPECTIVE CALLS
             ~%           (lissa nil)    (lissa t)
             ~%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ~
             ~% ALSO NOTE: For inhibiting repetitive outputs via latency, do ~
             ~%            (setq *use-latency* T) ~
             ~% THOUGH THAT'S NOT RECOMMENED IN THE LISSA DEVELOPMENT PHASE
             ~%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        


; activate one of the following code lines:
(lissa *mode*) ; for one round
;(mainLoop)  ; for repeated round
