from collections import deque

class State:
    def __init__(self, missionaries, cannibals, boat, missionaries_right, cannibals_right):
        self.missionaries = missionaries
        self.cannibals = cannibals
        self.boat = boat
        self.missionaries_right = missionaries_right
        self.cannibals_right = cannibals_right
        self.parent = None

    def is_valid(self):
        # No negative values
        if self.missionaries < 0 or self.cannibals < 0 or self.missionaries_right < 0 or self.cannibals_right < 0:
            return False
        # Missionaries should not be outnumbered by cannibals on either bank
        if self.missionaries > 0 and self.missionaries < self.cannibals:
            return False
        if self.missionaries_right > 0 and self.missionaries_right < self.cannibals_right:
            return False
        return True

    def is_goal(self):
        return self.missionaries == 0 and self.cannibals == 0 and self.boat == 0

    def get_successors(self):
        successors = []
        if self.boat == 1:  # Boat is on the left bank
            new_states = [
                State(self.missionaries - 2, self.cannibals, 0, self.missionaries_right + 2, self.cannibals_right),
                State(self.missionaries, self.cannibals - 2, 0, self.missionaries_right, self.cannibals_right + 2),
                State(self.missionaries - 1, self.cannibals - 1, 0, self.missionaries_right + 1, self.cannibals_right + 1),
                State(self.missionaries - 1, self.cannibals, 0, self.missionaries_right + 1, self.cannibals_right),
                State(self.missionaries, self.cannibals - 1, 0, self.missionaries_right, self.cannibals_right + 1)
            ]
        else:  # Boat is on the right bank
            new_states = [
                State(self.missionaries + 2, self.cannibals, 1, self.missionaries_right - 2, self.cannibals_right),
                State(self.missionaries, self.cannibals + 2, 1, self.missionaries_right, self.cannibals_right - 2),
                State(self.missionaries + 1, self.cannibals + 1, 1, self.missionaries_right - 1, self.cannibals_right - 1),
                State(self.missionaries + 1, self.cannibals, 1, self.missionaries_right - 1, self.cannibals_right),
                State(self.missionaries, self.cannibals + 1, 1, self.missionaries_right, self.cannibals_right - 1)
            ]
        
        for state in new_states:
            if state.is_valid():
                state.parent = self
                successors.append(state)
        return successors

    def __eq__(self, other):
        return self.missionaries == other.missionaries and self.cannibals == other.cannibals and self.boat == other.boat and self.missionaries_right == other.missionaries_right and self.cannibals_right == other.cannibals_right

    def __hash__(self):
        return hash((self.missionaries, self.cannibals, self.boat, self.missionaries_right, self.cannibals_right))

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
        print(f"({t.missionaries}, {t.cannibals}, {t.boat}, {t.missionaries_right}, {t.cannibals_right})")

if __name__ == "__main__":
    start = State(3, 3, 1, 0, 0)
    solution = bfs(start)
    
    if solution:
        print("Solution found!")
        print_solution(solution)
    else:
        print("No solution exists.")
