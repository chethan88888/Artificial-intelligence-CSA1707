% sum(N, Result) :- Result is the sum of integers from 1 to N.

sum(0, 0).  % Base case: sum of numbers up to 0 is 0
sum(N, Result) :-
    N > 0,
    N1 is N - 1,
    sum(N1, Partial),
    Result is Partial + N.
