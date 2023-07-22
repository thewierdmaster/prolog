go:-
write('Enter the patient name'),
read(Patient),get_single_char(Code),
hypothesis(Patient,Severity),
write_list([Patient,', is',Severity]),nl.

go:-
write("Sorry could able to find the severity level").



symptom(Patient,fever):-
verify(Patient,"Do you have fever(y/n)?").

symptom(Patient,cold):-
verify(Patient,"Do you have cold(y/n)?").

symptom(Patient,stomach_pain):-
verify(Patient,"Do you have stomach pain(y/n)?").

symptom(Patient,head_ache):-
verify(Patient,"Do you have head_ache(y/n)?").

symptom(Patient,fatigue):-
verify(Patient,"are you feeling fatigue(y/n)?").

symptom(Patient,rash):-
verify(Patient,"Do you have rash (y/n)?").


ask(Patient, Question):-
write(Patient),write(Question),
read(Response),
((Response==yes;Response==y)->
assert(yes(Question));
assert(no(Question)),fail).

:- dynamic yes/1,no/1.

verify(P,S):-
(yes(S)->true;
(no(S)->fail;
ask(P,S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


hypothesis(Patient,more_severe):-
symptom(Patient,head_ache),
symptom(Patient,fever),
symptom(Patient,cold),
symptom(Patient,fatigue),
symptom(Patient,rash).
hypothesis(Patient,less_severe):-
not(hypothesis(Patient,more_severe)),
symptom(Patient,head_ache),
symptom(Patient,fever),
symptom(Patient,cold).
hypothesis(Patient,not_severe):-
not(hypothesis(Patient,more_severe)),
not(hypothesis(Patient,less_severe)).

write_list([]).
write_list([Term|Terms]):-
write(Term),
write_list(Terms).

response(Reply) :-
get_single_char(Code),
put_code(Code), nl,
char_code(Reply, Code).