% Facts
parent(john, mary).
parent(john, michael).
parent(susan, mary).
parent(susan, michael).
parent(mary, linda).
parent(mary, james).
parent(david, linda).
parent(david, james).
parent(michael, robert).
parent(michael, patricia).
parent(lisa, robert).
parent(lisa, patricia).

male(john).
male(michael).
male(david).
male(james).
male(robert).

female(susan).
female(mary).
female(linda).
female(patricia).
female(lisa).

% Rules
father(F, C) :- parent(F, C), male(F).
mother(M, C) :- parent(M, C), female(M).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

brother(B, S) :- sibling(B, S), male(B).
sister(S, Sibling) :- sibling(S, Sibling), female(S).

grandparent(GP, GC) :- parent(GP, P), parent(P, GC).
grandfather(GF, GC) :- grandparent(GF, GC), male(GF).
grandmother(GM, GC) :- grandparent(GM, GC), female(GM).

grandchild(GC, GP) :- grandparent(GP, GC).

uncle(U, N) :- brother(U, P), parent(P, N).
aunt(A, N) :- sister(A, P), parent(P, N).

cousin(C, X) :- parent(P1, C), parent(P2, X), sibling(P1, P2).
