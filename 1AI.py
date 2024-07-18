import heapq

class Puzzle:
    def __init__(self, board, goal, moves=0):
        self.board = board
        self.goal = goal
        self.moves = moves
        self.priority = self.moves + self.manhattan()

    def manhattan(self):
        distance = 0
        for i in range(3):
            for j in range(3):
                if self.board[i][j] != 0:
                    x, y = divmod(self.board[i][j] - 1, 3)
                    distance += abs(x - i) + abs(y - j)
        return distance

    def is_goal(self):
        return self.board == self.goal

    def find_blank_space(self):
        for i in range(3):
            for j in range(3):
                if self.board[i][j] == 0:
                    return i, j

    def generate_successors(self):
        successors = []
        x, y = self.find_blank_space()
        directions = [(x - 1, y), (x + 1, y), (x, y - 1), (x, y + 1)]
        
        for dx, dy in directions:
            if 0 <= dx < 3 and 0 <= dy < 3:
                new_board = [row[:] for row in self.board]
                new_board[x][y], new_board[dx][dy] = new_board[dx][dy], new_board[x][y]
                successors.append(Puzzle(new_board, self.goal, self.moves + 1))
        return successors

    def __lt__(self, other):
        return self.priority < other.priority

def solve_puzzle(start, goal):
    open_list = []
    heapq.heappush(open_list, Puzzle(start, goal))
    closed_set = set()
    
    while open_list:
        current = heapq.heappop(open_list)
        
        if current.is_goal():
            return current.moves
        
        closed_set.add(tuple(map(tuple, current.board)))
        
        for successor in current.generate_successors():
            if tuple(map(tuple, successor.board)) not in closed_set:
                heapq.heappush(open_list, successor)
    return -1

start = [
    [1, 2, 3],
    [4, 0, 5],
    [6, 7, 8]
]

goal = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 0]
]

if __name__ == "__main__":
    moves = solve_puzzle(start, goal)
    print(f"Number of moves required to solve the puzzle: {moves}")
