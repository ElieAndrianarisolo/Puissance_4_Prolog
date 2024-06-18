%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ALGORITHME DU MINIMAX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- consult(aleatoire).
:- consult(coups_possibles).
:- consult('../gestion/gestion_pion').
:- consult('../heuristiques/heuristique0').
:- consult('../heuristiques/heuristique1').
:- consult('../heuristiques/heuristique2').
:- consult('../heuristiques/heuristique3').
:- consult('../heuristiques/heuristique4').
:- consult('../heuristiques/heuristique5').

% Détermine le joueur qui maximise et le joueur qui minimise

minimise(Marque,Pion_adversaire_ia):- Pion_adversaire_ia == Marque.

maximise(Marque,Pion_adversaire_ia):- Pion_adversaire_ia \= Marque.


% Cas particulier lorsque l'heuristique est h0

minimax(_, Grille, _, Colonne_solution, _, Heuristique, _) :-
    Heuristique == h0,
    heuristique0(Grille, Colonne_solution),
    !.


% Si la grille vide, occupe la case du milieu de la première ligne

minimax(_,[[e,e,e,e,e,e],[e,e,e,e,e,e],[e,e,e,e,e,e],[e,e,e,e,e,e],[e,e,e,e,e,e],[e,e,e,e,e,e],[e,e,e,e,e,e]],_,Colonne_solution,_,_,_) :-
    random_int_1n(7,Colonne_solution)
    .


% Si la profondeur est nulle :
%       - diminue la profondeur de un
%       - établit la lise des coups possibles
%       - si la liste n''est pas vide recherche le meillleur coup

minimax(Profondeur, _, _, _, Score, _, _) :-
    Profondeur =< 0,
    Score = 0,
    !.

minimax(Profondeur, Grille, Marque, Colonne_solution, Score, Heuristique, Pion_adversaire_ia) :-
    Profondeur > 0,
    Nouvelle_profondeur is Profondeur-1,
    coups_possibles(Grille, Colonnes_jouables),
    !,
    rechercher_meilleur_coup(Nouvelle_profondeur, Grille, Marque, Colonnes_jouables,  Colonne_solution,  Score, Heuristique, Pion_adversaire_ia),
    !.


% Si la liste ds coups possibles est vide, les cas suivants donne un score en fonction de l''état de la grille
%       -   Cas dans lequel l'adversaire de l'ia est o
%       -   Cas dans lequel l'adversaire de l'ia est x

minimax(Profondeur, Grille, _, _, Score, _ ,Pion_adversaire_ia):-
    Pion_adversaire_ia==o,
    gagne(Grille,x),
    Score is 1000 + Profondeur,
    !.

minimax(Profondeur, Grille, _, _, Score, _,Pion_adversaire_ia) :-
    Pion_adversaire_ia==o,
    gagne(Grille,o),
    Score is -1000-Profondeur,
    !.

minimax(Profondeur, Grille, _, _, Score, _ ,Pion_adversaire_ia):-
    Pion_adversaire_ia==x,
    gagne(Grille,x),
    Score is -1000-Profondeur,
    !.

minimax(Profondeur, Grille, _, _, Score, _,Pion_adversaire_ia) :-
    Pion_adversaire_ia==x,
    gagne(Grille,o),
    Score is 1000+Profondeur,
    !.


% Si il n'y a pas de vainqueur fait intervenir l'heuristique choisie sur le tableau

minimax(Profondeur, Grille, _, _, Score, Heuristique, Pion_adversaire_ia) :-                        % Heuristique h1
    Pion_adversaire_ia==x,                                                                          % L'adversaire de l'ia est x
    Heuristique == h1,
    heuristique1(Grille,Score_tmp),
    Score is (-6*Score_tmp-Profondeur),                                                             % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, _) :-                                         % Heuristique h1
    Heuristique == h1,                                                                              % L'adversaire de l'ia est o
    heuristique1(Grille,Score_tmp),
    Score is 6*Score_tmp+Profondeur,                                                                % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, Pion_adversaire_ia) :-                        % Heuristique h2
    Pion_adversaire_ia==x,                                                                          % L'adversaire de l'ia est x
    Heuristique == h2,
    heuristique2(Grille,Score_tmp),
    Score is (-6*Score_tmp-Profondeur),                                                             % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, _) :-                                         % Heuristique h2
    Heuristique == h2,                                                                              % L'adversaire de l'ia est o
    heuristique2(Grille,Score_tmp),
    Score is 6*Score_tmp+Profondeur,                                                                % Influence de la profondeur sur le résultat
    !.
    
