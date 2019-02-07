:- lib(ic).

% =========================
% Question 1.1 à 1.2
% =========================

couleur(vert).
couleur(rouge).
couleur(gris).
couleur(blanc).
couleur(vert(clair)).

choixCouleur(Bateau, Voiture):-
    couleur(Bateau),
    couleur(Voiture),
    Bateau = Voiture.

/* Test
choixCouleur(rouge, X).
X = rouge
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

---------------------------------------------

choixCouleur(X, blanc).X = blanc
Yes (0.00s cpu, solution 1, maybe more) ? ;

No (0.00s cpu)

---------------------------------------------

choixCouleur(X, Y).

X = vert
Y = vert
Yes (0.00s cpu, solution 1, maybe more) ? ;

X = rouge
Y = rouge
Yes (0.00s cpu, solution 2, maybe more) ? ;

X = gris
Y = gris
Yes (0.00s cpu, solution 3, maybe more) ? ;

X = blanc
Y = blanc
Yes (0.00s cpu, solution 4, maybe more) ? ;

X = vert(clair)
Y = vert(clair)
Yes (0.00s cpu, solution 5)

---------------------------------------------

choixCouleur(rouge, blanc).
No (0.00s cpu)

*/

% question 1.2 :
/** Prolog utilise une génération d'arbre pour résoudre ces problèmes
* à contraintes, donc il est particulièrement adapté pour résoudre des
*  contraintes sur le domaine des arbres.
*/

% =========================
% Question 1.3 à 1.6
% =========================

isBetween(Min, Min, Max).

isBetween(Var, Min, Max):-
    Min < Max,
    Z is Min+1,
    isBetween(Var, Z, Max).

command(NbResi, NbCondo):-
    isBetween(NbCondo, 9000, 20000),
    isBetween(NbResi, 5000, 10000),
    NbResi >= NbCondo.

% Test
/**
  command(NbResi, NbCondo).
  
  NbResi = 9000
NbCondo = 9000
Yes (0.00s cpu, solution 1, maybe more) ? ;

NbResi = 9001
NbCondo = 9000
Yes (0.00s cpu, solution 2, maybe more) ? ;

NbResi = 9002
NbCondo = 9000
Yes (0.00s cpu, solution 3, maybe more) ? ;

NbResi = 9003
NbCondo = 9000
Yes (0.00s cpu, solution 4, maybe more) ? ;

---

*/

% question 1.5

% question 1.6
/** Pour une opération basique, il ne comprends pas la logique mathématique
* qu'il y a derrière, mais est capable d'enchainer les calculs et de tester
* si le resultat est cohérent. Au lieu de résoudre les maths, il bruteforce
* (d'où le generate and test).
*/

% =========================
% Question 1.7 à 1.8
% =========================

command2(NbResi, NbCondo):-
    NbResi #:: 5000..10000,
    NbCondo #:: 9000..20000,
    NbResi #>= NbCondo,
    labeling([NbResi, NbCondo]).

% Test

/**
  command2(NbResi, NbCondo).
 
NbResi = 9000
NbCondo = 9000
Yes (0.00s cpu, solution 1, maybe more) ? ;

NbResi = 9001
NbCondo = 9000
Yes (0.00s cpu, solution 2, maybe more) ? ;

NbResi = 9001
NbCondo = 9001
Yes (0.01s cpu, solution 3, maybe more) ? ;

NbResi = 9002
NbCondo = 9000
Yes (0.01s cpu, solution 4, maybe more) ? ;

NbResi = 9002
NbCondo = 9001
Yes (0.01s cpu, solution 5, maybe more) ? ;

NbResi = 9002
NbCondo = 9002
Yes (0.01s cpu, solution 6, maybe more) ? ;

NbResi = 9003
NbCondo = 9000
Yes (0.01s cpu, solution 7, maybe more) ? ;

NbResi = 9003
NbCondo = 9001
Yes (0.01s cpu, solution 8, maybe more) ? ;

NbResi = 9003
NbCondo = 9002
Yes (0.01s cpu, solution 9, maybe more) ? ;

NbResi = 9003
NbCondo = 9003
Yes (0.01s cpu, solution 10, maybe more) ? ;

---
 
 */

% question 1.8

% =========================
% Question 1.9 à 1.10
% =========================

