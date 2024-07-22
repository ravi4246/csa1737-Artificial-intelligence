# Define the graph (map) as a dictionary
graph = {
    'A': ['B', 'C', 'D'],
    'B': ['A', 'C', 'E'],
    'C': ['A', 'B', 'D', 'E'],
    'D': ['A', 'C', 'E'],
    'E': ['B', 'C', 'D']
}

# Define the colors available
colors = ['Red', 'Green', 'Blue']

def is_valid(graph, node, color_assignment, color):
    for neighbor in graph[node]:
        if color_assignment.get(neighbor) == color:
            return False
    return True

def map_coloring(graph, colors, color_assignment, node_index=0):
    if node_index == len(graph):
        return color_assignment

    nodes = list(graph.keys())
    node = nodes[node_index]

    for color in colors:
        if is_valid(graph, node, color_assignment, color):
            color_assignment[node] = color
            result = map_coloring(graph, colors, color_assignment, node_index + 1)
            if result:
                return result
            color_assignment.pop(node)

    return None

if __name__ == "__main__":
    color_assignment = {}
    result = map_coloring(graph, colors, color_assignment)
    
    if result:
        print("Solution found:")
        for node in result:
            print(f"Node {node} -> Color {result[node]}")
    else:
        print("No solution found.")
