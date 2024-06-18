% Explication de heuristique4 dans README

% Le but est d'assigner un score a un joueur en fonction du poid defini par les cases qu'il occupe
% Exemple pour rechercher dans une 2D list : composante(1, [[2,3],[3,4],[4,5]], R), composante(1, R, E). , retourne le deuxieme element de la deuxieme liste


condition(L, M, S) :- rechercher_index_3(L,M,0,I), ((recherche_precedent(L,I,e), S1 is 1;S1 is 0),(recherche_suivant(L, I, e), S2 is 1;S2 is 0)), S is S1+S2, !.
condition(_, _, 0).

rechercher_index_3(_, _, 3, -3).
rechercher_index_3([M|L], M, N, I) :- C is N+1, rechercher_index_3(L, M, C, J), I is J+1, !.
rechercher_index_3([_|L], M, _, I) :- rechercher_index_3(L, M, 0, J), I is J+1.

recherche_precedent([E|_], 1, E).
recherche_precedent([_|L], I, E) :- recherche_precedent(L, C, E), I is C+1.

recherche_suivant([E|_], -3, E).
recherche_suivant([_|L], I, E) :- recherche_suivant(L, C, E), I is C+1.

recuperer_colonne([C|_], 0, C).
recuperer_colonne(_, -1, []).
recuperer_colonne([_|L], I, C) :- recuperer_colonne(L, S, C), I is S+1.

se_placer_a_index([_|R],0,R).
se_placer_a_index([_|L], I, R) :- se_placer_a_index(L, C, R), I is C+1.

compte_cases([E|L],E,C) :- compte_cases(L, E, S), C is S+1, !.
compte_cases(_, _, 0).

compter_cases_libres_colonne(Ligne, Iligne, R) :- se_placer_a_index(Ligne, Iligne, L), compte_cases(L,e,R).

condition2(L, M, Sg, Sd) :- rechercher_index_3(L,M,0,I), ((recherche_precedent(L,I,e), Sg is I-1;Sg is -1),(recherche_suivant(L, I, e), Sd is I+3;Sd is -1)), !.
condition2(_, _, -1, -1).

condition_colonne([C1,C2,C3,C4,C5,C6,C7], M, SC) :- condition(C1, M, S1),
                                                    condition(C2, M, S2),
                                                    condition(C3, M, S3),
                                                    condition(C4, M, S4),
                                                    condition(C5, M, S5),
                                                    condition(C6, M, S6),
                                                    condition(C7, M, S7), SC is S1+S2+S3+S4+S5+S6+S7.