chapie(Chats, Pies, Pattes, Tetes):-
    Pies #:: 0..10,
    Chats is 2,
    Tetes is 5,

    labeling([Pies]),
    
    PatChat is 4 * Chats,
    PatPie is 2 * Pies,
    Pattes is PatChat + PatPie,
    Tetes is Chats + Pies.

  % Test

  /*
    chapie(Chats, Pies, Pattes, Tetes).

    Chats = 2
    Pies = 3
    Pattes = 14
    Tetes = 5
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    No (0.00s cpu)
  */

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

  % Test

  /*
    chapieLeRetour(Chats, Pies, Pattes, Tetes).

    Chats = 1
    Pies = 1
    Pattes = 6
    Tetes = 2
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    Chats = 2
    Pies = 2
    Pattes = 12
    Tetes = 4
    Yes (0.00s cpu, solution 2, maybe more) ? ;

    Chats = 3
    Pies = 3
    Pattes = 18
    Tetes = 6
    Yes (0.00s cpu, solution 3, maybe more) ? ;

    Chats = 4
    Pies = 4
    Pattes = 24
    Tetes = 8
    Yes (0.00s cpu, solution 4, maybe more) ? ;

    Chats = 5
    Pies = 5
    Pattes = 30
    Tetes = 10
    Yes (0.01s cpu, solution 5, maybe more) ? ;

    Chats = 6
    Pies = 6
    Pattes = 36
    Tetes = 12
    Yes (0.01s cpu, solution 6, maybe more) ? ;

    Chats = 7
    Pies = 7
    Pattes = 42
    Tetes = 14
    Yes (0.01s cpu, solution 7, maybe more) ? 

    ---
  */

% =========================
% Question 1.11
% =========================

vabs(Val, AbsVal):-
    Val #:: -100..0,
    labeling([Val]),
    ValAbs is 0 - Val, 
    AbsVal = ValAbs.
    
vabs(Val, AbsVal):-
    Val #:: 0..100,
    labeling([Val]),
    AbsVal = Val.

  % Test

  /*
    Mode vabs(+,+):

    vabs(-5, 5).
    Yes (0.00s cpu, solution 1, maybe more) ? ;
    No (0.00s cpu)
    --------------------------------------------------
    vabs(3, 3).
    Yes (0.00s cpu)
    --------------------------------------------------
    vabs(3, -3).
    No (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------

    Mode vabs(+,-):

    vabs(3, Y).
    Y = 3
    Yes (0.00s cpu)
    --------------------------------------------------
    vabs(-5, Y).
    Y = 5

    Yes (0.00s cpu, solution 1, maybe more) ? ;
    No (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------

    Mode vabs(-,+):

    vabs(X, 5).

    X = -5
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    X = 5
    Yes (0.00s cpu, solution 2, maybe more) ? ;

    No (0.00s cpu)

  */


% =========================
% Question 1.12
% =========================

valabs(Val, AbsVal):-
    AbsVal #> 0,
    AbsVal #= -Val or AbsVal #= Val, 
    labeling([Val, AbsVal]).

  % Test

  /*
    Mode valabs(+,+):

    valabs(5, 5).
    Yes (0.00s cpu)
    --------------------------------------------------
    valabs(-5, 5).
    Yes (0.00s cpu)
    --------------------------------------------------
    valabs(-5, 3).
    No (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------

    Mode valabs(+,-):

    valabs(3, Y).
    Y = 3
    Yes (0.00s cpu)
    --------------------------------------------------
    valabs(-5, Y).
    Y = 5
    Yes (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------

    Mode valabs(-,+):

    X #:: -10..10, valabs(X, 7).

    X = -7
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    X = 7
    Yes (0.00s cpu, solution 2, maybe more) ? ;

    No (0.00s cpu)


  */

% =========================
% Question 1.13
% =========================

%faitListe(?ListVar, ?Taille, +Min, +max)

faitListe([], 0, _ , _).

