% Facts about fruits and their colors
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lime, green).
fruit_color(strawberry, red).
fruit_color(lemon, yellow).

% Rule to find the color of a fruit
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Rule to find all fruits of a specific color
fruits_of_color(Color, Fruit) :-
    fruit_color(Fruit, Color).

% Query examples
% Find the color of a specific fruit
% ?- color_of_fruit(apple, Color).
% ?- color_of_fruit(strawberry, Color).

% Find all fruits of a specific color
% ?- fruits_of_color(red, Fruit).
% ?- fruits_of_color(yellow, Fruit).

% Sample execution
:- initialization(main).

main :-
    format('Finding colors of fruits~n'),
    color_of_fruit(apple, Color1),
    format('The color of apple is ~w~n', [Color1]),
    color_of_fruit(strawberry, Color2),
    format('The color of strawberry is ~w~n', [Color2]),
    format('Finding all fruits of color red~n'),
    fruits_of_color(red, Fruit1),
    format('Fruit with red color: ~w~n', [Fruit1]),
    fail.

main :-
    format('Finding all fruits of color yellow~n'),
    fruits_of_color(yellow, Fruit2),
    format('Fruit with yellow color: ~w~n', [Fruit2]),
    fail.

main :-
    format('All queries completed.~n').
