:-lib(ic).
:-lib(ic_symbolic).


:- local domain(machine(m1, m2)).

taches(Taches):-
    Taches = [](tache(3, [], m1, _),
    tache(8, [], m1, _),
    tache(8, [4,5], m1, _),
    tache(6, [], m2, _),
    tache(3, [1], m2, _),
    tache(4, [1,7], m1, _),
    tache(8, [3,5], m1, _),
    tache(6, [4], m2, _),
    tache(6, [6,7], m2, _),
    tache(6, [9,12], m2, _),
    tache(3, [1], m2, _),
    tache(6, [7,8], m2, _)).

/*ite(Tab, Count, Count):-
    Kermit is Tab[Count],
    writeln(Kermit).

ite(Tab, Count, Dim):-
    Kermit is Tab[Count],
    writeln(Kermit),
    Z is Count + 1,
    ite(Tab, Z, Dim).

iterator(X):-
    taches(X),
    dim(X, [Dim]),
    ite(X, 1, Dim).*/

iterator(Tab):-
    taches(Tab),
    (foreachelem(Elem, Tab) do
        writeln(Elem)
    ).

domaines(Taches, Fin):-
    taches(Taches),
    (foreachelem(tache(W,N,_,Z), Taches), param(Fin) do
        Z #> 0,
        Fin #:: 1..100,
        labeling([Fin]),
        DebutMax is Fin - W,
        Z #< DebutMax
    ).

getVarList(Taches, Fin, List):-
    domaines(Taches, Fin),
    (foreach(tache(W,X,Y,Z), Taches),
        fromto([], In, Out, List) do
            append(In, [W,X,Y,Z], Out)
    ).

