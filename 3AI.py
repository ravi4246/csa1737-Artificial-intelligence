from collections import deque

def is_valid_state(state, a, b):
    return 0 <= state[0] <= a and 0 <= state[1] <= b

def get_successors(state, a, b):
    successors = []
    x, y = state
    
    # Fill Jug A
    successors.append((a, y))
    
    # Fill Jug B
    successors.append((x, b))
    
    # Empty Jug A
    successors.append((0, y))
    
    # Empty Jug B
    successors.append((x, 0))
    
    # Pour water from Jug A to Jug B until Jug B is full or Jug A is empty
    pour_to_b = min(x, b - y)
    successors.append((x - pour_to_b, y + pour_to_b))
    
    # Pour water from Jug B to Jug A until Jug A is full or Jug B is empty
    pour_to_a = min(y, a - x)
    successors.append((x + pour_to_a, y - pour_to_a))
    
    return successors

def bfs(a, b, d):
    initial_state = (0, 0)
    queue = deque([(initial_state, [])])
    visited = set()
    
    while queue:
        (current_state, path) = queue.popleft()
        
        if current_state in visited:
            continue
        
        visited.add(current_state)
        
        x, y = current_state
        
        # Check if we have reached the goal
        if x == d or y == d:
            return path + [current_state]
        
        for successor in get_successors(current_state, a, b):
            if is_valid_state(successor, a, b):
                queue.append((successor, path + [current_state]))
    
    return None

def solve_water_jug_problem(a, b, d):
    solution = bfs(a, b, d)
    
    if solution:
        print("Solution found:")
        for step in solution:
            print(step)
    else:
        print("No solution exists")

if __name__ == "__main__":
    a = 4  # Capacity of Jug A
    b = 3  # Capacity of Jug B
    d = 2  # Desired amount of water
    
    solve_water_jug_problem(a, b, d)
