:-lib(ic).
:-lib(ic_symbolic).
:-lib(branch_and_bound).

getVecteur(Place, Poids):-
    Poids = [](24,39,85,60,165,6,32,123,7,14),
    dim(Place, [10]),
    Place #:: [-8..(-1), 1..8],
    ic:alldifferent(Place).

getMoment(Place, Poids, Moment):-
    (for(I,1,10), param(Place,Poids),
        fromto(0, In, Out, Moment) do
            PlaceI #= Place[I],
            PoidsI #= Poids[I],
            Out #= In + PlaceI*PoidsI
    ).

maxx(Element, Tableau):-
    (foreachelem(Pers, Tableau), param(Element) do
        Element #>= Pers
    ).

minn(Element, Tableau):-
    (foreachelem(Pers, Tableau), param(Element) do
        Element #=< Pers
    ).

countPositif(Tableau, Nb):-
    (foreachelem(Element, Tableau), 
        fromto(0, In, Out, Nb) do
            (Element #> 0) => (Out #= In + 1),
            (Element #< 0) => (Out #= In - 1)
    ).

poseContraintes(Place):-
    getVecteur(Place,Poids),

    getMoment(Place, Poids, Moment),
    Moment #= 0,

    Place4 is Place[4],
    Place8 is Place[8],
    minn(Place4, Place),
    maxx(Place8, Place),

    Place6 is Place[6],
    Place9 is Place[9],
    ((Place6 #= (Place4 + 1)) and (Place9 #= (Place8 - 1))) or ((Place9 #= (Place4 + 1)) and (Place6 #= (Place8 - 1))),

    Nb #= 0,
    countPositif(Place, Nb),

    
    labeling(Place).

