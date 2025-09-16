% Prolog program to implement Best First Search

% Graph representation: edge(Node, Neighbor, Cost).
edge(a, b, 1).
edge(a, c, 3).
edge(b, d, 3).
edge(b, e, 1).
edge(c, f, 1).
edge(e, g, 2).
edge(f, g, 5).

% Heuristic values: h(Node, HeuristicCost)
h(a, 5).
h(b, 3).
h(c, 4).
h(d, 6).
h(e, 2).
h(f, 6).
h(g, 0).   % Goal node has heuristic = 0

% Best-first search implementation
bestfs(Start, Goal, Path) :-
    bestfs([[Start]], Goal, Path).

% If path starts with Goal, success
bestfs([[Goal|Rest]|_], Goal, Path) :-
    reverse([Goal|Rest], Path).

% Expand paths
bestfs([Path|Paths], Goal, Result) :-
    Path = [Current|_],
    findall([Next,Current|Path],
            (edge(Current, Next, _), \+ member(Next, Path)),
            NewPaths),
    evaluate(NewPaths, ScoredPaths),
    append(Paths, ScoredPaths, UpdatedPaths),
    sort(UpdatedPaths, SortedPaths),
    bestfs(SortedPaths, Goal, Result).

% Evaluate paths using heuristic
evaluate([], []).
evaluate([[Node|Rest]|Paths], [[Score,[Node|Rest]]|Scored]) :-
    h(Node, Score),
    evaluate(Paths, Scored).

% Sort comparator (already handled by sort/2 in Prolog)
