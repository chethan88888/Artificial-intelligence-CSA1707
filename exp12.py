# Tic Tac Toe - 3x3 playable game (two players)
def print_board(board):
    print("    1   2   3")
    print("  -------------")
    for i, row in enumerate(board, start=1):
        print(f"{i} | {' | '.join(row)} |")
        print("  -------------")

def check_winner(board, player):
    # rows
    for r in range(3):
        if all(board[r][c] == player for c in range(3)):
            return True
    # columns
    for c in range(3):
        if all(board[r][c] == player for r in range(3)):
            return True
    # diagonals
    if all(board[i][i] == player for i in range(3)):
        return True
    if all(board[i][2 - i] == player for i in range(3)):
        return True
    return False

def board_full(board):
    return all(board[r][c] != " " for r in range(3) for c in range(3))

def get_move(player, board):
    while True:
        try:
            raw = input(f"Player {player} - enter row and column (e.g. 2 3): ").strip()
            if raw.lower() in ("q", "quit", "exit"):
                return None  # signal to quit
            parts = raw.split()
            if len(parts) != 2:
                print("Enter two numbers separated by space (row col).")
                continue
            row, col = int(parts[0]), int(parts[1])
            if not (1 <= row <= 3 and 1 <= col <= 3):
                print("Row and column must be between 1 and 3.")
                continue
            if board[row-1][col-1] != " ":
                print("Cell already taken. Choose another.")
                continue
            return (row-1, col-1)
        except ValueError:
            print("Invalid input. Use numbers like: 1 3")

def play_game():
    board = [[" " for _ in range(3)] for _ in range(3)]
    current = "X"
    print("Tic Tac Toe (3x3). Enter 'q' to quit anytime.\n")
    while True:
        print_board(board)
        move = get_move(current, board)
        if move is None:
            print("Game ended by user.")
            return
        r, c = move
        board[r][c] = current

        if check_winner(board, current):
            print_board(board)
            print(f"Player {current} wins! 🎉")
            return

        if board_full(board):
            print_board(board)
            print("It's a draw!")
            return

        current = "O" if current == "X" else "X"

if __name__ == "__main__":
    while True:
        play_game()
        again = input("Play again? (y/n): ").strip().lower()
        if again != "y":
            print("Thanks for playing!")
            break
