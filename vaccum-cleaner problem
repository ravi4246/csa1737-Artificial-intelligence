from collections import deque

class State:
    def __init__(self, grid, vacuum_position, cleaned_rooms):
        self.grid = grid
        self.vacuum_position = vacuum_position
        self.cleaned_rooms = cleaned_rooms
        self.parent = None

    def is_goal(self):
        return all(room == 'C' for row in self.grid for room in row)

    def get_successors(self):
        successors = []
        x, y = self.vacuum_position
        rows = len(self.grid)
        cols = len(self.grid[0])

        moves = [(-1, 0), (1, 0), (0, -1), (0, 1)]  # up, down, left, right

        for dx, dy in moves:
            nx, ny = x + dx, y + dy
            if 0 <= nx < rows and 0 <= ny < cols:
                new_grid = [row[:] for row in self.grid]
                if new_grid[nx][ny] == 'D':  # Clean dirty room
                    new_grid[nx][ny] = 'C'
                new_state = State(new_grid, (nx, ny), self.cleaned_rooms | {(nx, ny)})
                new_state.parent = self
                successors.append(new_state)

        return successors

    def __eq__(self, other):
        return self.grid == other.grid and self.vacuum_position == other.vacuum_position

    def __hash__(self):
        return hash((tuple(tuple(row) for row in self.grid), self.vacuum_position))

def bfs(start):
    if start.is_goal():
        return start

    frontier = deque([start])
    explored = set()

    while frontier:
        state = frontier.popleft()
        if state.is_goal():
            return state

        explored.add(state)

        for successor in state.get_successors():
            if successor not in explored and successor not in frontier:
                frontier.append(successor)

    return None

def print_solution(solution):
    path = []
    state = solution
    while state:
        path.append(state)
        state = state.parent
    for t in path[::-1]:
        print(f"Vacuum at {t.vacuum_position}")
        for row in t.grid:
            print(" ".join(row))
        print()

if __name__ == "__main__":
    # Define the initial grid
    initial_grid = [
        ['D', 'D', 'D'],
        ['D', 'C', 'D'],
        ['D', 'D', 'D']
    ]
    initial_vacuum_position = (1, 1)  # Start at the center of the grid
    initial_cleaned_rooms = set()

    start_state = State(initial_grid, initial_vacuum_position, initial_cleaned_rooms)
    solution = bfs(start_state)

    if solution:
        print("Solution found!")
        print_solution(solution)
    else:
        print("No solution exists.")
