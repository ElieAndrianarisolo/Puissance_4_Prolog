%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOMBRES PSEUDO-ALÉATOIRES (issus de l'exemple du morpion)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%.......................................
% random_seed
%.......................................
% Initialise le générateur de nombres aléatoires...
% Si aucune graine n'est fournie, utilise l'heure actuelle
%

random_seed :-
    random_seed(_),
    !.


%.......................................
% random_int_1n
%.......................................
% Renvoie un entier aléatoire de 1 à N
%

random_int_1n(N, V) :-
    V is random(N) + 1,
    !.