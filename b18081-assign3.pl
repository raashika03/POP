member(X, [X | _]). 
member(X, [_ | Y]) :- member(X, Y).

append([],X,X).
append([H|T],Y,[H|Z]) :- append(T,Y,Z).

commonObj(X,Y) :- allocation3(X,A),allocation3(Y,A).

removeDuplicates(L,R) :- loop(L,[],R).
loop([H|T],L,R) :- member(H,L) -> loop(T,L,R) ; L1 = [H|L],loop(T,L1,L2),R = [H|L2].
loop([],_,[]).

objList([H|T],R) :- pointees(H,K1),objList(T,K2),append(K1,K2,R).
objList([],[]). 

var_to_obj([H|T],R) :- pointees(H,K1),var_to_obj(T,K2),append(K1,K2,R).
var_to_obj([],[]). 

allocation1(X,Y) :- allocation2([],X,Y).
allocation2(_,X,Y) :- alloc(X,Y).
allocation2(L,X,Y) :- not(member(X,L)) -> L1 = [X|L],copy(X,Z),allocation2(L1,Z,Y).

fun2(X,Y) :- allocation1(X,A),allocation1(Y,A).

fun1(X,Y,A,B) :- load(X,Y,Z),store(A,Z,B),fun2(Y,A).

allocation3(X,Y) :- allocation4([],X,Y).
allocation4(_,X,Y) :- allocation1(X,Y).
allocation4(L,X,Y) :- not(member(X,L)) -> L1 = [X|L],fun1(X,_,_,C),allocation4(L1,C,Y).

pointees(X,L) :- findall(Y,allocation3(X,Y),L1),removeDuplicates(L1,L).

fieldpointees(X,L,R) :- L1 = [X],fieldLoop(L1,L,L2),var_to_obj(L2,L3),removeDuplicates(L3,R).

fieldLoop(L,[],L).
fieldLoop(L,[H|T],R) :- varLoop(L,H,L1),fieldLoop(L1,T,R).

varLoop([],_,[]).
varLoop([H|T],F,R) :- findall([V1,V2],store(V1,F,V2),L1),storeLoop(H,L1,L2),varLoop(T,F,L3),append(L2,L3,R).

storeLoop(_,[],[]).
storeLoop(X,[H|T],R) :- [E1|E2] = H,commonObj(X,E1) -> storeLoop(X,T,L1),append(L1,E2,R) ; storeLoop(X,T,R).


