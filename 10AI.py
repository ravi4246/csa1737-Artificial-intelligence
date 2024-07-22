import heapq

class Node:
    def __init__(self, name, heuristic):
        self.name = name
        self.heuristic = heuristic
        self.adjacencies = []

    def __lt__(self, other):
        return self.heuristic < other.heuristic

class Edge:
    def __init__(self, target_node, weight):
        self.target_node = target_node
        self.weight = weight

def a_star(start_node, goal_node):
    open_set = []
    heapq.heappush(open_set, (0, start_node))
    came_from = {}
    g_score = {start_node: 0}
    f_score = {start_node: start_node.heuristic}

    while open_set:
        current = heapq.heappop(open_set)[1]
        
        if current == goal_node:
            return reconstruct_path(came_from, current)
        
        for edge in current.adjacencies:
            neighbor = edge.target_node
            tentative_g_score = g_score[current] + edge.weight
            
            if tentative_g_score < g_score.get(neighbor, float('inf')):
                came_from[neighbor] = current
                g_score[neighbor] = tentative_g_score
                f_score[neighbor] = tentative_g_score + neighbor.heuristic
                if neighbor not in open_set:
                    heapq.heappush(open_set, (f_score[neighbor], neighbor))
    
    return None

def reconstruct_path(came_from, current):
    total_path = [current]
    while current in came_from:
        current = came_from[current]
        total_path.append(current)
    return total_path[::-1]

if __name__ == "__main__":
    # Create nodes with heuristic values
    a = Node('A', 6)
    b = Node('B', 4)
    c = Node('C', 4)
    d = Node('D', 2)
    e = Node('E', 0)
    f = Node('F', 4)
    g = Node('G', 0)
    
    # Create edges (graph connections) with weights
    a.adjacencies = [Edge(b, 1), Edge(c, 4)]
    b.adjacencies = [Edge(d, 2), Edge(e, 5)]
    c.adjacencies = [Edge(f, 3)]
    d.adjacencies = [Edge(g, 3)]
    e.adjacencies = []
    f.adjacencies = [Edge(g, 1)]
    g.adjacencies = []

    start = a
    goal = g
    
    path = a_star(start, goal)
    
    if path:
        print("Path found:", " -> ".join(node.name for node in path))
    else:
        print("No path found.")
