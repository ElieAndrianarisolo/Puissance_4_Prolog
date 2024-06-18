% Explication de heuristique3 dans README

:- consult('transpose_matrice').

heuristique3(B, U) :-
    transpose(B, Transposed),
    has_three_score(B, 'x',ScoreHasThreeCol1),
    has_three_score(B, 'o',ScoreHasThreeCol2),
    has_three_score(Transposed, 'x',ScoreHasThreeRow1),
    has_three_score(Transposed, 'o',ScoreHasThreeRow2),
    U is ScoreHasThreeCol1 + ScoreHasThreeRow1 - ScoreHasThreeCol2 - ScoreHasThreeRow2.


% Donne le score pour une matrice

has_three_score([], _, 0).

has_three_score([Row|Rest], Symbol, Decp) :-
    has_three(Row, Symbol, RowDecp),
    has_three_score(Rest, Symbol, RestDecp),
    Decp is RowDecp + RestDecp.


% Donne le score pour une liste

has_three(L, B, V) :-
    has_three(L, B, 0, V).

has_three([], _, _, 0).


% Itération récursive

has_three([B, B, B | _], B, _, 3). % S'il y a 3 occurrences successives, le score est de 3

has_three([_ | Rest], B, Acc, V) :-
    has_three(Rest, B, Acc, V).  % Continuer la liste

    