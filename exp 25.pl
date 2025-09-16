% Monkey and Banana Problem in Prolog
% State representation: state(MonkeyPos, BoxPos, MonkeyOnBox?, HasBanana?)

% Initial state: Monkey at door, box at window, not on box, does not have banana
initial(state(at_door, at_window, on_floor, has_not)).

% Goal state: Monkey has the banana
goal(state(_, _, _, has)).

% Possible actions

% Monkey moves to a different position
move(state(at_door, Box, on_floor, Has), 
     state(at_window, Box, on_floor, Has)).

move(state(at_window, Box, on_floor, Has), 
     state(at_door, Box, on_floor, Has)).

move(state(at_window, Box, on_floor, Has), 
     state(at_middle, Box, on_floor, Has)).

move(state(at_door, Box, on_floor, Has), 
     state(at_middle, Box, on_floor, Has)).

move(state(at_middle, Box, on_floor, Has), 
     state(at_window, Box, on_floor, Has)).

move(state(at_middle, Box, on_floor, Has), 
     state(at_door, Box, on_floor, Has)).

% Monkey pushes the box if at same position
move(state(Pos, Pos, on_floor, Has), 
     state(NewPos, NewPos, on_floor, Has)) :-
     member(NewPos, [at_door, at_window, at_middle]),
     Pos \= NewPos.

% Monkey climbs onto the box
move(state(Pos, Pos, on_floor, Has), 
     state(Pos, Pos, on_box, Has)).

% Monkey climbs down from the box
move(state(Pos, Pos, on_box, Has), 
     state(Pos, Pos, on_floor, Has)).

% Monkey grabs the banana when on box at middle
move(state(at_middle, at_middle, on_box, has_not), 
     state(at_middle, at_middle, on_box, has)).

% Recursive rule: find solution path
solution(State, []) :- goal(State).
solution(State, [Action|Steps]) :-
    move(State, NextState),
    action_description(State, NextState, Action),
    solution(NextState, Steps).

% Action descriptions for printing
action_description(state(_,_,_,_), state(at_middle,at_middle,on_box,has), 'Grab the banana').
action_description(state(Pos, Box, on_floor, Has), state(NewPos, Box, on_floor, Has), 
                   Action) :- atom_concat('Move from ', Pos, P1), atom_concat(P1, ' to ', P2), atom_concat(P2, NewPos, Action).
action_description(state(Pos, Pos, on_floor, Has), state(NewPos, NewPos, on_floor, Has), 
                   Action) :- atom_concat('Push box from ', Pos, P1), atom_concat(P1, ' to ', P2), atom_concat(P2, NewPos, Action).
action_description(state(Pos, Pos, on_floor, Has), state(Pos, Pos, on_box, Has), 'Climb onto the box').
action_description(state(Pos, Pos, on_box, Has), state(Pos, Pos, on_floor, Has), 'Climb down from the box').
