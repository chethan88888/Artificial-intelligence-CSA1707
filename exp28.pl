% Prolog program for medical diagnosis expert system

% Facts: disease(Name, [List of Symptoms])
disease(cold,      [sneezing, runny_nose, sore_throat, mild_fever]).
disease(flu,       [high_fever, headache, body_pain, sore_throat, cough]).
disease(malaria,   [high_fever, chills, sweating, headache, nausea]).
disease(typhoid,   [prolonged_fever, stomach_pain, headache, loss_of_appetite]).
disease(covid19,   [fever, dry_cough, tiredness, loss_of_taste, breathing_difficulty]).

% Rule: check if all symptoms of a disease match the patient’s symptoms
has_disease(Disease, PatientSymptoms) :-
    disease(Disease, Symptoms),
    subset(Symptoms, PatientSymptoms).

% Helper: check if all elements of first list are in second list
subset([], _).
subset([H|T], list) :- member(H, list), subset(T, list).
