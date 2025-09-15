% --- Family Tree Knowledge Base ---

% Facts: parent(Parent, Child)
parent(john, mary).
parent(john, tom).
parent(susan, mary).
parent(susan, tom).
parent(mary, alice).
parent(mary, bob).
parent(peter, alice).
parent(peter, bob).
parent(tom, david).
parent(linda, david).

% Rules

% Father rule
father(X, Y) :- parent(X, Y), male(X).

% Mother rule
mother(X, Y) :- parent(X, Y), female(X).

% Grandparent rule
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Sibling rule
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Gender facts
male(john).
male(tom).
male(peter).
male(bob).
male(david).

female(susan).
female(mary).
female(linda).
female(alice).
