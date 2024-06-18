% Affichage des cases

afficher_case(Case):-                               % Affichage des pions rouges
    Case == o,
    ansi_format([bold, fg(red)], 'O', []),
    ansi_format([bold, fg(green)], '|', []).

afficher_case(Case):-                               % Affichage des pions jaunes
    Case == x,
    ansi_format([bold, fg(yellow)], 'X', []),
    ansi_format([bold, fg(green)], '|', []).

afficher_case(Case):-                               % Affichage des cases vides
    Case == e,
    write(' '),
    ansi_format([bold, fg(green)], '|', []).


% Affichage de la grille de jeu.
% La grille est une liste de colonnes de cases.

afficher_ligne_grille(Y_inversee, Grille) :-
    between(0, 6, X),
    nth0(X, Grille, Colonne),
    nth0(Y_inversee, Colonne, Case),
    not(afficher_case(Case)) ; true, nl, !.

afficher_grille(Grille) :-
    nl,
    between(0, 5, Y), 
    ansi_format([fg(green)], '|', []),
    Y_inversee is 5 - Y,
    not(afficher_ligne_grille(Y_inversee, Grille)) ; nl, true, !.




