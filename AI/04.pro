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
