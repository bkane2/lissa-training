;; LEVEL 1
;; Simple nested patterns with words + features
;;
;; "How did you get here today?"

(eval-when (load eval)
  (MAPC 'ATTACHFEAT
  '(
    (walk walk walked stroll run ran hike hiked)
    (ride ride rode ridden)
    (drive drive driven drove)
    ;; "feat" here just to emphasize that the head represents a feature which is attached to all the subsequent words.
    (feat-relationships wife husband spouse dad father mom mother son grandson daughter granddaughter child friend friend\'s mate mate\'s)
    (feat-someone someone someone\'s somebody\'s somebody another feat-relationships)
    (feat-car-poss-by-me my a)

    ;; ============================
    ;; TODO: ADD MORE FEATURES HERE
    ;; ============================

  ))

  (READRULES '*specific-answer-from-example-input*
  '(
    1 (0 drive 0)
      2 (0 friend drive 0)
        3 ((Someone drove me here today \.) (example)) (0 :gist)
      2 (0 by feat-someone 0)
        3 ((Someone drove me here today \.) (example)) (0 :gist)
      2 (0 with feat-someone 0)
        3 ((I drove here today with someone \.) (example)) (0 :gist)
      2 (0 myself 0)
        3 ((I drove myself here today \.) (example)) (0 :gist)
      2 ((I drove myself here today \.) (example)) (0 :gist)
    1 (0 ride 0)
      2 (0 got a ride 0)
        3 ((Someone drove me here today \.) (example)) (0 :gist)
      2 (0 with feat-someone 0)
        3 ((Someone drove me here today \.) (example)) (0 :gist)
      2 ((I drove myself here today \.) (example)) (0 :gist)
    1 (0 car 0)
      2 (0 feat-car-poss-by-me car 0)
        3 ((I drove myself here today \.) (example)) (0 :gist)
      2 (0 my own car 0)
        3 ((I drove myself here today \.) (example)) (0 :gist)
      2 (0 feat-someone car 0)
        3 ((Someone drove me here today \.) (example)) (0 :gist)
    1 (0 walk 0)
      2 ((I walked here today \.) (example)) (0 :gist)
    1 (0 bus 0)
      2 ((I took the bus here today \.) (example)) (0 :gist)
    
    ;; =========================
    ;; TODO: ADD NEW RULES HERE
    ;; =========================

    1 (0)
      2 ((NIL Gist \: nothing found \.) (example)) (0 :gist)

  ))
       
  (READRULES '*thematic-answer-from-example-input*
    '())

  (READRULES '*unbidden-answer-from-example-input*
    '())
		
  (READRULES '*question-from-example-input*
    '())

); end of eval-when