faitListe([Head|Tail], Taille, Min, Max):-
    Head #:: Min..Max,
    Taille #> 0,

    labeling([Taille]),
    labeling([Head]),

    Z is Taille - 1,
    faitListe(Tail, Z, Min, Max).

  % Test

  /*
    Mode faitListe(+,+,+,+):

    faitListe([1,2,3],3,0,5).
    Yes (0.00s cpu)
    --------------------------------------------------
    faitListe([1,2,6],3,0,5).
    No (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------

    Mode faitListe(+,-,+,+):

    faitListe([1,2,3],Y,0,5).

    Y = 3
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    --------------------------------------------------
    --------------------------------------------------

    Mode faitListe(-,+,+,+):

    Liste = [0, 0]
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    Liste = [0, 1]
    Yes (0.00s cpu, solution 2, maybe more) ? ;

    Liste = [1, 0]
    Yes (0.00s cpu, solution 3, maybe more) ? ;

    Liste = [1, 1]
    Yes (0.00s cpu, solution 4, maybe more) ? ;

    No (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------

    Mode faitListe(-,-,+,+):

    Liste = []
    Y = 0
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    Liste = [0]
    Y = 1
    Yes (0.00s cpu, solution 2, maybe more) ? ;

    Liste = [1]
    Y = 1
    Yes (0.00s cpu, solution 3, maybe more) ? ;

    Liste = [0, 0]
    Y = 2
    Yes (0.00s cpu, solution 4, maybe more) ? ;

    Liste = [0, 1]
    Y = 2
    Yes (0.00s cpu, solution 5, maybe more) ? ;

    Liste = [1, 0]
    Y = 2
    Yes (0.00s cpu, solution 6, maybe more) ? ;

    Liste = [1, 1]
    Y = 2
    Yes (0.01s cpu, solution 7, maybe more) ? ;

    Liste = [0, 0, 0]
    Y = 3
    Yes (0.01s cpu, solution 8, maybe more) ? ;

    Liste = [0, 0, 1]
    Y = 3
    Yes (0.01s cpu, solution 9, maybe more) ? ;

  */

% =========================
% Question 1.14
% =========================

%suite(?ListeVar)

suite([]).

suite([Head|[]]):-
    Head #:: 0..2,
    labeling([Head]).

suite([E1,E2|[]]):-
    E1 #:: 0..2,
    E2 #:: 0..2,
    labeling([E1]),
    labeling([E2]).

suite([E1, E2, E3|Tail]):-
    suite([E2, E3|Tail]),
    valabs(E2, Z),
    E1 is Z - E3.

  % Test
  
  /*

    Mode suite(+):

    suite([0,-1,1,2]).

    Yes (0.00s cpu, solution 1, maybe more) ? ;

    No (0.00s cpu)

    --------------------------------------------------

    suite([3,1,1,2]).
    No (0.00s cpu)

    --------------------------------------------------
    --------------------------------------------------


    Mode suite(-):

    [eclipse 30]: suite(Liste).

    Liste = []
    Yes (0.00s cpu, solution 1, maybe more) ? ;

    Liste = [0]
    Yes (0.00s cpu, solution 2, maybe more) ? ;

    Liste = [1]
    Yes (0.00s cpu, solution 3, maybe more) ? ;

    Liste = [2]
    Yes (0.00s cpu, solution 4, maybe more) ? ;

    Liste = [0, 0]
    Yes (0.00s cpu, solution 5, maybe more) ? ;

    Liste = [0, 1]
    Yes (0.00s cpu, solution 6, maybe more) ? ;

    Liste = [0, 2]
    Yes (0.00s cpu, solution 7, maybe more) ? ;

    Liste = [1, 0]
    Yes (0.00s cpu, solution 8, maybe more) ? ;

    Liste = [1, 1]
    Yes (0.00s cpu, solution 9, maybe more) ? ;

    Liste = [1, 2]
    Yes (0.00s cpu, solution 10, maybe more) ? ;

    Liste = [2, 0]
    Yes (0.00s cpu, solution 11, maybe more) ? ;

    Liste = [2, 1]
    Yes (0.00s cpu, solution 12, maybe more) ? ;

    Liste = [2, 2]
    Yes (0.00s cpu, solution 13, maybe more) ? ;

    Liste = [1, 1, 0]
    Yes (0.00s cpu, solution 14, maybe more) ? ;

    Liste = [0, 1, 1]
    Yes (0.00s cpu, solution 15, maybe more) ? ;

    Liste = [-1, 1, 2]
    Yes (0.00s cpu, solution 16, maybe more) ? ;

  */
