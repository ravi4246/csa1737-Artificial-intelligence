% Facts
person('John Doe', '1990-05-15').
person('Jane Smith', '1985-07-20').
person('Alice Johnson', '2000-12-01').
person('Bob Brown', '1978-03-23').

% Rules
% Find a person's DOB given their name
find_dob(Name, DOB) :-
    person(Name, DOB).

% Find a person's name given their DOB
find_name(DOB, Name) :-
    person(Name, DOB).

% Add a new person to the database
add_person(Name, DOB) :-
    assertz(person(Name, DOB)).

% Remove a person from the database
remove_person(Name) :-
    retract(person(Name, _)).
