% -----------------------------
% Prolog program for Forward Chaining
% -----------------------------

% Initial facts
fact(rainy).
fact(cloudy).

% Rules (if all conditions true, then new fact is true)
rule([rainy, cloudy], wet_ground).
rule([wet_ground], traffic_jam).
rule([traffic_jam], late_for_office).
rule([rainy], carry_umbrella).

% Forward chaining: keep deriving new facts until no more can be added
forward_chain :-
    new_fact(F),
    \+ fact(F),       % only add if fact not already present
    asserta(fact(F)),
    write('Derived: '), write(F), nl,
    forward_chain.
forward_chain :- 
    write('No more new facts can be derived.'), nl.

% Find a new fact based on existing facts
new_fact(F) :-
    rule(Conditions, F),
    all_true(Conditions).

% Check if all conditions are true
all_true([]).
all_true([H|T]) :-
    fact(H),
    all_true(T).

% Query to check if a fact can be derived
ask(F) :-
    (fact(F) -> write(F), write(' is true.'), nl
    ; write(F), write(' cannot be derived.'), nl).
