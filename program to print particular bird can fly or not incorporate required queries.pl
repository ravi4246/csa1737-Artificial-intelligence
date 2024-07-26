% Facts
% can_fly(Bird): Indicates that the bird can fly
can_fly(sparrow).
can_fly(eagle).
can_fly(pigeon).
can_fly(swallow).

% cannot_fly(Bird): Indicates that the bird cannot fly
cannot_fly(ostrich).
cannot_fly(penguin).
cannot_fly(kiwi).
cannot_fly(emperor_penguin).

% Rule to determine if a bird can fly
bird_can_fly(Bird) :-
    can_fly(Bird),
    format('~w can fly.~n', [Bird]).

% Rule to determine if a bird cannot fly
bird_can_fly(Bird) :-
    cannot_fly(Bird),
    format('~w cannot fly.~n', [Bird]).

% If the bird is not in the database
bird_can_fly(Bird) :-
    \+ can_fly(Bird),
    \+ cannot_fly(Bird),
    format('Information about ~w is not available in the database.~n', [Bird]).
