% Détermine si une grille est symétrique ou non

symetrique([[], [], [], [], [], [], []]). 				% Cas d'une grille vide

symetrique([[], [], [], _, [], [], []]).                % Cas d'une grille dans laquelle seule la colonne du milieu est occupée 

symetrique([[], [], [X|C3], C4, [X|C5], [], []]) :-		% Vérifications sur les colonnes 3 4 5
	symetrique([[], [], C3, C4, C5, [], []]).			% Chaque est ligne symétrique par rapport à la colonne du milieu

symetrique([[], [X|C2], C3, C4, C5, [X|C6], []]) :-		% Vérifications sur les colonnes 2 3 4 5 6
	symetrique([[], C2, C3, C4, C5, C6, []]).			% Chaque ligne est symétrique par rapport à la colonne du milieu

symetrique([[X|C1], C2, C3, C4, C5, C6, [X|C7]]) :-		% Vérifications sur toutes les colonnes
	symetrique([C1, C2, C3, C4, C5, C6, C7]).			% Chaque ligne symétrique par rapport à la colonne du milieu