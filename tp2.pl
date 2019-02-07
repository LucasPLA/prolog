:-lib(ic).
:-lib(ic_symbolic).

% question 2.1

:- local domain(pays(anglais, espagnol, ukrainiens, norvegien, japonais)).
:- local domain(couleur(rouge, vert, bleu, jaune, blanche)).
:- local domain(boisson(the, cafe, judorange, lait, eau)).
:- local domain(voiture(bmw, toyota, datsu, honda, ford)).
:- local domain(animal(renard, chien, zebre, cheval, serpent)).

% question 2.2

domaines_maisons(m(Pays,Couleur,Boisson,Voiture,Animal, Numero), Num2):-
    Pays &:: pays,
    Couleur &:: couleur,
    Boisson &:: boisson,
    Voiture &:: voiture,
    Animal &:: animal,
    Numero = Num2.

% question 2.3

rueAux([], 0).

rueAux([Head|Tail], Num):-
    domaines_maisons(Head, Num),
    Nume is Num - 1,
    rueAux(Tail, Nume).

rue(Rue):-
    rueAux(Rue, 5).

%rue([m(anglais, rouge, the, bmw, renard,5), m(anglais, rouge, the, bmw, renard,4), m(anglais, rouge, the, bmw, renard,3), m(anglais, rouge, the, bmw, renard,2),m(anglais, rouge, the, bmw, renard,1)]).

% question 2.4

ecrit_maisons(Rue):-
    (foreach(Elem, Rue) do
        writeln(Elem)
    ).

% ecrit_maisons(([m(anglais, rouge, the, bmw, renard,5), m(anglais, rouge, the, bmw, renard,4), m(anglais, rouge, the, bmw, renard,3), m(anglais, rouge, the, bmw, renard,2),m(anglais, rouge, the, bmw, renard,1)])).

% question 2.5

getVarList(Rue, Res):-
    (foreach(m(A,B,C,D,E,F), Rue),
        fromto([], In, Out, Res) do
            append(In, [A,B,C,D,E,F], Out)
    ).

% getVarList([m(anglais, rouge, the, bmw, renard,5), m(anglais, rouge, the, bmw, renard,4), m(anglais, rouge, the, bmw, renard,3), m(anglais, rouge, the, bmw, renard,2),m(anglais, rouge, the, bmw, renard,1)], X).

labeling_symbolic(Liste):-
    (foreach(Elem, Liste) do
        ic_symbolic:indomain(Elem)
    ).

% question 2.6

resoudre(X):-
    rue(X),
    getVarList(X, Res),
    labeling_symbolic(Res).


