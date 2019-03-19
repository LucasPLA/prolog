:-lib(ic).
:-lib(ic_symbolic).

getVecteur(Place, Poids):-
    Poids = [](24,39,85,60,165,6,32,123,7,14),
    dim(Place, [10]),
    Place #:: -8..8, %TODO MARTIN
    ic:alldifferent(Place).

getMoment(Place, Poids, Moment):-
    (for(I,1,10), param(Place,Poids),
        fromto(0, In, Out, Moment) do
            PlaceI #= Place[I],
            PoidsI #= Poids[I],
            Out #= In + PlaceI*PoidsI
    ).

poseContraintes(Place):-
    getVecteur(Place,Poids),
    getMoment(Place, Poids, Moment),
    Moment #= 0,
    labeling(Place).
