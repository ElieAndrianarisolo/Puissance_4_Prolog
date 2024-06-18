% Explication de heuristique1 dans le README

heuristique1(B, U) :-
    centered_score(B, 'x', Scorep1),
    centered_score(B, 'o', Scorep2),
    U is Scorep1 - Scorep2.


% Définit le score selon la position sur la colonne

scoring_positions([1, 2, 3, 4, 3, 2, 1]).


% Fonction calculant le score 

centered_score(Board, Symbol, Score) :-
    scoring_positions(Positions),                                   % Définir la notation en fonction de la position des colonnes
    calculate_centered_score(Board, Symbol, Positions, 0, Score).   % Calculer le score centré


% Fonction secondaire

calculate_centered_score([], _, _, Score, Score).

calculate_centered_score([Column|Rest], Symbol, [Position|Positions], TempScore, Score) :-
    count_symbol_occurrences(Column, Symbol, ColumnScore),                  % Compter les occurences 
    NewScore is TempScore + (ColumnScore * Position),                       % Mise à jour du score
    calculate_centered_score(Rest, Symbol, Positions, NewScore, Score).     % Continuer avec la colonne suivante


% Fonction qui compte les occurences

count_symbol_occurrences(Column, Symbol, Count) :-
    include(=(Symbol), Column, SymbolOccurrences),
    length(SymbolOccurrences, Count).





