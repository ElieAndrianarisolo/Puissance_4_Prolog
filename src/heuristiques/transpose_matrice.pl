% Transpose la matrice U et la renvoie en sortie V transpose(U, V)

transpose([], []).

transpose([[]|_], []).

transpose(Matrix, [Row|Transposed]) :-
    transpose_row(Matrix, Row, RestMatrix),
    transpose(RestMatrix, Transposed).

transpose_row([], [], []).

transpose_row([[X|Xs]|RestMatrix], [X|Row], [Xs|RestRows]) :-
    transpose_row(RestMatrix, Row, RestRows).