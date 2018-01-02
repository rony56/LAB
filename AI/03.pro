problem-03
__________________________________________________________________________
predicates

		go
			sentence(string)
			noun_phrase(string)
			noun_phrase1(string)
			verb_phrase(string)
			pronoun(string)
			determiner(string)
			noun(string)
			transitive_verb(string)
			intransitive_verb(string)
			proper_noun(string)
			
		clauses
		
		determiner("a").
		determiner("the").
		noun("book").
		noun("girl").
		noun("boy").
		transitive_verb("gives").
		transitive_verb("reads").
		proper_noun("mary").
		proper_noun("henry").
		intransitive_verb("runs").
		intransitive_verb("sits").
		pronoun("he").
		pronoun("she").
		
	sentence(S):-
		noun_phrase(S).
		
	noun_phrase(S):-
		fronttoken(S,X,S1),
		determiner(X),
		fronttoken(S1,X1,S2),
		noun(X1),
		verb_phrase(S2).
		
	noun_phrase(S):-
		fronttoken(S,X,S2),
		proper_noun(X),
		verb_phrase(S2).
		
	noun_phrase(S):-
		fronttoken(S,X,S2),
		pronoun(X),
		verb_phrase(S2).
		
	noun_phrase1(S4):-
		fronttoken(S4,X,S5),
		determiner(X),
		fronttoken(S5,X1,_),
		noun(X1).
		
	noun_phrase1(S4):-
		fronttoken(S4,X,_),
		proper_noun(X).
		
	noun_phrase1(S4):-
		fronttoken(S4,X,_),
		pronoun(X).
		
	verb_phrase(S3):-
		fronttoken(S3,X,S4),
		transitive_verb(X),
		noun_phrase1(S4).
		
	verb_phrase(S3):-
		fronttoken(S3,X,_),
		intransitive_verb(X).
		
	go:-
		clearwindow,
		write("Enter the sentence"),nl,
		readln(S),
		sentence(S),
		write("The sentence is correct"),nl.
		
	go:-
		write("The sentence is incorrect"),nl.
				Goal
						go.
============================================================================================================
============================================================================================================
