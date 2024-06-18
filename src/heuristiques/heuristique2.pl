% Explication de heuristique2 dans README

:- consult('transpose_matrice').

heuristique2(B, U) :-
    transpose(B, Transposed),
    decrement_score(B, 'x', DecColumn1),
    decrement_score(B, 'o', DecColumn2),
    decrement_score2(Transposed, 'x', DecRow1),
    decrement_score2(Transposed, 'o', DecRow2),
    U is DecColumn1 + DecRow1 - DecColumn2 - DecRow2.


% Fonction pour obtenir le score et ses fonctions secondaires

decrement_score([], _, 0).

decrement_score([Column|Rest], Symbol, Decp) :-
    decrement_column(Column, Symbol, ColumnDecp),
    decrement_score(Rest, Symbol, RestDecp),
    Decp is ColumnDecp + RestDecp.

decrement_column([], _, 0).

decrement_column([_, _, OtherSymbol|_], Symbol, -3) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_column([_, OtherSymbol|_], Symbol, -2) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_column([OtherSymbol|_], Symbol, -1) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_column([Symbol|_], Symbol, 0).

decrement_column(_, _, 0).

% Fonction donnant le score 

decrement_score2([], _, 0).

decrement_score2([Row|Rest], Symbol, Decp) :-
    decrement_row(Row, Symbol, RowDecp),
    decrement_score2(Rest, Symbol, RestDecp),
    Decp is RowDecp + RestDecp.

decrement_row([], _, 0).

decrement_row([_, _, _, OtherSymbol|_], Symbol, -4) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_row([_, _, OtherSymbol|_], Symbol, -3) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_row([_, OtherSymbol|_], Symbol, -2) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_row([OtherSymbol|_], Symbol, -1) :-
    OtherSymbol \= 'e',
    OtherSymbol \= Symbol.

decrement_row([Symbol|_], Symbol, 0).

decrement_row(_, _, 0).

    