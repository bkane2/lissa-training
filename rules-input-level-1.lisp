(eval-when (load eval)
  (MAPC 'ATTACHFEAT
  '())

  (READRULES '*specific-answer-from-example-input*
  '(
    1 (0)
      2 ((GIST \: 1) (example))  (0 :gist)
  ))
       
  (READRULES '*thematic-answer-from-example-input*
    '())

  (READRULES '*unbidden-answer-from-example-input*
    '())
		
  (READRULES '*question-from-example-input*
    '())

); end of eval-when
