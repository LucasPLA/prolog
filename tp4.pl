:-lib(ic).
:-lib(ic_symbolic).

getData(TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf):-
    NbEquipes is 4,
    NbBateaux is 3,
    NbConf is 3,
    TailleEquipes = [5, 5, 2, 1],
    CapaBateaux = [7, 6, 5].

defineVars(T, NbEquipes, NbConf, NbBateaux):-
    dim(T, [NbEquipes, NbConf]),
    T #:: 1..NbBateaux.

getVarList(T, Liste):-
    dim(T, [NbEquipes, NbConf]),
    (multifor([Conf, Equipe], [1,1], [NbConf, NbEquipes]), foreach(Elem, Liste), param(T) do 
        Elem is T[Equipe, Conf]
    ).

%pasMemeBateaux(T)

solve(Liste):-
    getData(TailleEquipes, NbEquipes, CapaBateaux, NbBateaux, NbConf),
    defineVars(T, NbEquipes, NbConf, NbBateaux),
    getVarList(T,Liste),
    forLabeling(Liste, 0, 3).
    /*(foreach(Elem, Liste) do
        labeling([Elem])
    ).*/

forLabeling(Liste, Start, End):-
    NewStart is Start - 1,
    NewEnd is End - 1,
    forLabeling(Liste, NewStart, NewEnd).

forLabeling([Head|Tail], 0, End):-
    labeling([Head]),
    NewEnd is End -1,
    forLabeling(Tail, 0, NewEnd).

forLabeling([Head|_], 0, 0):-
    labeling([Head]).