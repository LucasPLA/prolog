:- lib(ic).

couleur(vert).
couleur(rouge).
couleur(gris).
couleur(blanc).
couleur(vert(clair)).

choixCouleur(Bateau, Voiture):-
    couleur(Bateau),
    couleur(Voiture),
    Bateau = Voiture.

/* questions :
 - choixCouleur(rouge, X).
 - choixCouleur(X, blanc).
 - choixCouleur(X, Y).
 - choixCouleur(rouge, blanc).
*/

/* exercice 2

isBetween(Min, Min, Max).

isBetween(Var, Min, Max):-
    Min < Max,
    Z is Min+1,
    isBetween(Var, Z, Max).

command(NbResi, NbCondo):-
    isBetween(NbCondo, 90, 200),
    isBetween(NbResi, 50, 100),
    NbResi >= NbCondo.
*/

command(NbResi, NbCondo):-
    NbResi #:: 50..100,
    NbCondo #:: 90..200,
    NbResi #>= NbCondo,
    labeling([NbResi, NbCondo]).

chapie(Chats, Pies, Pattes, Tetes):-
    Pies #:: 0..10,
    Chats is 2,
    Tetes is 5,

    labeling([Pies]),
    
    PatChat is 4 * Chats,
    PatPie is 2 * Pies,
    Pattes is PatChat + PatPie,
    Tetes is Chats + Pies.

chapieLeRetour(Chats, Pies, Pattes, Tetes):-
    Pies #:: 1..20,
    Chats #:: 1..20,
    Pattes #= 3 * Tetes,
    
    labeling([Pies, Chats]),
    
    Tetes is Chats + Pies,
    labeling([Tetes]),

    PatPie is 2 * Pies,
    PatChat is 4 * Chats,
    Pattes is PatChat + PatPie.

vabs(Val, AbsVal):-
    Val #:: -100..0,
    labeling([Val]),
    ValAbs is 0 - Val, 
    AbsVal = ValAbs.
    
vabs(Val, AbsVal):-
    Val #:: 0..100,
    labeling([Val]),
    AbsVal = Val.

valabs(Val, AbsVal):-
    AbsVal #> 0,
    AbsVal #= -Val or AbsVal #= Val, 
    labeling([Val, AbsVal]).
    
faitListe([], _, _, _).

faitListe([Head:Tail], Taille, Min, Max):-
    Head > Min,
    Head < Max,
    Taille > 0,
    faitList(Tail, Taille - 1, Min, Max).

faitListe(ListVar, Taille, Min, Max):-


/*[eclipse 88]: V #:: -10..10, valabs(V, 5).*/


