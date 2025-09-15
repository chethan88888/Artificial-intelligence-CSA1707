% Prolog database with NAME and DOB (Date of Birth)

% Format: person(Name, DOB).
% DOB can be written as date(Day, Month, Year).

person('Arun', date(12, may, 2000)).
person('Divya', date(23, june, 1999)).
person('Karthik', date(5, august, 2001)).
person('Priya', date(14, february, 2002)).

% Rule to display a person’s DOB
get_dob(Name, DOB) :-
    person(Name, DOB).
