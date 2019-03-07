:-lib(ic).
:-lib(ic_symbolic).

% question 2.1

:- local domain(pays(anglais, espagnol, ukrainiens, norvegien, japonais)).
:- local domain(couleur(rouge, vert, bleu, jaune, blanche)).
:- local domain(boisson(the, cafe, judorange, lait, eau)).
:- local domain(voiture(bmw, toyota, datsu, honda, ford)).
:- local domain(animal(renard, chien, zebre, cheval, serpent)).

% question 2.2

domaines_maisons(m(Pays,Couleur,Boisson,Voiture,Animal, Numero)):-
    Pays &:: pays,
    Couleur &:: couleur,
    Boisson &:: boisson,
    Voiture &:: voiture,
    Animal &:: animal,
    Numero #:: 1..5.

% question 2.3

/*rueAux([], 0).

rueAux([Head|Tail], Num):-
    domaines_maisons(Head, Num),
    Nume is Num - 1,
    rueAux(Tail, Nume).

rue(Rue):-
    rueAux(Rue, 5).*/

rue([M1, M2, M3, M4, M5]):-
    M1 = m(P1, C1, B1, V1, A1, 1),
    M2 = m(P2, C2, B2, V2, A2, 2),
    M3 = m(P3, C3, B3, V3, A3, 3),
    M4 = m(P4, C4, B4, V4, A4, 4),
    M5 = m(P5, C5, B5, V5, A5, 5),
    domaines_maisons(M1),
    domaines_maisons(M2),
    domaines_maisons(M3),
    domaines_maisons(M4),
    domaines_maisons(M5),
    ic_symbolic:alldifferent([P1, P2, P3, P4, P5]),
    ic_symbolic:alldifferent([C1, C2, C3, C4, C5]),
    ic_symbolic:alldifferent([B1, B2, B3, B4, B5]),
    ic_symbolic:alldifferent([V1, V2, V3, V4, V5]),
    ic_symbolic:alldifferent([A1, A2, A3, A4, A5]).

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

   (foreach(m(Pays, Couleur, Boisson, Voiture, Animal, Numero), X), param(X) do
        ((Pays &= anglais) #= (Couleur &= rouge)) and
        ((Pays &= espagnol) #= (Animal &= chien)) and
        ((Couleur &= vert) #= (Boisson &= cafe)) and
        ((Pays &= ukrainiens) #= (Boisson &= the)) and
        ((Voiture &= bmw) #= (Animal &= serpent)) and
        ((Couleur &= jaune) #= (Voiture &= toyota)) and
        ((Boisson &= lait) #= (Numero #= 3)) and
        ((Pays &= norvegien) #= (Numero #= 1)) and
        ((Voiture &= honda) #= (Boisson &= judorange)) and
        ((Pays &= japonais) #= (Voiture &= datsu)),
        %(n)
        (foreach(m(_, Couleur2, _, _, Animal2, Numero2), X), param(Couleur, Numero, Voiture, Pays) do
           ((Couleur &= vert) and (Couleur2 &= blanche)) => (Numero #= (Numero2 +1)),
           ((Voiture &= ford) and (Animal2 &= renard)) => ((Numero #= (Numero2 + 1)) or (Numero #= (Numero2 - 1))),
           ((Voiture &= toyota) and (Animal2 &= cheval)) => ((Numero #= (Numero2 + 1)) or (Numero #= (Numero2 - 1))),
           ((Pays &= norvegien) and (Couleur2 &= bleu)) => ((Numero #= (Numero2 + 1)) or (Numero #= (Numero2 - 1)))
        )
    ),

    getVarList(X, Res),
    labeling_symbolic(Res).


% 