% Knowledge Base
bird(sparrow).
bird(pigeon).
bird(parrot).
bird(penguin).
bird(ostrich).
bird(crow).

% Facts about birds that cannot fly
cannot_fly(penguin).
cannot_fly(ostrich).

% Rule: A bird can fly if it is a bird and not listed in cannot_fly
can_fly(X) :-
    bird(X),
    \+ cannot_fly(X).

% Rule: A bird cannot fly if explicitly listed
cannot_fly_bird(X) :-
    bird(X),
    cannot_fly(X).