minimax(Profondeur, Grille, _, _, Score, Heuristique, Pion_adversaire_ia) :-                        % Heuristique h3
    Pion_adversaire_ia==x,                                                                          % L'adversaire de l'ia est x
    Heuristique == h3,
    heuristique3(Grille,Score_tmp),
    Score is (-6*Score_tmp-Profondeur),                                                             % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, _) :-                                         % Heuristique h3
    Heuristique == h3,                                                                              % L'adversaire de l'ia est o
    heuristique3(Grille,Score_tmp),
    Score is 6*Score_tmp+Profondeur,                                                                % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, Pion_adversaire_ia) :-                        % Heuristique h4
    Pion_adversaire_ia==x,                                                                          % L'adversaire de l'ia est x
    Heuristique == h4,
    heuristique4(Grille,Score_tmp),
    Score is (-6*Score_tmp-Profondeur),                                                             % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, _) :-                                         % Heuristique h4
    Heuristique == h4,                                                                              % L'adversaire de l'ia est o
    heuristique4(Grille,Score_tmp),
    Score is 6*Score_tmp+Profondeur,                                                                % Influence de la profondeur sur le résultat
    !.
    
minimax(Profondeur, Grille, _, _, Score, Heuristique, Pion_adversaire_ia) :-                        % Heuristique h5
    Pion_adversaire_ia==x,                                                                          % L'adversaire de l'ia est x
    Heuristique == h5,
    heuristique5(Grille,Score_tmp),
    Score is (-6*Score_tmp-Profondeur),                                                             % Influence de la profondeur sur le résultat
    !.

minimax(Profondeur, Grille, _, _, Score, Heuristique, _) :-                                         % Heuristique h5
    Heuristique == h5,                                                                              % L'adversaire de l'ia est o
    heuristique5(Grille,Score_tmp),
    Score is 6*Score_tmp+Profondeur,                                                                % Influence de la profondeur sur le résultat
    !.


% Rechercher le meilleur coup de manière récursive, soit le parcours en profondeur d'un arbre

rechercher_meilleur_coup(Profondeur, Grille, Marque, [Coup_1],  Colonne_solution,  Score, Heuristique, Pion_adversaire_ia) :-   % La liste est composée d'un seul coup
    Marque== 'o',                                                                                                               % Le joueur est o
    inserer_pion(Grille, Coup_1, _, _, Marque, Nouvelle_grille),                                                                % Simulation du coup
    !,
    minimax(Profondeur, Nouvelle_grille, x, _Colonne_solution,  Score_1, Heuristique, Pion_adversaire_ia),                      % Recherche récursive sur la grille simulée en passant au joueur x, le coup est unique seule la recherche du score importe
    Colonne_solution = Coup_1,                                                                                                  % Renvoie le coup et sa valeur
    Score = Score_1,
    !.

rechercher_meilleur_coup(Profondeur, Grille, Marque, [Coup_1],  Colonne_solution,  Score, Heuristique, Pion_adversaire_ia) :-   % La liste est composée d'un seul coup
    Marque== 'x',                                                                                                               % Le joueur est x
    inserer_pion(Grille, Coup_1, _, _, Marque, Nouvelle_grille),
    !,
    minimax(Profondeur, Nouvelle_grille, o, _Colonne_solution,  Score_1, Heuristique, Pion_adversaire_ia),                      % Recherche récursive sur la grille simulée en passant au joueur o, le coup est unique seule la recherche du score importe
    Colonne_solution = Coup_1,                                                                                                  % Renvoie le coup et sa valeur
    Score = Score_1,
    !.

