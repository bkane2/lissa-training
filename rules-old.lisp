;; LEVEL 2
;; Using wildcards
;; 
;; "Tell me about a pet of a family member or neighbor"

(eval-when (load eval)
  (MAPC 'ATTACHFEAT
  '(
    ; | Here we're creating a new feature 'neg-context' for the
    ; | purposes of one of the rules in this file. This feature is
    ; | recursively applied to already defined features, which can be
    ; | found in "core/general-word-data.lisp".
    ; V
    (neg-context neg negadv negquant)

    (first-per-pron I we)
    (first-per-pron-pos my our)
    (verb-own have has own owns keep keeps verb-own-past)
    (verb-own-past had owned kept)
    (verb-got got adopted)
    (had has)
  
    (pet-types pet-cat pet-dog pet-bird pet-fish pet-other pet pets)
    (pet-cat cat cats kitten kittens kitty kitty kitties)
    (pet-dog dog dogs puppy puppies pup mutt mutts hound hounds lab labs labrador
      husky huskies pug pugs beagle beagles poodle poodles bulldog bulldogs terrier
      terriers chihuahua chihuahuas retriever retrievers)
    (pet-bird bird birds parakeet parakeets parrot parrots canary canaries)
    (pet-fish fish goldfish)
    (pet-other bunny bunnies rabbit rabbits gerbil gerbils hamster hamsters guinea lizard lizards snake snakes turtle turtles)
    (few a one two three four five six seven eight nine ten eleven)

    (family-mems son daughter grandchild grandchildren grandson granddaughter niece nephew
    cousin relative child children)
    (family-mems-possessive son\'s daughter\'s grandchild\'s grandchildren\'s grandson\'s granddaughter\'s niece\'s nephew\'s
    cousin\'s relative\'s child\'s children\'s)
    (neighbor-ref neighbor neighbors)

    (noise noises sound bark barks barking)
    (bark barks barking)
  ))

  (READRULES '*specific-answer-from-example-input*
  '(
    ; The following numbers show how indexing works in the
    ; reassembly patterns (i.e. the gist clause). In this case,
    ; the '5' in the gist clause corresponds to the 5th token, 'pet-types'
    ; in the parent pattern, which will be substitued with the exact
    ; word matched to that pattern token (for instance, "cat").
    ;  1 2           3        4 5         6
    ;  | |           |        | |         |
    1 (0 family-mems verb-own 3 pet-types 0)
      2 ((My family member has a 5 \.)  (example)) (0 :gist)
    ; Wildcards are very useful in taking into account long-term dependencies
    ; in input sentences, where for instance merely matching a couple words
    ; potentially fails to take into account a negative context (NEG)
    ; somewhere else in the sentence.
    1 (0 neighbor-ref 4 pet-types 6 neg-context clean 2 after 0) 
      2 ((My neighbor has a 4 and they do not clean up after it \.)  (example)) (0 :gist)
    
    1 (0 family-mems 1 got 2 pet-types 0)
      2 ((My family member has a 6 \.)  (example)) (0 :gist)
    1 (0 family-mems-possessive 2 pet-types 0)
      2 ((My family member has a 4 \.)  (example)) (0 :gist)
    1 (0 neighbor-ref 6 verb-own 2 pet-types 0)
      2 ((My neighbor has a 6 \.)  (example)) (0 :gist)
    1 (0 neighbor-ref 6 got 2 pet-types 0)
      2 ((My neighbor has 6 \.)  (example)) (0 :gist)
    1 (0 neighbor\'s 2 pet-types 0)
      2 ((My neighbor has 4 \.)  (example)) (0 :gist)
    1 (0 pet-types 3 died 0)
      2 ((My family member or my neighbor had a 2 but it died \.)  (example)) (0 :gist)
    1 (0 killed 0)
      2 ((My family member or my neighbor had a pet but it died \.)  (example)) (0 :gist)
    1 (0 put 1 down 0)
      2 ((My family member or my neighbor had a pet but it died \.)  (example)) (0 :gist)

    1 (0 neighbor 3 pet-types 5 bark 0) 
      2 ((My neighbor has a 4 and it barks a lot \.)  (example)) (0 :gist)
    1 (0 neighbor 3 pet-types 5 noise 0) 
      2 ((My neighbor has a 4 and it makes a lot of noise \.)  (example)) (0 :gist)
    1 (0 neighbor 3 pet-types 5 annoying 0) 
      2 ((My neighbor has a 4 and it is very annoying \.)  (example)) (0 :gist)
    1 (0)
      2 ((NIL Gist \: nothing found for what pet my neighbor has \.) (example)) (0 :gist)
  ))
       
  (READRULES '*thematic-answer-from-example-input*
    '())

  (READRULES '*unbidden-answer-from-example-input*
    '())
		
  (READRULES '*question-from-example-input*
    '())

); end of eval-when