% completer 4 en 1 coup = 6
% completer 4 en 2 coups = 5
% ...
condition_diagonale([[C11, C12, C13, C14, C15, C16],
                      [C21, C22, C23, C24, C25, C26],
                      [C31, C32, C33, C34, C35, C36],
                      [C41, C42, C43, C44, C45, C46],
                      [C51, C52, C53, C54, C55, C56],
                      [C61, C62, C63, C64, C65, C66],
                      [C71, C72, C73, C74, C75, C76]],
                       M, SC) :- Tab = [[C11, C12, C13, C14, C15, C16],
                      [C21, C22, C23, C24, C25, C26],
                      [C31, C32, C33, C34, C35, C36],
                      [C41, C42, C43, C44, C45, C46],
                      [C51, C52, C53, C54, C55, C56],
                      [C61, C62, C63, C64, C65, C66],
                      [C71, C72, C73, C74, C75, C76]],                
                                condition2([C14, C23, C32, C41], M, Dg1, Dd1),
                                ((Dg1 == -1, Rg1 is 0) ; (Cg1 is Dg1, Ld1 is (3 - Dg1), recuperer_colonne(Tab, Cg1, Colg1), compter_cases_libres_colonne(Colg1,Ld1,Nc1), Rg1 is (6 - Nc1))),
                                ((Dd1 == -1, Rd1 is 0) ; (Cd1 is Dd1, Lg1 is (3 - Dd1), recuperer_colonne(Tab, Cd1, Cold1), compter_cases_libres_colonne(Cold1,Lg1,Nc1), Rd1 is (6 - Nc1))),
                                D1 is Rg1 + Rd1,

                                condition2([C15, C24, C33, C42, C51], M, Dg2, Dd2),
                                ((Dg2 == -1, Rg2 is 0) ; (Cg2 is Dg2, Lg2 is (4 - Dg2), recuperer_colonne(Tab, Cg2, Colg2), compter_cases_libres_colonne(Colg2,Lg2,Nc2), Rg2 is (6 - Nc2))),
                                ((Dd2 == -1, Rd2 is 0) ; (Cd2 is Dd2, Ld2 is (4 - Dd2), recuperer_colonne(Tab, Cd2, Cold2), compter_cases_libres_colonne(Cold2,Ld2,Nc2), Rd2 is (6 - Nc2))),
                                D2 is Rg2 + Rd2,

                                condition2([C16, C25, C34, C43, C52, C61], M, Dg3, Dd3),
                                ((Dg3 == -1, Rg3 is 0) ; (Cg3 is Dg3, Lg3 is (5 - Dg3), recuperer_colonne(Tab, Cg3, Colg3), compter_cases_libres_colonne(Colg3,Lg3,Nc3), Rg3 is (6 - Nc3))),
                                ((Dd3 == -1, Rd3 is 0) ; (Cd3 is Dd3, Ld3 is (5 - Dd3), recuperer_colonne(Tab, Cd3, Cold3), compter_cases_libres_colonne(Cold3,Ld3,Nc3), Rd3 is (6 - Nc3))),
                                D3 is Rg3 + Rd3,
                                
                                condition2([C26, C35, C44, C53, C62, C71], M, Dg4, Dd4), % Dg||Dd+1
                                ((Dg4 == -1, Rg4 is 0) ; (Cg4 is Dg4 + 1, Lg4 is (5 - Dg4), recuperer_colonne(Tab, Cg4, Colg4), compter_cases_libres_colonne(Colg4,Lg4,Nc4), Rg4 is (6 - Nc4))),
                                ((Dd4 == -1, Rd4 is 0) ; (Cd4 is Dd4 + 1, Ld4 is (5 - Dd4), recuperer_colonne(Tab, Cd4, Cold4), compter_cases_libres_colonne(Cold4,Ld4,Nc4), Rd4 is (6 - Nc4))),
                                D4 is Rg4 + Rd4,
                                
                                condition2([C36, C45, C54, C63, C72], M, Dg5, Dd5),      % +2
                                ((Dg5 == -1, Rg5 is 0) ; (Cg5 is Dg5 + 2, Lg5 is (5 - Dg5), recuperer_colonne(Tab, Cg5, Colg5), compter_cases_libres_colonne(Colg5,Lg5,Nc5), Rg5 is (6 - Nc5))),
                                ((Dd5 == -1, Rd5 is 0) ; (Cd5 is Dd5 + 2, Ld5 is (5 - Dd5), recuperer_colonne(Tab, Cd5, Cold5), compter_cases_libres_colonne(Cold5,Ld5,Nc5), Rd5 is (6 - Nc5))),
                                D5 is Rg5 + Rd5,
                                
                                condition2([C46, C55, C64, C73], M, Dg6, Dd6),           % +3
                                ((Dg6 == -1, Rg6 is 0) ; (Cg6 is Dg6 + 3, Lg6 is (5 - Dg6), recuperer_colonne(Tab, Cg6, Colg6), compter_cases_libres_colonne(Colg6,Lg6,Nc6), Rg6 is (6 - Nc6))),
                                ((Dd6 == -1, Rd6 is 0) ; (Cd6 is Dd6 + 3, Ld6 is (5 - Dd6), recuperer_colonne(Tab, Cd6, Cold6), compter_cases_libres_colonne(Cold6,Ld6,Nc6), Rd6 is (6 - Nc6))),
                                D6 is Rg6 + Rd6,

                                condition2([C13, C24, C35, C46], M, Dg7, Dd7),
                                ((Dg7 == -1, Rg7 is 0) ; (Cg7 is Dg7, Lg7 is (2 + Dg7), recuperer_colonne(Tab, Cg7, Colg7), compter_cases_libres_colonne(Colg7,Lg7,Nc7), Rg7 is (6 - Nc7))),
                                ((Dd7 == -1, Rd7 is 0) ; (Cd7 is Dd7, Ld7 is (2 + Dd7), recuperer_colonne(Tab, Cd7, Cold7), compter_cases_libres_colonne(Cold7,Ld7,Nc7), Rd7 is (6 - Nc7))),
                                D7 is Rg7 + Rd7,
                                
                                condition2([C12, C23, C34, C45, C56], M, Dg8, Dd8),
                                ((Dg8 == -1, Rg8 is 0) ; (Cg8 is Dg8, Lg8 is (1 + Dg8), recuperer_colonne(Tab, Cg8, Colg8), compter_cases_libres_colonne(Colg8,Lg8,Nc8), Rg8 is (6 - Nc8))),
                                ((Dd8 == -1, Rd8 is 0) ; (Cd8 is Dd8, Ld8 is (1 + Dd8), recuperer_colonne(Tab, Cd8, Cold8), compter_cases_libres_colonne(Cold8,Ld8,Nc8), Rd8 is (6 - Nc8))),
                                D8 is Rg8 + Rd8,
                                
                                condition2([C11, C22, C33, C44, C55, C66], M, Dg9, Dd9),
                                ((Dg9 == -1, Rg9 is 0) ; (Cg9 is Dg9, Lg9 is (0 + Dg9), recuperer_colonne(Tab, Cg9, Colg9), compter_cases_libres_colonne(Colg9,Lg9,Nc9), Rg9 is (6 - Nc9))),
                                ((Dd9 == -1, Rd9 is 0) ; (Cd9 is Dd9, Ld9 is (0 + Dd9), recuperer_colonne(Tab, Cd9, Cold9), compter_cases_libres_colonne(Cold9,Ld9,Nc9), Rd9 is (6 - Nc9))),
                                D9 is Rg9 + Rd9,
                                
                                condition2([C21, C32, C43, C54, C65, C76], M, Dg10, Dd10), % +1
                                ((Dg10 == -1, Rg10 is 0) ; (Cg10 is (Dg10 + 1), Lg10 is (0 + Dg10), recuperer_colonne(Tab, Cg10, Colg10), compter_cases_libres_colonne(Colg10,Lg10,Nc10), Rg10 is (6 - Nc10))),
                                ((Dd10 == -1, Rd10 is 0) ; (Cd10 is (Dd10 + 1), Ld10 is (0 + Dd10), recuperer_colonne(Tab, Cd10, Cold10), compter_cases_libres_colonne(Cold10,Ld10,Nc10), Rd10 is (6 - Nc10))),
                                D10 is Rg10 + Rd10,
                                
                                condition2([C31, C42, C53, C64, C75], M, Dg11, Dd11),      % +2
                                ((Dg11 == -1, Rg11 is 0) ; (Cg11 is (Dg11 + 2), Lg11 is (0 + Dg11), recuperer_colonne(Tab, Cg11, Colg11), compter_cases_libres_colonne(Colg11,Lg11,Nc11), Rg11 is (6 - Nc11))),
                                ((Dd11 == -1, Rd11 is 0) ; (Cd11 is (Dd11 + 2), Ld11 is (0 + Dd11), recuperer_colonne(Tab, Cd11, Cold11), compter_cases_libres_colonne(Cold11,Ld11,Nc11), Rd11 is (6 - Nc11))),
                                D11 is Rg11 + Rd11,
                                
                                condition2([C41, C52, C63, C74], M, Dg12, Dd12),           % +3
                                ((Dg12 == -1, Rg12 is 0) ; (Cg12 is (Dg12 + 3), Lg12 is (0 + Dg12), recuperer_colonne(Tab, Cg12, Colg12), compter_cases_libres_colonne(Colg12,Lg12,Nc12), Rg12 is (6 - Nc12))),
                                ((Dd12 == -1, Rd12 is 0) ; (Cd12 is (Dd12 + 3), Ld12 is (0 + Dd12), recuperer_colonne(Tab, Cd12, Cold12), compter_cases_libres_colonne(Cold12,Ld12,Nc12), Rd12 is (6 - Nc12))),
                                D12 is Rg12 + Rd12,
                                
                                SC is D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12.

