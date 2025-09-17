% -----------------------------
% Prolog program for Pattern Matching
% -----------------------------

% Match if pattern is prefix of text
prefix(Pattern, Text) :-
    append(Pattern, _, Text).

% Match if pattern occurs anywhere in text
match(Pattern, Text) :-
    append(_, rest, Text),
    prefix(Pattern, rest).

% Example: match pattern in a string (string converted to char list)
string_match(PatternString, TextString) :-
    string_chars(PatternString, Pattern),
    string_chars(TextString, Text),
    match(Pattern, Text).
