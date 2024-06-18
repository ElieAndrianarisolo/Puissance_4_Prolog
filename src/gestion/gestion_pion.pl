% Déterminer la position du dernier pion de la colonne n°X

hauteur_colonne(Grille, X, Compteur) :- 
    nth0(X, Grille, Colonne),
    aggregate_all(count, (member(Element, Colonne), dif(Element, e)), Compteur).


% Insérer un pion dans la grille de jeu.
% Pion est égale soit à o (rouge), soit à x (jaune).

remplacer_element(Liste, Index, Nouvel_element, Nouvelle_liste) :-      % Remplacer l'élément à une position spécifique dans une liste
    nth0(Index, Liste, _, Reste),
    nth0(Index, Nouvelle_liste, Nouvel_element, Reste).

inserer_pion(Grille, Colonne_choisie, X, Y, Pion, Nouvelle_grille) :- 
    integer(Colonne_choisie), Colonne_choisie >= 1, Colonne_choisie < 8,  
    X is Colonne_choisie-1,                    
    hauteur_colonne(Grille, X, Compteur), 
    Y is Compteur,
    integer(Y), Y >= 0, Y < 6,                      
    nth0(X, Grille, Colonne),
    remplacer_element(Grille, X, Nouvelle_colonne, Nouvelle_grille),
    remplacer_element(Colonne, Y, Pion, Nouvelle_colonne).


% Retirer un pion de la grille de jeu à la colonne n°X

retirer_pion(Grille, Colonne_choisie, Nouvelle_grille) :- 
    integer(Colonne_choisie), Colonne_choisie >= 0, Colonne_choisie < 7,  
    X is Colonne_choisie-1,                    
    hauteur_colonne(Grille, X, Compteur), 
    Y is Compteur-1,
    integer(Y), Y >= 0, Y < 6,                      
    nth0(X, Grille, Colonne),
    remplacer_element(Grille, X, Nouvelle_colonne, Nouvelle_grille),
    remplacer_element(Colonne, Y, e, Nouvelle_colonne).


% Vérifier si une case a un pion, i.e, qu'une case n'est pas vide

est_pion(Grille, X, Y, Pion) :-
    nth0(X, Grille, Colonne),
    nth0(Y, Colonne, Case),
    (
        Case == e -> false
        ; 
        Case == Pion -> true
        ;
        false
    ).