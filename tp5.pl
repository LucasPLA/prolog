:-lib(ic).
:-lib(ic_symbolic).
:-lib(branch_and_bound).

getVecteur(X):-
    X = [](
            [](
                5,7,2,6,9,3,7,5,3
            ),
            [](
                140,130,60,95,70,85,100,30,45
            ),
            [](
                4,5,8,5,6,4,7,10,11
            ),
            Y
        ),
    dim(Y, [9]),
    Y #:: 0..1.

getOuvrierNecessaire(Donnees,Result):-
    Donnees = [](Technicien, _Quantite, _Benefice, Fabriquer),
    (for(I, 1, 9), param(Technicien, Fabriquer),
        fromto(0, In, Out, Result) do 
            FabriquerI #= Fabriquer[I],
            TechI is Technicien[I],
            Out #= In + FabriquerI*TechI
    ).

getQuantite(Donnees,Result):-
    Donnees = [](_Technicien, Quantite, _Benefice, Fabriquer),
    (for(I, 1, 9), param(Quantite, Fabriquer),
        fromto(0, In, Out, Result) do 
            FabriquerI #= Fabriquer[I],
            QuantiteI is Quantite[I],
            Out #= In + FabriquerI*QuantiteI
    ).

getBenefice(Donnees,Result):-
    Donnees = [](_Technicien, _Quantite, Benefice, Fabriquer),
    (for(I, 1, 9), param(Benefice, Fabriquer),
        fromto(0, In, Out, Result) do 
            FabriquerI #= Fabriquer[I],
            BeneficeI is Benefice[I],
            Out #= In + FabriquerI*BeneficeI
).

getProfit(Donnees, Result):-
    Donnees = [](_Technicien, Quantite, Benefice, Fabriquer),
    (for(I, 1, 9), param(Quantite, Benefice, Fabriquer),
        fromto(0, In, Out, Result) do 
            FabriquerI #= Fabriquer[I],
            QuantiteI is Quantite[I],
            BeneficeI is Benefice[I],
            Out #= In + FabriquerI*QuantiteI*BeneficeI
    ).

pose_contraintes(Fabriquer, NbTechniciensTotal, Profit):-
    getVecteur(Donnees),
    Donnees = [](_Technicien, _Quantite, _Benefice, Fabriquer),

    getOuvrierNecessaire(Donnees, NbTechniciensTotal),
    NbTechniciensTotal #< 22,
    getProfit(Donnees, Profit),
    labeling(Fabriquer).
