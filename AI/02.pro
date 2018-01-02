problem-02
______________________________________________________________________________________________
predicates
		male(string)
		female(string)
		parentof(string,string)
		childof(string,string)
		go
		relation(string,string)
		check(char)
		
clauses
		male(shak).
		male(naimur).
		
		male(kasem).
		male(akter).
		male(boktier).
		male(fardin).
		
		female(hasina).
		female(beauty).
		female(fahima).
		female(fariha).
		
		female(razina).
		female(nipa).
		
		
		parentof(shak,naimur).
		parentof(shak,nipa).
		parentof(razina,nipa).
		parentof(razina,naimur).
		
		parentof(kasem,beauty).
		parentof(kashem,akter).
		parentof(kasem,boktier).
		parentof(hasina,beauty).
		parentof(hasina,akter).
		parentof(hasina,boktier).
		
		parentof(beauty,fahima).
		parentof(akter,fardin).
		parentof(akter,fariha).
		
		
		childof(naimur,shak).
		childof(nipa,shak).
		childof(nipa,razina).
		childof(naimur,razina).
		
		childof(beauty,kasem).
		childof(akter,kasem).
		childof(boktier,kasem).
		childof(beauty,hasina).
		childof(akter,hasina).
		childof(boktier,hasina).
		
		childof(fahima,beauty).
		childof(fardin,akter).
		childof(fariha,akter).
		
		go:-
			clearwindow,
			write("Enter 1st Name:"),nl,
			readln(S1),
			
			write("Enter 2nd Name:"),nl,
			readln(S2),
			
			relation(S1,S2),
			
			write("Enter again? type(y/n) "),nl,
			readchar(R),
			write(R),
			check(R).
			
		go:-
			clearwindow,
			write("sorry,unrecognized relation"),nl,
			
			 write("Try again? type(y/n) "),nl,
			 readchar(R),
			 write(R),
			 check(R).
			 
		check(Rchar):-
			Rchar='y',
			go.
			
		check(Rchar):-
			Rchar='n',
			!.
			
		check(Rchar):-
			Rchar=Rchar,
			write("wrong entering,type y/n"),nl,
			readchar(R),
			write(R),
			check(R).
			
	/*father-mother*/
		relation(S1,S2):-
			parentof(S1,S2),
			male(S1),
			write(S1 ," is father of ",S2),nl.
			
		relation(S1,S2):-
			parentof(S1,S2),
			female(S1),
			write(S1 ," is mother of ",S2),nl.
			
	/*son-daughter*/
		relation(S1,S2):-
			childof(S1,S2),
			male(S1),
			write(S1 ," is son of ",S2),nl.
			
		relation(S1,S2):-
			childof(S1,S2),
			female(S1),
			write(S1 ," is daughter of ",S2),nl.
			
	/*brother-sister*/
		relation(S1,S2):-
			parentof(X,S1),
			parentof(X,S2),
			parentof(Y,S1),
			parentof(Y,S2),
			male(S1),
			female(S2),
			write(S1 ," is brother of ",S2),nl.
			
		relation(S1,S2):-
			parentof(X,S1),
			parentof(X,S2),
			parentof(Y,S1),
			parentof(Y,S2),
			female(S1),
			male(S2),
			write(S1 ," is sister of ",S2),nl.
			
	/*siblings*/
		relation(S1,S2):-
			parentof(X,S1),
			parentof(X,S2),
			parentof(Y,S1),
			parentof(Y,S2),
			write(S1 ," is sibling of ",S2),nl.
			
	/*grandfather-mother*/
		relation(S1,S2):-
			parentof(X,S2),
			parentof(S1,X),
			male(S1),
			write(S1 ," is grand father of ",S2),nl.
			
		relation(S1,S2):-
			parentof(X,S2),
			parentof(S1,X),
			female(S1),
			write(S1 ," is grand mother of ",S2),nl.
			
		Goal
			go.

			
==========================================================================================================
=========================================================================================================
