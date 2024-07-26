% Define the main predicate to solve the Towers of Hanoi problem
hanoi(N) :-
    move(N, left, middle, right).

% Base case: Moving one disk directly from Source to Destination
move(1, Source, _, Destination) :-
    format('Move disk from ~w to ~w~n', [Source, Destination]).

% Recursive case: Move N disks from Source to Destination using Aux as auxiliary
move(N, Source, Aux, Destination) :-
    N > 1,
    M is N - 1,
    move(M, Source, Destination, Aux),     % Move N-1 disks from Source to Aux
    move(1, Source, _, Destination),       % Move the remaining disk from Source to Destination
    move(M, Aux, Source, Destination).     % Move N-1 disks from Aux to Destination
