myLast(S, [S]).
myLast(X, [ _ | T]) :- myLast(X, T), !.
