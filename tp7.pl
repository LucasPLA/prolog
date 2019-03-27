:-lib(ic).
:-lib(ic_symbolic).

:- local domain(femme, homme).



affirme(Affirmation, Sexe):-
    (Sexe #= femme).

