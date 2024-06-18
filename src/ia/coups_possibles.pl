:- consult(victoire).
:- consult(symetrie).
:- consult(aleatoire).


% Récupère les coups légaux

recuperer_cases_vides(Grille,Cases_vides) :- 
    findall((I,J,K),(nth1(I,Grille,X),nth1(J,X,'e'),(J==1;(J>1,K is J-1, \+ nth1(K,X,'e')))),Cases_vides).

% Récupère les indices des coups
% Limite les coups à la partie droite ou la partie gauche de la grille si celle-ci est symétrique

recuperer_indices_coups(Grille,Coups_possibles):-                    % Partie droite
    recuperer_cases_vides(Grille,Cases_vides),
    symetrique(Grille),
    random_int_1n(2,R),
    R is 1,
    findall(X,(nth1(_,Cases_vides,(X,_,_)),X=<4),Coups_possibles),
    !
    .

recuperer_indices_coups(Grille,Coups_possibles):-                    % Partie gauche
    recuperer_cases_vides(Grille,Cases_vides),
    symetrique(Grille),
    findall(X,(nth1(_,Cases_vides,(X,_,_)),X>=4),Coups_possibles),
    !
    .

recuperer_indices_coups(Grille,Coups_possibles):-                    % Grille non-symétrique
    recuperer_cases_vides(Grille,Cases_vides),
    findall(X,nth1(_,Cases_vides,(X,_,_)),Coups_possibles)
    .

% Retourne les coups possibles au sein de la grille de jeu à condition que personne n'ai gagné

coups_possibles(Grille,Coup_possibles) :-
    not(gagne(Grille,x)),
    not(gagne(Grille,o)),
    recuperer_indices_coups(Grille,Coup_possibles),
    Coup_possibles \= []
    .







