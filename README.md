# Puissance_4_Prolog

## heuristiques

Valeur de retour :
- `-1000` : sûr à 100% de perdre pour le 1er joueur (`'x'`)
- `-100` : grandes chances de perdre pour le 1er joueur (`'x'`)
- `1000` : sûr à 100% de gagner pour le 1er joueur (`'x'`)
- `100` : grandes chances de gagner pour le 1er joueur (`'x'`)
- `0` : position neutre

##### h0

- aléatoire

##### h1

- Le score du joueur est dépend de la façon dont il est centré en colonnes dans le tableau. Il est compris entre 0 et 96
- la valeur heuristique est le score de x - le score de o. Elle est comprise entre 96 et -96.
- est supérieure à 0 si x est plus centré que o.
- est inférieure à 0 si x est moins centré que o.
```
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
```

##### h2

- Le score du joueur dépend de la façon dont son opposant est centré en colonnes et en ligne dans le tableau. Il est compris entre 0 et - La valeur heuristique est le score de x - le score de o. Elle est comprise entre 45 et -45.
- est supérieure à 0 si x est moins gêné que o (donc en meilleure position).
- est inférieure à 0 si x est plus gêné que o (donc en moins bonne position).
    
```
0 1 2 3 2 1 0
1 2 3 4 3 2 1
2 3 4 5 4 3 2
2 3 4 5 4 3 2
1 2 3 4 3 2 1
0 1 2 3 2 1 0
```

##### h3

- Le score du joueur est le nombre de série de 3 pions succesifs qu'il a, sur chaque colonne et chaque ligne. Il est compris entre 0 et 57
- Le score d'un joueur est incrémenté de +3 à chaque fois qu'une nouvelle "ligne de 3" est détectée sur une ligne ou une colonne.
- La valeur heuristique est le score de x - le score de o. Elle est comprise entre 57 et - 57.
- est supérieure à 0 si x a plus de lignes de 3 que o.
- est inférieure à 0 si o a plus de lignes de 3 que x.

##### h4

- compte le nombre de 3 alignés avec 1 vide avant ou après
(différent du nb de puissance 4 en 1 coup)

##### h5

- Le score du joueur est en relation aux nombres de pion "isolés" qu'il a sur le terrain. Le score compris entre 0 et 42.
- La valeur heuristique est le score de o - le score de x. Est comprise entre 42 et - 42.
- est supérieure à 0 si x a moins de "pion" isolé que o.
- est inférieure à 0 si o a moins de "pion" isolé que x.

##### h6 (non implementée par dysfonctionnement et manque de temps, mais explicitée dans la présentation)

- compte le nombre de zones avec un puissance 4 possible avec 0,1,2 ou 3 piece dedans
