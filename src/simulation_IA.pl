%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pour simuler une partie entre 2 IAs, écrire la commande Prolog suivante : 'simuler_ia(IA1, IA2)'
% IA1 joue les pions rouges ('o'). L'IA1 commence toujours
% IA2 joue les pions jaunes ('x')
% IAs disponibles : h0, h1, h2, h3, h4, h5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


:- consult(jeu).

% Simuler une partie de puissance 4 entre 2 IAs.
% IAs disponibles : h0, h1, h2, h3, h4, h5

simuler_ia(h0, h1) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h0, h1, joueur1).

simuler_ia(h0, h2) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h0, h2, joueur1).

simuler_ia(h0, h3) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h0, h3, joueur1).

simuler_ia(h0, h4) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h0, h4, joueur1).

simuler_ia(h0, h5) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h0, h5, joueur1).

simuler_ia(h1, h0) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h1, h0, joueur1).

simuler_ia(h1, h2) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h1, h2, joueur1).

simuler_ia(h1, h3) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h1, h3, joueur1).

simuler_ia(h1, h4) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h1, h4, joueur1).

simuler_ia(h1, h5) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h1, h5, joueur1).

simuler_ia(h2, h0) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h2, h0, joueur1).

simuler_ia(h2, h1) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h2, h1, joueur1).

simuler_ia(h2, h3) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h2, h3, joueur1).

simuler_ia(h2, h4) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h2, h4, joueur1).

simuler_ia(h2, h5) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h2, h5, joueur1).

simuler_ia(h3, h0) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h3, h0, joueur1).

simuler_ia(h3, h1) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h3, h1, joueur1).

simuler_ia(h3, h2) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h3, h2, joueur1).

simuler_ia(h3, h4) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h3, h4, joueur1).

simuler_ia(h3, h5) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h3, h5, joueur1).

simuler_ia(h4, h0) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h4, h0, joueur1).

simuler_ia(h4, h1) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h4, h1, joueur1).

simuler_ia(h4, h2) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h4, h2, joueur1).

simuler_ia(h4, h3) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h4, h3, joueur1).

simuler_ia(h4, h5) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h4, h5, joueur1).

simuler_ia(h5, h0) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h5, h0, joueur1).

simuler_ia(h5, h1) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h5, h1, joueur1).

simuler_ia(h5, h2) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h5, h2, joueur1).

simuler_ia(h5, h3) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h5, h3, joueur1).

simuler_ia(h5, h4) :- 
    nl,
    alterner_ia_simulation([[e,e,e,e,e,e],[e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e], [e,e,e,e,e,e]], _, h5, h4, joueur1).

jouer_coup_ia(Grille, X, Pion, Joueur, Nouvelle_grille) :-
    (inserer_pion(Grille, X, X_joueur, Y_joueur, Pion, Nouvelle_grille), afficher_grille(Nouvelle_grille), (\+ fin_partie(Nouvelle_grille, X_joueur, Y_joueur, Pion, Joueur) -> true ; abort), !).

alterner_ia_simulation(Grille, Nouvelle_grille, IA1, IA2, Joueur1) :-
    (   
        (
            Joueur1 = joueur1 ->
            (   
                write('C''est a l''IA '),
                write(IA1),
                writeln(' de jouer.'),
                minimax(5, Grille, x, Coup, _, IA1, o),
                (
                    jouer_coup_ia(Grille, Coup, o, IA1, Nouvelle_grille), alterner_ia_simulation(Nouvelle_grille, _, IA1, IA2, joueur2) 
                )
            )
            ;
            (   
                write('C''est a l''IA '),
                write(IA2),
                writeln(' de jouer.'),
                minimax(5, Grille, o, Coup, _, IA2, x),
                (
                    jouer_coup_ia(Grille, Coup, x, IA2, Nouvelle_grille), alterner_ia_simulation(Nouvelle_grille, _, IA1, IA2, joueur1)
                )
            )
        )
    ).


