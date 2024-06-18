% Explication de heuristique0 dans le README

heuristique0(Grille,Colonne_solution) :- 
    random_int_1n(7,Colonne_tmp),
    X is Colonne_tmp-1,                    
    hauteur_colonne(Grille, X, Compteur),
    (   
        Compteur >= 6 -> heuristique0(Grille, Colonne_solution)
        ;   
        Colonne_solution is Colonne_tmp, !
    ).

