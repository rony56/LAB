=============================================================================================================
problem-01
____________________________________________________________________________________________________________________
/*
Develop a prolog program which can evaluate a boolean expression having three variables
involving 'and',and 'or*'* 
trace*/

domains
X, Y, Z, R1, R2=integer
Input=string

predicates
xyz(X,Y,Z)
truthtable(Input)
go

clauses
xyz(0,0,0).
xyz(0,0,1).
xyz(0,1,0).
xyz(0,1,1).
xyz(1,0,0).
xyz(1,0,1).
xyz(1,1,0).
xyz(1,1,1).

go:-
clearwindow,
write("Enter the Truth Table:"),nl,
readln(Input),
truthtable(Input),

go.

truthtable("x and y and z"):-
write("x","y","z"," ","out"),nl,
xyz(X,Y,Z),
bitand(X,Y,R1),
bitand(R1,Z,R2),
write(X, Y, Z," ",R2),nl,
fail.

truthtable("x or y or z"):-
write("x","y","z"," ","out"),nl,
xyz(X,Y,Z),
bitor(X,Y,R1),
bitor(R1,Z,R2),
write(X, Y, Z," ",R2),nl,
fail.


truthtable("x and y or z"):-
write("x","y","z"," ","out"),nl,
xyz(X,Y,Z),
bitand(X,Y,R1),
bitor(R1,Z,R2),
write(X, Y, Z," ",R2),nl,
fail.

truthtable("x or y and z"):-
write("x","y","z"," ","out"),nl,
xyz(X,Y,Z),
bitand(X,Y,R1),
bitor(R1,Z,R2),
write(X, Y, Z," ",R2),nl,
fail.
goal
go.

==================================================================================================================
=====================================================================================================================
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
problem-04
________________________________________________________________

domains
		name,password,disease,symptom=symbol
		patient,query,thana,dist=string
		age=integer
		reply=char
		
database
		patient_name(patient)
		patient_age(age)
		patient_address(thana,dist)
		xpositive (patient,symptom)
		xnegative (patient,symptom)
		
predicates
		getinput(name,password)
		logon
		user(name,password)
		
		chkage(patient)
		hypothesis(patient,disease)
		symptom(patient,symptom)
		response(reply)
		go
		repeat
		positive(query,patient,symptom)
		clear_facts
		remember(patient,symptom,reply)
		ask(query,patient,symptom,reply)
		
clauses
		repeat.
		repeat:-
				repeat.
	logon:-
			getinput(_,_),
			write("You are now logged on."),nl,nl.
	logon:-
			repeat,
			
			write("You are not permitted to access."),nl,
			write("Please try again."),nl,nl,
			getinput(_,_),
			write("You are now logged on."),nl,nl.
			
	getinput(Name,password):-
			write("Please enter user name: "),
			readln(Name),
			write("Enter password: "),
			readln(Password),nl,nl,
			user(Name,Password).
			
		user(tahoshina,naznin).
		
	go:-
			write("Enter Patient Name : "),
			readln(Patient),
			asserta(patient_name(Patient)),
			write("Enter",Patient,"'s thana: "),
		    readln(Thana),
			write("Enter",Patient,"'s dist: "),
			readln(Dist),
			asserta(patient_address(Thana,Dist)),
			
	chkage(Patient),
    hypothesis(Patient,Disease),!,
    write(Patient," probably has ",Disease),nl,
    clear_facts.

 go:-
             write("Patient age should be below 12 years and"),nl,
			 write("Sorry i am not able to"),nl,
			 write("diagnosies the disease ."),nl,
			 clear_facts.
			 
	chkage(Patient):-
	         write("what is",Patient,"'s age: "),
			 readint(Age),
			 asserta(patient_age(Age)),nl,nl,
			 Age<30,!.
			 
	positive(_,Patient,Symptom) :-
            xpositive(Patient,Symptom),!.

    			
	positive(Query,Patient,Symptom):-
				not(xnegative(Patient,Symptom)),
					ask(Query,Patient,Symptom,Reply),
					Reply='y'.
					
	ask(Query,Patient,Symptom,Reply):-
				write(Query),nl,
				readchar(Reply),
				write(Reply),nl,
				remember(Patient,Symptom,Reply).
				
	remember(Patient,Symptom,'y'):-
				asserta(xnegative(Patient,Symptom)),
				save("d:\\output.txt").
				
	remember(Patient,Symptom,'n'):-
				asserta(xnegative(Patient,Symptom)),
				save("d:\\output.txt").
				
	clear_facts:-
				retract(xpositive(_,_)),fail.
	clear_facts:-
				retract(xpositive(_,_)),fail.
	clear_facts.
	
	symptom(Patient,fever):-
			positive("Does the Patient have te fever (y/n)?",Patient,fever).
	symptom(Patient,rash):-
			positive("Does the Patient have te rash (y/n)?",Patient,rash).
	symptom(Patient,headache):-
			positive("Does the Patient have te headache (y/n)?",Patient,headache).
	symptom(Patient,runny_nose):-
			positive("Does the Patient have te runny nose (y/n)?",Patient,runny_nose).
	symptom(Patient,conjunctivitis):-
			positive("Does the Patient have te conjunctivitis (y/n)?",Patient,conjunctivitis).
	symptom(Patient,cough):-
			positive("Does the Patient have te cough (y/n)?",Patient,cough).
	symptom(Patient,body_ache):-
			positive("Does the Patient have te body ache (y/n)?",Patient,body_ache).
	symptom(Patient,chills):-
			positive("Does the Patient have te chills (y/n)?",Patient,chills).
	symptom(Patient,sore_throat):-
			positive("Does the Patient have te sore_throat (y/n)?",Patient,sore_throat).
	symptom(Patient,sneezing):-
			positive("Does the Patient have te sneezing (y/n)?",Patient,sneezing).
	symptom(Patient,swollen_glands):-
			positive("Does the Patient have te swollen_glands (y/n)?",Patient,swollen_glands).
	
	
	hypothesis(Patient,measles):-
				symptom(Patient,fever),
				symptom(Patient,rash),
				symptom(Patient,conjunctivitis),
				symptom(Patient,cough),
				symptom(Patient,runny_nose).
				
	hypothesis(Patient,german_measles):-
				symptom(Patient,fever),
				symptom(Patient,headache),
				symptom(Patient,rash),
				symptom(Patient,runny_nose).
				
	hypothesis(Patient,flu):-
				symptom(Patient,fever),
				symptom(Patient,headache),
				symptom(Patient,body_ache),
				symptom(Patient,chills),
				symptom(Patient,cough),
				symptom(Patient,sore_throat),
				symptom(Patient,conjunctivitis),
				symptom(Patient,runny_nose).
				
	hypothesis(Patient,common_old):-
				symptom(Patient,sneezing),
				symptom(Patient,headache),
				symptom(Patient,chills),
				symptom(Patient,sore_throat),
				symptom(Patient,runny_nose).
				
	hypothesis(Patient,common_mumps):-
				symptom(Patient,fever),
				symptom(Patient,swollen_glands).
				
	hypothesis(Patient,whooping_cough):-
				symptom(Patient,sneezing),
				symptom(Patient,cough),
				symptom(Patient,runny_nose).
				
		response(Reply):-
				readchar(Reply),
				write(Reply),nl.
				
				Goal
				logon,go.			
