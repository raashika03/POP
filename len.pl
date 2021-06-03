mylength([], 0).
mylength([_|L], N) 
:-mylength(L, M), N is M + 1.