%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pour lancer le jeu, écrire la commande Prolog suivante : 'run.'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:-consult(gestion/affichage).
:-consult(gestion/gestion_pion).
:-consult(ia/minimax).

% Déterminer le nombre de pions de la même couleur consécutifs dans une direction donnée en partant du pion (X, Y), excluant ce dernier. 
%       Paramètres :
%           Grille : grille de jeu | X : n°colonne du pion | Y : n°ligne du pion | 
%           DX : coordonnée-colonne du vecteur directionnel | DY : coordonnée-ligne du vecteur directionnel
%           Pion : valeur du pion | Compteur : compteur de pions de la même couleur
% La vérification s'arrête après avoir trouvé jusqu'à trois pions consécutifs de la même couleur dans la ligne 
% définie par le vecteur (DX, DY). Si aucun pion de couleur différente n'est rencontré dans cette ligne, Compteur 
% restera à 3 pour indiquer qu'il y a potentiellement une victoire si un quatrième pion est ajouté à la position initiale (X, Y).

voisins(Grille, X, Y, DX, DY, Pion, Compteur) :- 
    (
        between(1, 3, Cpt), 
        X_next is DX*Cpt+X, Y_next is DY*Cpt+Y,
        not(est_pion(Grille, X_next, Y_next, Pion)),
        Compteur is Cpt-1, !
    ) ; Compteur is 3, true.


% Vérifier dans toutes les directions possibles à partir de la position (X, Y) si placer un pion à cet endroit serait une action gagnante.
% Pour savoir si la partie est finie, Limite doit être initialisé à 3.

gagner(Grille, X, Y, Pion, Limite) :-                  % Directions horizontales
    voisins(Grille, X, Y, 1, 0, Pion, C1),             % Droite 
    voisins(Grille, X, Y, -1, 0, Pion, C2),            % Gauche 
    Compteur is C1+C2, 
    Compteur >= Limite, 
    !.

gagner(Grille, X, Y, Pion, Limite) :-               % Directions verticales
    voisins(Grille, X, Y, 0, 1, Pion, C1),             % Bas 
    voisins(Grille, X, Y, 0, -1, Pion, C2),            % Haut        
    Compteur is C1+C2, 
    Compteur >= Limite, 
    !.

gagner(Grille, X, Y, Pion, Limite) :-               % Diagonale montante
    voisins(Grille, X, Y, 1, -1, Pion, C1),            % Bas 
    voisins(Grille, X, Y, -1, 1, Pion, C2),            % Haut 
    Compteur is C1+C2, 
    Compteur >= Limite, 
    !.

gagner(Grille, X, Y, Pion, Limite) :-               % Diagonale descendante
    voisins(Grille, X, Y, 1, 1, Pion, C1),             % Haut 
    voisins(Grille, X, Y, -1, -1, Pion, C2),           % Bas 
    Compteur is C1+C2, 
    Compteur >= Limite, 
    !.


% Déterminer si la grille est pleine

liste_pleine([]).

liste_pleine([T|Q]) :-
    \+ member(e, T), 
    liste_pleine(Q). 

grille_pleine(Grille) :-
    liste_pleine(Grille). % Vérifie si chaque sous-liste est pleine


% Déterminer si la partie est terminé

fin_partie(Grille, X, Y, Pion, Joueur) :-
    Joueur == joueur, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'Felicitations, vous avez remporte la partie !', []), nl, nl,  !
    ; Joueur == ia, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(red)], 'Vous avez perdu.', []), nl, nl, !.

fin_partie(Grille, X, Y, Pion, Joueur) :-
    Joueur == joueur1, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'Le joueur 1 remporte la partie.', []), nl, nl, !
    ; Joueur == joueur2, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'Le joueur 2 remporte la partie.', []), nl, nl, !
    ; Joueur == h0, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'L''IA h0 (pion ', []), ansi_format([bold,fg(green)], Pion, []), ansi_format([bold,fg(green)], ') remporte la partie.', []), nl, nl, !
    ; Joueur == h1, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'L''IA h1 (pion ', []), ansi_format([bold,fg(green)], Pion, []), ansi_format([bold,fg(green)], ') remporte la partie.', []), nl, nl, !
    ; Joueur == h2, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'L''IA h2 (pion ', []), ansi_format([bold,fg(green)], Pion, []), ansi_format([bold,fg(green)], ') remporte la partie.', []), nl, nl, !
    ; Joueur == h3, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'L''IA h3 (pion ', []), ansi_format([bold,fg(green)], Pion, []), ansi_format([bold,fg(green)], ') remporte la partie.', []), nl, nl, !
    ; Joueur == h4, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'L''IA h4 (pion ', []), ansi_format([bold,fg(green)], Pion, []), ansi_format([bold,fg(green)], ') remporte la partie.', []), nl, nl, !
    ; Joueur == h5, gagner(Grille, X, Y, Pion, 3), ansi_format([bold,fg(green)], 'L''IA h5 (pion ', []), ansi_format([bold,fg(green)], Pion, []), ansi_format([bold,fg(green)], ') remporte la partie.', []), nl, nl, !
    .

