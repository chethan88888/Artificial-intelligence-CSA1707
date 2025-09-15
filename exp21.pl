% Prolog program to solve Towers of Hanoi

% hanoi(N, Source, Target, Auxiliary).
% N = number of disks
% Source = from where we move
% Target = destination peg
% Auxiliary = helper peg

hanoi(1, Source, Target, _) :-
    write('Move disk 1 from '), write(Source),
    write(' to '), write(Target), nl.

hanoi(N, Source, Target, Auxiliary) :-
    N > 1,
    N1 is N - 1,
    hanoi(N1, Source, Auxiliary, Target),
    write('Move disk '), write(N),
    write(' from '), write(Source),
    write(' to '), write(Target), nl,
    hanoi(N1, Auxiliary, Target, Source).
