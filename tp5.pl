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
    NbTechniciensTotal #< 23,
    getProfit(Donnees, Profit),
    labeling(Fabriquer).

solve(Fabriquer, NbTechniciensTotal, Profit):-
    Kermit #= 3000 - Profit,
    minimize(pose_contraintes(Fabriquer, NbTechniciensTotal, Profit), Kermit).

solveCapitaliste(Fabriquer, NbTechniciensTotal, Profit):-
    Profit #> 1000,
    minimize(pose_contraintes(Fabriquer,NbTechniciensTotal, Profit), NbTechniciensTotal).

%minimize(but, variable_cout)

/*exemple(X,Y,Z,W):-
    [X,Y,Z,W] #:: [0..10],
    X #= Z+Y+2*W,
    X #\= Z+Y+W.

solvant(X,Y,Z,W):-
    minimize((exemple(X,Y,Z,W), labeling([X,Y,Z,W])), X).


    Labeling sur X uniquement:
    solvant(X,Y,Z,W).
    Found a solution with cost 1
    Found no solution with cost -1.0Inf .. 0

    X = 1
    Y = Y{[0, 1]}
    Z = Z{[0, 1]}
    W = 0
    Yes (0.00s cpu)


    Labeling sur X,Y,Z,W:
    solvant(X,Y,Z,W).
    Found a solution with cost 2
    Found no solution with cost -1.0Inf .. 1

    X = 2
    Y = 0
    Z = 0
    W = 1
    Yes (0.00s cpu)



    solve(X,Y,Z).
    Found a solution with cost 3000
    Found a solution with cost 2505
    Found a solution with cost 2205
    Found a solution with cost 1805
    Found a solution with cost 1505
    Found a solution with cost 1465
    Found a solution with cost 1165
    Found a solution with cost 1045
    Found a solution with cost 1030
    Found a solution with cost 990
    Found a solution with cost 985
    Found a solution with cost 685
    Found a solution with cost 510
    Found a solution with cost 335
    Found no solution with cost -1.0Inf .. 334

    X = [](0, 1, 1, 0, 0, 1, 1, 0, 1)
    Y = 22
    Z = 2665
    Yes (0.00s cpu)

*/

