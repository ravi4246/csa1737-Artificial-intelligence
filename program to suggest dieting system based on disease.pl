% Facts: disease and corresponding diet
diet(cardiovascular, [fruits, vegetables, whole_grains, lean_protein, low_fat_dairy]).
diet(diabetes, [high_fiber_foods, whole_grains, vegetables, lean_protein, fruits, healthy_fats]).
diet(obesity, [low_calorie_foods, high_fiber_foods, lean_protein, vegetables, fruits, whole_grains]).
diet(hypertension, [low_sodium_foods, fruits, vegetables, whole_grains, low_fat_dairy, lean_protein]).
diet(celiac, [gluten_free_foods, fruits, vegetables, lean_protein, dairy, nuts, seeds]).

% Rules to suggest diet based on disease
suggest_diet(Disease, Diet) :-
    diet(Disease, Diet),
    format('For ~w, the recommended diet includes: ~w~n', [Disease, Diet]).

% If disease is not in the database
suggest_diet(Disease, _) :-
    \+ diet(Disease, _),
    format('Sorry, no dietary recommendations available for ~w.~n', [Disease]).
