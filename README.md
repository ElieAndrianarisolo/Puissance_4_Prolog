# Puissance 4 - Prolog

This project is a **Connect 4** game (also known as **Puissance 4**) implemented in **Prolog**. The game involves two players trying to connect four of their pieces in a row, either horizontally, vertically, or diagonally, on a 6x7 grid.

## Heuristic Functions

The game uses different heuristic functions to evaluate the state of the game board and help determine the best move for the first player (`'x'`). The heuristic values return a score for a given board position, guiding the AI in making decisions.

### Return Values:
- `-1000` : The first player (`'x'`) is certain to lose.
- `-100` : The first player (`'x'`) has a high chance of losing.
- `1000` : The first player (`'x'`) is certain to win.
- `100` : The first player (`'x'`) has a high chance of winning.
- `0` : Neutral position (no clear advantage).

### Heuristic Functions:

#### h0: Random
- The evaluation is random.

#### h1: Column Centering
- The score for the player depends on how centered the pieces are within the columns of the board.
- The score ranges from `0` to `96`, and the heuristic value is calculated as the difference between the score of `'x'` and the score of `'o'`. The result is between `96` and `-96`.
- The heuristic is greater than 0 if `'x'` is more centered than `'o'`.
- The heuristic is less than 0 if `'x'` is less centered than `'o'`.

```
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
1 2 3 4 3 2 1
```

#### h2: Opponent’s Centering
- The score for the player is based on how centered their opponent’s pieces are in both columns and rows. The value ranges from `0` to `-45`, and the heuristic value is calculated as the difference between the score of `'x'` and the score of `'o'`. The result is between `45` and `-45`.
- The heuristic is greater than 0 if `'x'` is less blocked than `'o'` (i.e., in a better position).
- The heuristic is less than 0 if `'x'` is more blocked than `'o'` (i.e., in a worse position).

```
0 1 2 3 2 1 0
1 2 3 4 3 2 1
2 3 4 5 4 3 2
2 3 4 5 4 3 2
1 2 3 4 3 2 1
0 1 2 3 2 1 0
```

#### h3: Three-in-a-Row Count
- The score for the player is determined by the number of three consecutive pieces they have on each row and column. The score ranges from `0` to `57`.
- The score is incremented by +3 for each new "line of 3" detected on a row or column.
- The heuristic value is calculated as the difference between the score of `'x'` and the score of `'o'`. The result is between `57` and `-57`.
- The heuristic is greater than 0 if `'x'` has more lines of 3 than `'o'`.
- The heuristic is less than 0 if `'o'` has more lines of 3 than `'x'`.

#### h4: Three-in-a-Row with Gaps
- Counts the number of "three-in-a-row" sequences where there is one empty space before or after the three connected pieces.
- (This differs from counting a "Connect 4" in one move.)

#### h5: Isolated Pieces
- The score for the player is related to the number of isolated pieces they have on the board. The score ranges from `0` to `42`.
- The heuristic value is calculated as the difference between the score of `'o'` and the score of `'x'`. The result is between `42` and `-42`.
- The heuristic is greater than 0 if `'x'` has fewer isolated pieces than `'o'`.
- The heuristic is less than 0 if `'o'` has fewer isolated pieces than `'x'`.

#### h6: Potential Power-4 Zones (Not Implemented)
- This heuristic counts the number of zones where a **Connect 4** is possible with 0, 1, 2, or 3 pieces already in place.
- (This function is explained in the presentation but was not implemented due to time constraints.)

## How to Run the Game

1. Clone or download the repository.
2. Load the Prolog file containing the game logic.
3. Run the game by starting the Prolog interpreter and calling the relevant predicates to start a game session.

## Requirements
- **Prolog** (e.g., SWI-Prolog)
