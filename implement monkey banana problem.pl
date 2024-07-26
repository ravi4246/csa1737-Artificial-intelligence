% Facts
% Define the initial state
at(monkey, floor).
at(ladder, floor).
at(bananas, ceiling).

% Define the possible actions
action(move(monkey, floor, ladder)).
action(climb(ladder, floor, ceiling)).
action(grab_bananas(monkey, bananas, ceiling)).

% Define the rules for each action
% Moving the monkey to the ladder
move(monkey, floor, ladder) :-
    at(monkey, floor),
    at(ladder, floor),
    retract(at(monkey, floor)),
    assert(at(monkey, ladder)),
    format('The monkey moves to the ladder.~n').

% Climbing the ladder
climb(ladder, floor, ceiling) :-
    at(monkey, ladder),
    at(ladder, floor),
    retract(at(monkey, ladder)),
    assert(at(monkey, ceiling)),
    format('The monkey climbs the ladder to the ceiling.~n').

% Grabbing the bananas
grab_bananas(monkey, bananas, ceiling) :-
    at(monkey, ceiling),
    at(bananas, ceiling),
    format('The monkey grabs the bananas.~n').

% Define the goal state
goal(State) :-
    at(monkey, ceiling),
    at(bananas, ceiling),
    format('The goal is achieved: The monkey has the bananas.~n').

% Solve the problem
solve :-
    move(monkey, floor, ladder),
    climb(ladder, floor, ceiling),
    grab_bananas(monkey, bananas, ceiling),
    goal(_).

% Query the solution
:- solve.
