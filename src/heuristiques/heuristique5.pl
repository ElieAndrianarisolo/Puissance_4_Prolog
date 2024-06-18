% Explication de heuristique5 dans README

:- consult('transpose_matrice').

heuristique5(B, U) :-
    total_isolate_score(B, 'x', IsolateScorePlayer1),
    total_isolate_score(B, 'o', IsolateScorePlayer2),
    U is IsolateScorePlayer2 - IsolateScorePlayer1.


% Donne le score pour une ligne (ou colonne)

total_isolate_score([], _, 0).

total_isolate_score([Row|Rest], Symbol, Decp) :-
    total_isolate(Row, Symbol, RowDecp),
    total_isolate_score(Rest, Symbol, RestDecp),
    Decp is RowDecp + RestDecp.

increment_isolated_occurrences([], _, 0).

increment_isolated_occurrences([_], _, 0).

increment_isolated_occurrences([S, X], S, 1) :-
    X \= 'e', X \= S.

increment_isolated_occurrences([X, S], S, 1) :-
    X \= 'e', 
    X \= S.

increment_isolated_occurrences([_, _], _, 0).

increment_isolated_occurrences([X, S, X], S, 1) :-
    X \= S, 
    X \= 'e'.

increment_isolated_occurrences([_, _, _], _, 0).

increment_isolated_occurrences([X, Y, Z|Rest], S, Res) :-
    increment_isolated_occurrences([X, Y, Z], S, Temp1),
    increment_isolated_occurrences([Y, Z|Rest], S, Temp2),
    Res is Temp1 + Temp2.

head_isolated([], _, 0).

head_isolated([_], _, 0).

head_isolated([S, X], S, 1) :-
    X \= 'e', X \= S.

head_isolated([_, _], _, 0).

tail_isolated([], _, 0).

tail_isolated([_], _, 0).

tail_isolated([X, S], S, 1) :-
    X \= 'e', X \= S.

tail_isolated([_, _], _, 0).

isbeforelastelement(U, [U, _]).

isbeforelastelement(U, [_|Rest]) :-
    isbeforelastelement(U, Rest).

islastelement(U, [U]).
islastelement(U, [_|Rest]) :-
    islastelement(U, Rest).


% Donne le score pour une matrice

total_isolate([First, Second|Rest], S, Res) :-
    increment_isolated_occurrences([First, Second|Rest], S, Temp1),
    islastelement(Last, [First, Second|Rest]),
    isbeforelastelement(Beforelast, [First, Second|Rest]),
    tail_isolated([Beforelast, Last], S, Temp2),
    head_isolated([First, Second], S, Temp3),
    Res is Temp1 + Temp2 + Temp3.    

    