rechercher_meilleur_coup(Profondeur, Grille, Marque, [Coup_1|Coups_restants],  Colonne_solution,  Score, Heuristique, Pion_adversaire_ia) :-    % La liste est composée de plusieurs coups
    Marque== 'o',                                                                                                                               % Le joueur est o
    inserer_pion(Grille, Coup_1, _, _, Marque, Nouvelle_grille),                                                                                % Simulation du coup
    !,   
    minimax(Profondeur, Nouvelle_grille, x, _Colonne_solution,  Score_1, Heuristique, Pion_adversaire_ia),                                      % Recherche récursive sur la grille simulée en passant au joueur x, le coup est unique seule la recherche du score importe
    rechercher_meilleur_coup(Profondeur, Grille, Marque, Coups_restants, Coup_2, Score_2, Heuristique, Pion_adversaire_ia),                     % Recherche récursive sur les coups restants pour déterminer le score d'un deuxième coup
    comparer_meilleur_coup(Profondeur, Marque, Coup_1, Score_1, Coup_2, Score_2, Colonne_solution,  Score,Pion_adversaire_ia),                  % Détermination du coup optimal à jouer
    !.

rechercher_meilleur_coup(Profondeur, Grille, Marque, [Coup_1|Coups_restants],  Colonne_solution,  Score, Heuristique, Pion_adversaire_ia) :-    % La liste est composée de plusieurs coups
    Marque== 'x',                                                                                                                               % Le joueur est o
    inserer_pion(Grille, Coup_1, _, _, Marque, Nouvelle_grille),                                                                                % Simulation du coup
    !,
    minimax(Profondeur, Nouvelle_grille, o, _Colonne_solution,  Score_1, Heuristique, Pion_adversaire_ia),                                      % Recherche récursive sur la grille simulée en passant au joueur x, le coup est unique seule la recherche du score importe
    rechercher_meilleur_coup(Profondeur, Grille, Marque, Coups_restants, Coup_2, Score_2, Heuristique, Pion_adversaire_ia),                     % Recherche récursive sur les coups restants pour déterminer le score d'un deuxième coup
    comparer_meilleur_coup(Profondeur, Marque, Coup_1, Score_1, Coup_2, Score_2, Colonne_solution,  Score,Pion_adversaire_ia),                  % Détermination du coup optimal à jouer
    !.


% Retourne le meilleur coup possible entre deux coups
% Applique un comportement différent selon le maximisant et le minimisant

comparer_meilleur_coup(_,Marque,Coup_1,Score_1,_,Score_2,Colonne_solution,Score,Pion_adversaire_ia) :-                  % Tour de l'ia
    maximise(Marque,Pion_adversaire_ia),
    Score_1 > Score_2,                                                                                                  % Garde le maximum soit le premier score                                                                            
    Colonne_solution = Coup_1,                                                                                          % Renvoie le premier coup et sa valeur                                                                                  
    Score = Score_1,
    !
    .

comparer_meilleur_coup(_,Marque,Coup_1,Score_1,_,Score_2,Colonne_solution,Score,Pion_adversaire_ia) :-                  % Tour de l'adversaire de l'ia
    minimise(Marque,Pion_adversaire_ia),
    Score_1 < Score_2,                                                                                                  % Garde le minimum soit le premier score 
    Colonne_solution = Coup_1,                                                                                          % Renvoie le premier coup et sa valeur  
    Score = Score_1, 
    !
    .

comparer_meilleur_coup(Profondeur,Marque,Coup_1,Score_1,Coup_2,Score_2,Colonne_solution,Score,_) :-                     % Cas dans lequel les scores sont égaux
    Score_1 == Score_2,
    random_int_1n(10,R),
    comparer_meilleur_coup2(Profondeur,R,Marque,Coup_1,Score_1,Coup_2,Score_2,Colonne_solution,Score),                  % Choisit un coup au hasard
    !
    .

comparer_meilleur_coup(_,_,_,_,Coup_2,Score_2,Colonne_solution,Score,_) :-                                              % Si aucun des cas précédents
    Colonne_solution= Coup_2,                                                                                           % Renvoie le deuxième coup et sa valeur 
    Score = Score_2,
    !
    .


% Détermine un coup au hasard selon une probabilité de 0,5

comparer_meilleur_coup2(_,R,_,Coup_1,Score_1,_,_,Colonne_solution,Score) :-
    R < 6,
    Colonne_solution= Coup_1,
    Score = Score_1, 
    !
    .

comparer_meilleur_coup2(_,_,_,_,_,Coup_2,Score_2,Colonne_solution,Score) :-
    Colonne_solution= Coup_2,
    Score = Score_2,
    !
    .