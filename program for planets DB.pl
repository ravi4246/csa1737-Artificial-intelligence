% Facts
% planet(Name, Type, DistanceFromSun, NumberOfMoons)
planet('Mercury', 'Terrestrial', 0.39, 0).
planet('Venus', 'Terrestrial', 0.72, 0).
planet('Earth', 'Terrestrial', 1.00, 1).
planet('Mars', 'Terrestrial', 1.52, 2).
planet('Jupiter', 'Gas Giant', 5.20, 79).
planet('Saturn', 'Gas Giant', 9.58, 82).
planet('Uranus', 'Ice Giant', 19.22, 27).
planet('Neptune', 'Ice Giant', 30.05, 14).

% Rules
% Find the type of a planet given its name
find_type(Name, Type) :-
    planet(Name, Type, _, _).

% Find the distance from the sun of a planet given its name
find_distance(Name, Distance) :-
    planet(Name, _, Distance, _).

% Find the number of moons of a planet given its name
find_moons(Name, Moons) :-
    planet(Name, _, _, Moons).

% Find all planets of a given type
find_planets_by_type(Type, Planets) :-
    findall(Name, planet(Name, Type, _, _), Planets).

% Find all planets within a certain distance from the sun
find_planets_within_distance(MaxDistance, Planets) :-
    findall(Name, (planet(Name, _, Distance, _), Distance =< MaxDistance), Planets).

% Add a new planet to the database
add_planet(Name, Type, Distance, Moons) :-
    assertz(planet(Name, Type, Distance, Moons)).

% Remove a planet from the database
remove_planet(Name) :-
    retract(planet(Name, _, _, _)).
