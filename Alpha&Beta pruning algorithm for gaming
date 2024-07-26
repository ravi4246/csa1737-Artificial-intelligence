import math

# Constants for the Tic-Tac-Toe game
X = 'X'
O = 'O'
EMPTY = None

# Function to evaluate the current board state
def evaluate(board):
    # Check rows, columns, and diagonals for a win
    for player in [X, O]:
        # Rows and columns
        for i in range(3):
            if board[i][0] == board[i][1] == board[i][2] == player:
                return 1 if player == X else -1
            if board[0][i] == board[1][i] == board[2][i] == player:
                return 1 if player == X else -1
        # Diagonals
        if board[0][0] == board[1][1] == board[2][2] == player:
            return 1 if player == X else -1
        if board[0][2] == board[1][1] == board[2][0] == player:
            return 1 if player == X else -1
    return 0  # No winner

# Function to check if the board is full
def is_full(board):
    for row in board:
        for cell in row:
            if cell == EMPTY:
                return False
    return True

# Function to generate all possible next moves
def generate_moves(board, player):
    moves = []
    for i in range(3):
        for j in range(3):
            if board[i][j] == EMPTY:
                new_board = [row[:] for row in board]  # Deep copy of the board
                new_board[i][j] = player
                moves.append((new_board, (i, j)))
    return moves

# Alpha-Beta pruning algorithm
def alpha_beta_pruning(board, depth, alpha, beta, maximizing_player):
    score = evaluate(board)
    
    if score != 0 or depth == 0 or is_full(board):
        return score
    
    if maximizing_player:
        max_eval = -math.inf
        for move, _ in generate_moves(board, X):
            eval = alpha_beta_pruning(move, depth - 1, alpha, beta, False)
            max_eval = max(max_eval, eval)
            alpha = max(alpha, eval)
            if beta <= alpha:
                break
        return max_eval
    else:
        min_eval = math.inf
        for move, _ in generate_moves(board, O):
            eval = alpha_beta_pruning(move, depth - 1, alpha, beta, True)
            min_eval = min(min_eval, eval)
            beta = min(beta, eval)
            if beta <= alpha:
                break
        return min_eval

# Function to find the best move using Alpha-Beta pruning
def find_best_move(board):
    best_move = None
    best_value = -math.inf
    
    for move, (row, col) in generate_moves(board, X):
        move_value = alpha_beta_pruning(move, 5, -math.inf, math.inf, False)  # Adjust depth as needed
        if move_value > best_value:
            best_value = move_value
            best_move = (row, col)
    
    return best_move

# Example usage
if __name__ == "__main__":
    board = [
        [X, EMPTY, O],
    [EMPTY, X, EMPTY],
    [O, EMPTY, EMPTY]
    ]
    
    # Suppose 'X' is playing
    best_move = find_best_move(board)
    print(f"Best move for 'X' is {best_move}")
