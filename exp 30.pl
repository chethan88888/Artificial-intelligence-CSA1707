% -----------------------------
% Prolog program for Backward Chaining
% -----------------------------

% Facts
fact(rainy).
fact(cloudy).

% Rules
rule(wet_ground, [rainy, cloudy]).
rule(traffic_jam, [wet_ground]).
rule(late_for_office, [traffic_jam]).
rule(carry_umbrella, [rainy]).

% Backward chaining: prove a Goal
prove(Goal) :-
    fact(Goal),                     % If Goal is a fact, succeed
    write(Goal), write(' is true (fact).'), nl.

prove(Goal) :-
    rule(Goal, Conditions),         % If Goal can be derived by a rule
    prove_all(Conditions),          % Prove all conditions
    write(Goal), write(' is true (derived).'), nl.

% Prove a list of goals
prove_all([]).
prove_all([H|T]) :-
    prove(H),
    prove_all(T).

% Query interface
ask(Goal) :-
    (prove(Goal) -> true ; write(Goal), write(' cannot be proven.'), nl).
