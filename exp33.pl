% -----------------------------
% Prolog program to count vowels in a string
% -----------------------------

% Check if a character is a vowel
vowel(Char) :-
    member(Char, [a, e, i, o, u, A, E, I, O, U]).

% Count vowels in a list of characters
count_vowels([], 0).
count_vowels([H|T], Count) :-
    vowel(H),
    count_vowels(T, Rest),
    Count is Rest + 1.
count_vowels([H|T], Count) :-
    \+ vowel(H),
    count_vowels(T, Count).

% Wrapper: works directly with strings
string_vowel_count(String, Count) :-
    string_chars(String, Chars),
    count_vowels(Chars, Count).
