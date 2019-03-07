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

iterator(Tab):-
    taches(Tab),
    (foreachelem(Elem, Tab) do
        writeln(Elem)
    ).

domaines(Taches, Fin):-
    taches(Taches),
    (foreachelem(tache(Duree, _Pred, _Machine, Debut), Taches), param(Fin) do
        Fin #> 0,
        labeling([Fin]),
        Debut #> 0,
        DebutMax is Fin - Duree,
        Debut #=< DebutMax
    ).

getVarList(Taches, Fin, List):-
    (foreachelem(tache(W,X,Y,Z), Taches),
        fromto([], In, Out, List) do
            append(In, [W,X,Y,Z], Out)
    ).

resoudre(Tache, Fin):-
    taches(Tache),
    domaines(Tache, Fin),
    getVarList(Tache, Fin, List),
    labeling([List]).