fin_partie(Grille, _, _, _, _) :-
    grille_pleine(Grille), ansi_format([bold,fg(blue)], 'Match nul.', []), nl, nl, !.


% Gérer si le joueur souhaite rejouer ou non au jeu

rejouer :-
    write('Voulez-vous rejouer (oui/non) ? '),
    read(V),
    (V == 'oui' -> run ; V == 'non' -> nl, halt, nl, nl), 
    !.

rejouer :-
    nl,
    write('Saisissez soit oui, soit non.'),
    nl,
    rejouer.


% Détermine le premier joueur au hasard (0 pour le joueur1, 1 pour l'IA/joueur2)

lancer_hasard(Joueur) :-
    random(0, 2, Rand), % Génère un nombre aléatoire entre 0 et 1
    (Rand =:= 0 -> Joueur = 1 ; Joueur = 2). % Attribution du premier joueur


% Le joueur (1 ou 2) joue son coup

jouer_joueur(Grille, X, Pion, Joueur, Nouvelle_grille) :-
    (inserer_pion(Grille, X, X_joueur, Y_joueur, Pion, Nouvelle_grille), afficher_grille(Nouvelle_grille), (\+ fin_partie(Nouvelle_grille, X_joueur, Y_joueur, Pion, Joueur) -> true ; rejouer), !) ; 
    nl, write('Votre reponse est incorrecte. Veuillez reessayer.'), nl, afficher_grille(Grille), false. 

% Jouer à deux joueurs
alterner_joueur(Grille, x, Joueur_actuel, Nouvelle_grille) :-
    (   
        Joueur_actuel = joueur1 ->
        (   
            writeln('C''est au joueur 1 de jouer. Choisissez une colonne pour placer votre pion (de 1 a 7) : '), 
            read(Coup1),
            (   
                jouer_joueur(Grille, Coup1, x, joueur1, Nouvelle_grille) -> true, alterner_joueur(Nouvelle_grille, x, joueur2, _) ;
                alterner_joueur(Grille, x, joueur1, Nouvelle_grille)
            )
        )
        ;
        (   
            writeln('C''est au joueur 2 de jouer. Choisissez une colonne pour placer votre pion (de 1 a 7) : '), 
            read(Coup2),
            (   
                jouer_joueur(Grille, Coup2, o, joueur2, Nouvelle_grille) -> true, alterner_joueur(Nouvelle_grille, x, joueur1, _) ;
                alterner_joueur(Grille, x, joueur2, Nouvelle_grille)
            )
        )
    ).

alterner_joueur(Grille, o, Joueur_actuel, Nouvelle_grille) :-
    (   
        Joueur_actuel = joueur1 ->
        (   
            writeln('C''est au joueur 1 de jouer. Choisissez une colonne pour placer votre pion (de 1 a 7) : '), 
            read(Coup1),
            (   
                jouer_joueur(Grille, Coup1, o, joueur1, Nouvelle_grille) -> true, alterner_joueur(Nouvelle_grille, o, joueur2, _) ;
                alterner_joueur(Grille, o, joueur1, Nouvelle_grille)
            )
        )
        ;
        (   
            writeln('C''est au joueur 2 de jouer. Choisissez une colonne pour placer votre pion (de 1 a 7) : '), 
            read(Coup2),
            (   
                jouer_joueur(Grille, Coup2, x, joueur2, Nouvelle_grille) -> true, alterner_joueur(Nouvelle_grille, o, joueur1, _) ;
                alterner_joueur(Grille, o, joueur2, Nouvelle_grille)
            )
        )
    ).

jouer_deux_joueurs(Grille, Pion_joueur1, 1) :-
    afficher_grille(Grille),
    alterner_joueur(Grille, Pion_joueur1, joueur1, _).

jouer_deux_joueurs(Grille, Pion_joueur1, 2) :-
    afficher_grille(Grille),
    alterner_joueur(Grille, Pion_joueur1, joueur2, _).

jouer_deux_joueurs(Grille, Pion_joueur1, 3) :-
    afficher_grille(Grille),
    lancer_hasard(Debut),
    (Debut =:= 1 ->
        alterner_joueur(Grille, Pion_joueur1, joueur1, _)
    ;
        alterner_joueur(Grille, Pion_joueur1, joueur2, _)
    ).

jouer_deux_joueurs(_, Pion_joueur1, _) :-
    nl,
    writeln('Saisissez soit 1, soit 2, soit 3. '),
    (
        Pion_joueur1 == o -> set_couleur_pions_deux_joueurs(rouge)
        ;
        set_couleur_pions_deux_joueurs(jaune)
    ).


% Déterminer la couleur des pions et l'ordre de jeu pour le mode 2 joueurs

set_couleur_pions_deux_joueurs(rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : joueur 2 | 3 : au hasard) : '),
    read(Debut),
    jouer_deux_joueurs([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, Debut).

set_couleur_pions_deux_joueurs(jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : joueur 2 | 3 : au hasard) : '),
    read(Debut),
    jouer_deux_joueurs([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, Debut).

set_couleur_pions_deux_joueurs(_) :-
    nl,
    writeln('Saisissez soit rouge, soit jaune.'),
    choisir_couleur_pions_deux_joueurs.

choisir_couleur_pions_deux_joueurs :-
    nl, 
    writeln('Joueur 1, quel couleur de pions souhaitez-vous utiliser ? : '),
    read(Couleur_choisie),
    set_couleur_pions_deux_joueurs(Couleur_choisie).


%  Jouer contre une IA

alterner_joueur_ia(Grille, Nouvelle_grille, o, IA, Joueur1) :-      % Pour toutes les autres heuristiques
    (   
        (
            Joueur1 = joueur1 ->
            (   
                writeln('C''est au joueur 1 de jouer. Choisissez une colonne pour placer votre pion (de 1 a 7) : '),
                read(Coup1),
                (   
                    jouer_joueur(Grille, Coup1, o, joueur1, Nouvelle_grille) -> true, alterner_joueur_ia(Nouvelle_grille, _, o, IA, IA) ;
                    alterner_joueur_ia(Grille, Nouvelle_grille, o, IA, joueur1)
                )
            )
            ;
            (
                write('C''est a l''IA '),
                write(IA),
                writeln(' de jouer.'),
                minimax(5, Grille, x, Coup, _, IA,o),
                (
                    jouer_joueur(Grille, Coup, x, IA, Nouvelle_grille), alterner_joueur_ia(Nouvelle_grille, _, o, IA, joueur1)
                )
            )
        )
    ).

alterner_joueur_ia(Grille, Nouvelle_grille, x, IA, Joueur1) :-
    (   
        (
            Joueur1 = joueur1 ->
            (   
                writeln('C''est au joueur 1 de jouer. Choisissez une colonne pour placer votre pion (de 1 a 7) : '),
                read(Coup1),
                (   
                    jouer_joueur(Grille, Coup1, x, joueur1, Nouvelle_grille) -> true, alterner_joueur_ia(Nouvelle_grille, _, x, IA, IA) ;
                    alterner_joueur_ia(Grille, Nouvelle_grille, x, IA, joueur1)

                )
            )
            ;
            (
                write('C''est a l''IA '),
                write(IA),
                writeln(' de jouer.'),
                minimax(5, Grille, o ,Coup, _, IA,x),
                (   
                    jouer_joueur(Grille, Coup, o, IA, Nouvelle_grille), alterner_joueur_ia(Nouvelle_grille, _, x, IA, joueur1)
                )
            )
        )
    ).


% Déterminer la couleur des pions, l'IA choisie et l'ordre de jeu

jouer_joueur_ia(Grille, Pion_joueur1, IA_choisie, 1) :-
    afficher_grille(Grille),
    alterner_joueur_ia(Grille,_, Pion_joueur1, IA_choisie, joueur1).

jouer_joueur_ia(Grille, Pion_joueur1, IA_choisie, 2) :- 
    afficher_grille(Grille),
    alterner_joueur_ia(Grille,_, Pion_joueur1, IA_choisie, joueur2).

jouer_joueur_ia(Grille, Pion_joueur1, IA_choisie, 3) :- 
    afficher_grille(Grille),
    lancer_hasard(Debut),
    (Debut =:= 1 ->
        alterner_joueur_ia(Grille,_, Pion_joueur1, IA_choisie, joueur1)
    ;
        alterner_joueur_ia(Grille,_, Pion_joueur1, IA_choisie, joueur2)
    ).

jouer_joueur_ia(_, Pion_joueur1, IA_choisie, _) :-
    nl,
    writeln('Saisissez soit 1, soit 2, soit 3.'),
    (
        Pion_joueur1 == o -> set_ia(IA_choisie, rouge)
        ;
        set_ia(IA_choisie, jaune)
    ).
    
set_ia(h0, rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, h0, Debut).

set_ia(h0, jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, h0, Debut).

set_ia(h1, rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, h1, Debut).

set_ia(h1, jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, h1, Debut).

set_ia(h2, rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, h2, Debut).

set_ia(h2, jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, h2, Debut).

set_ia(h3, rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, h3, Debut).

set_ia(h3, jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, h3, Debut).

set_ia(h4, rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, h4, Debut).

set_ia(h4, jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, h4, Debut).

set_ia(h5, rouge) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], o, h5, Debut).

set_ia(h5, jaune) :-
    nl,
    writeln('Qui commence ? (1 : joueur 1 | 2 : IA | 3 : au hasard) : '),
    read(Debut),
    jouer_joueur_ia([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], x, h5, Debut).

set_ia(_,rouge) :-
    nl,
    writeln('Saisissez soit h0, h1 h2, h3, h4, ou h5.'),
    choisir_ia(rouge).

set_ia(_,jaune) :-
    nl,
    writeln('Saisissez soit h0, h1, h2, h3, h4, ou h5.'),
    choisir_ia(jaune).

choisir_ia(rouge) :-
    nl, 
    writeln('Joueur 1, avec quelle IA voulez-vous jouer ? : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia(IA_choisie, rouge).

choisir_ia(jaune) :-
    nl, 
    writeln('Joueur 1, avec quelle IA voulez-vous jouer ? : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia(IA_choisie, jaune).

choisir_ia(_) :-
    nl,
    writeln('Saisissez soit rouge, soit jaune.'),
    choisir_couleur_pions_joueur_ia.

choisir_couleur_pions_joueur_ia :-
    nl, 
    writeln('Joueur 1, quel couleur de pions souhaitez-vous utiliser ? : '),
    read(Couleur_choisie),
    choisir_ia(Couleur_choisie).


% Déterminer la couleur des pions, l'IA choisie et l'ordre de jeu

alterner_ia(Grille, Nouvelle_grille, IA1, IA2, Joueur1) :-
    (   
        (
            Joueur1 = joueur1 ->
            (   
                write('C''est a l''IA1 '),
                write(IA1),
                writeln(' de jouer.'),
                minimax(5, Grille, x, Coup, _, IA1, o),
                (
                    jouer_joueur(Grille, Coup, o, IA1, Nouvelle_grille), alterner_ia(Nouvelle_grille, _, IA1, IA2, joueur2) 
                )
            )
            ;
            (   
                write('C''est a l''IA2 '),
                write(IA2),
                writeln(' de jouer.'),
                minimax(5, Grille, o, Coup, _, IA2, x),
                (
                    jouer_joueur(Grille, Coup, x, IA2, Nouvelle_grille), alterner_ia(Nouvelle_grille, _, IA1, IA2, joueur1)
                )
            )
        )
    ).

jouer_ia1_ia2(Grille,IA1, IA2, 1) :-
    afficher_grille(Grille),
    alterner_ia(Grille,_, IA1, IA2, joueur1).

jouer_ia1_ia2(Grille, IA1, IA2, 2) :- 
    afficher_grille(Grille),
    alterner_ia(Grille,_, IA1, IA2, joueur2).

jouer_ia1_ia2(Grille, IA1, IA2, 3) :- 
    afficher_grille(Grille),
    lancer_hasard(Debut),
    (Debut =:= 1 ->
        alterner_ia(Grille,_, IA1, IA2, joueur1)
    ;
        alterner_ia(Grille,_, IA1, IA2, joueur2)
    ).

jouer_ia1_ia2(Grille, IA1, IA2, 3) :- 
    afficher_grille(Grille),
    lancer_hasard(Debut),
    (Debut =:= 1 ->
        alterner_joueur_ia(Grille,_, o, IA1, IA2, joueur1)
    ;
        alterner_joueur_ia(Grille,_, x, IA1, IA2, joueur2)
    ).

jouer_ia1_ia2(_, IA1, IA2, _) :-
    nl,
    writeln('Saisissez soit 1, soit 2, soit 3.'),
    set_ia2(IA1, IA2).

set_ia2(IA1, h0) :-
    nl,
    writeln('Qui commence ? (1 : IA1 | 2 : IA2 | 3 : au hasard) : '),
    read(Debut),
    jouer_ia1_ia2([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], IA1, h0, Debut).

set_ia2(IA1, h1) :-
    nl,
    writeln('Qui commence ? (1 : IA1 | 2 : IA2 | 3 : au hasard) : '),
    read(Debut),
    jouer_ia1_ia2([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], IA1, h1, Debut).

set_ia2(IA1, h2) :-
    nl,
    writeln('Qui commence ? (1 : IA1 | 2 : IA2 | 3 : au hasard) : '),
    read(Debut),
    jouer_ia1_ia2([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], IA1, h2, Debut).

set_ia2(IA1, h3) :-
    nl,
    writeln('Qui commence ? (1 : IA1 | 2 : IA2 | 3 : au hasard) : '),
    read(Debut),
    jouer_ia1_ia2([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], IA1, h3, Debut).

set_ia2(IA1, h4) :-
    nl,
    writeln('Qui commence ? (1 : IA1 | 2 : IA2 | 3 : au hasard) : '),
    read(Debut),
    jouer_ia1_ia2([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], IA1, h4, Debut).

set_ia2(IA1, h5) :-
    nl,
    writeln('Qui commence ? (1 : IA1 | 2 : IA2 | 3 : au hasard) : '),
    read(Debut),
    jouer_ia1_ia2([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], IA1, h5, Debut).

set_ia2(IA1, _) :-
    nl,
    writeln('Saisissez soit h0, h1 h2, h3, h4, ou h5.'),
    set_ia1(IA1).

set_ia1(h0) :- 
    nl,
    writeln('Veuillez choisir l''IA2 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia2(h0, IA_choisie).

set_ia1(h1) :- 
    nl,
    writeln('Veuillez choisir l''IA2 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia2(h1, IA_choisie).

set_ia1(h2) :- 
    nl,
    writeln('Veuillez choisir l''IA2 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia2(h2, IA_choisie).

set_ia1(h3) :- 
    nl,
    writeln('Veuillez choisir l''IA2 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia2(h3, IA_choisie).

set_ia1(h4) :- 
    nl,
    writeln('Veuillez choisir l''IA2 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia2(h4, IA_choisie).

set_ia1(h5) :- 
    nl,
    writeln('Veuillez choisir l''IA2 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia2(h5, IA_choisie).

set_ia1(_) :-
    nl,
    writeln('Saisissez soit h0, h1 h2, h3, h4, ou h5.'),
    set_mode_jeu(3).


% Déterminer le mode de jeu choisi par l'utilisateur

set_mode_jeu(1) :- 
    nl,
    writeln('Vous pouvez jouer :  '),
    nl,
    writeln('   - rouge : les pions rouges'),
    writeln('   - jaune : les pions jaunes'),
    choisir_couleur_pions_deux_joueurs.

set_mode_jeu(2) :- 
    nl,
    writeln('Vous pouvez jouer :  '),
    nl,
    writeln('   - rouge : les pions rouges'),
    writeln('   - jaune : les pions jaunes'),
    choisir_couleur_pions_joueur_ia.

set_mode_jeu(3) :- 
    nl,
    writeln('L''IA1 joue les pions rouges. L''IA2 joue les jaunes.'),
    nl,
    writeln('Veuillez choisir l''IA1 : '),
    nl,
    writeln('   - h0 : l''IA qui utilise l''heuristique 0'),
    writeln('   - h1 : l''IA qui utilise l''heuristique 1'),
    writeln('   - h2 : l''IA qui utilise l''heuristique 2'),
    writeln('   - h3 : l''IA qui utilise l''heuristique 3'),
    writeln('   - h4 : l''IA qui utilise l''heuristique 4'),
    writeln('   - h5 : l''IA qui utilise l''heuristique 5'),
    nl,
    read(IA_choisie),
    set_ia1(IA_choisie).

set_mode_jeu(_) :-
    nl,
    write('Saisissez soit 1, soit 2, soit 3.'),
    mode_jeu.

mode_jeu :- 
    nl,
    writeln('Quel mode de jeu souhaitez-vous utiliser ? : '),
    read(Mode),
    set_mode_jeu(Mode).
    

% Lancer l'application Puissance 4

run :-
    nl,
    nl,
    nl,
    writeln('Menu du Puissance 4.'),
    nl,
    writeln('Deux modes de jeu s''offrent a vous : '),
    nl,
    writeln('   - 1 : Joueur 1 VS Joueur 2'),
    writeln('   - 2 : Joueur VS IA'),
    writeln('   - 3 : IA1 VS IA2'),
    mode_jeu.