condition_ligne([[], [], [], [], [], [], []], _, 0, 6, _).
condition_ligne([[X1|C1],[X2|C2],[X3|C3],[X4|C4],[X5|C5],[X6|C6],[X7|C7]], M, SC, I, Tab) :- condition_ligne([C1,C2,C3,C4,C5,C6,C7], M, SC1, F, Tab), I is F-1,
                                                                                              condition2([X1, X2, X3, X4, X5, X6, X7], M, Lg, Ld), 
                                                                                              (Lg == -1, Rg is 0 ; Cg is Lg, recuperer_colonne(Tab, Cg, Colg), compter_cases_libres_colonne(Colg,I,Nc), Rg is (6 - Nc)),
                                                                                              (Ld == -1, Rd is 0 ; Cd is Ld, recuperer_colonne(Tab, Cd, Cold), compter_cases_libres_colonne(Cold,I,Nc), Rd is (6 - Nc)),
                                                                                              SC is (SC1 + Rg + Rd).

condition_grille(L, M, S) :- condition_colonne(L, M, S1), condition_ligne(L, M, S2, 0, L), condition_diagonale(L,M, S3), S is S1+S2+S3.

heuristique4(L, S) :- condition_grille(L,x, S1), condition_grille(L,o,S2), S is S1-S2.

test_h4 :- 
    heuristique4([[o,o,x,o,o,x],[o,o,o,x,e,e], [x,x,x,o,e,e], [o,x,x,e,e,e], [o,x,e,e,e,e], [x,o,e,e,e,e], [e,e,e,e,e,e]], S),
    writeln(S).

% [[o,o,x,o,o,x],[o,o,o,x,e,e], [x,x,x,o,e,e], [o,x,x,e,e,e], [o,x,e,e,e,e], [x,o,e,e,e,e], [e,e,e,e,e,e]]