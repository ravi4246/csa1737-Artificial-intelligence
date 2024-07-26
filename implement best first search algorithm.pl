% Define the graph (edges between nodes)
edge(start, a, 1).
edge(start, b, 2).
edge(a, goal, 2).
edge(b, goal, 1).

% Define heuristic estimates (h(n) - estimated cost to reach goal from node n)
heuristic(start, 4).
heuristic(a, 2).
heuristic(b, 1).
heuristic(goal, 0).

% Best First Search algorithm
best_first_search(Start, Goal, Path, Cost) :-
    best_first_search([[Start]], Goal, Path, Cost, []).

% Base case: path found
best_first_search([[Goal|Path]|_], Goal, [Goal|Path], Cost, _) :-
    path_cost([Goal|Path], Cost).

% Recursive case: explore paths
best_first_search(Paths, Goal, FinalPath, Cost, ClosedSet) :-
    select(Path, Paths, RemainingPaths),
    extend_path(Path, NewPaths, ClosedSet),
    append(RemainingPaths, NewPaths, AllPaths),
    sort_paths(AllPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, FinalPath, Cost, [Path|ClosedSet]).

% Extend the current path with new nodes
extend_path([Node|Path], NewPaths, ClosedSet) :-
    findall([Next, Node|Path],
            (edge(Node, Next, _), \+ member(Next, [Node|Path]), \+ member([Next, _, _], ClosedSet)),
            NewPaths).

% Calculate the cost of a path
path_cost([_], 0).
path_cost([Node1, Node2|Rest], Cost) :-
    edge(Node1, Node2, EdgeCost),
    path_cost([Node2|Rest], RestCost),
    Cost is EdgeCost + RestCost.

% Sort paths based on the heuristic value of their last node
sort_paths(Paths, SortedPaths) :-
    map_list_to_pairs(path_cost_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, SortedPaths).

% Pair path with its heuristic value
path_cost_heuristic(Path, Cost-Heuristic) :-
    last(Path, LastNode),
    heuristic(LastNode, Heuristic),
    path_cost(Path, Cost).

% Example query
:- initialization(main).

main :-
    format('Running Best First Search~n'),
    best_first_search(start, goal, Path, Cost),
    format('Path found: ~w~n', [Path]),
    format('Total cost: ~w~n', [Cost]),
    halt.
