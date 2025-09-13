import math

def evaluate(board):
    # Check rows
    for row in board:
        if row.count("X") == 3: return +10
        if row.count("O") == 3: return -10
    # Check columns
    for col in range(3):
        if board[0][col] == board[1][col] == board[2][col] == "X": return +10
        if board[0][col] == board[1][col] == board[2][col] == "O": return -10
    # Check diagonals
    if board[0][0] == board[1][1] == board[2][2] == "X" or \
       board[0][2] == board[1][1] == board[2][0] == "X": return +10
    if board[0][0] == board[1][1] == board[2][2] == "O" or \
       board[0][2] == board[1][1] == board[2][0] == "O": return -10
    return 0

def is_moves_left(board):
    return any(" " in row for row in board)

def alphabeta(board, depth, alpha, beta, isMaximizing):
    score = evaluate(board)
    if score == 10: return score - depth
    if score == -10: return score + depth
    if not is_moves_left(board): return 0

    if isMaximizing:
        best = -math.inf
        for i in range(3):
            for j in range(3):
                if board[i][j] == " ":
                    board[i][j] = "X"
                    val = alphabeta(board, depth+1, alpha, beta, False)
                    board[i][j] = " "
                    best = max(best, val)
                    alpha = max(alpha, best)
                    if beta <= alpha:
                        break  # prune
        return best
    else:
        best = math.inf
        for i in range(3):
            for j in range(3):
                if board[i][j] == " ":
                    board[i][j] = "O"
                    val = alphabeta(board, depth+1, alpha, beta, True)
                    board[i][j] = " "
                    best = min(best, val)
                    beta = min(beta, best)
                    if beta <= alpha:
                        break  # prune
        return best

def find_best_move(board):
    best_val = -math.inf
    best_move = (-1, -1)
    alpha, beta = -math.inf, math.inf

    for i in range(3):
        for j in range(3):
            if board[i][j] == " ":
                board[i][j] = "X"
                move_val = alphabeta(board, 0, alpha, beta, False)
                board[i][j] = " "
                if move_val > best_val:
                    best_move = (i, j)
                    best_val = move_val
    return best_move

# Example board
board = [
    ["X", "O", "X"],
    ["O", "O", " "],
    [" ", " ", " "]
]

print("Best Move for AI is:", find_best_move(board))
