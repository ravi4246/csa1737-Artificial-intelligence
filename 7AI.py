from collections import deque

def bfs(graph, start):
    # Create a queue for BFS and a set to keep track of visited nodes
    queue = deque([start])
    visited = set([start])
    
    # Loop until the queue is empty
    while queue:
        # Dequeue a vertex from the queue
        vertex = queue.popleft()
        print(vertex, end=" ")
        
        # Get all adjacent vertices of the dequeued vertex
        # If an adjacent vertex has not been visited, mark it as visited and enqueue it
        for neighbor in graph[vertex]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

if __name__ == "__main__":
    # Example graph represented as an adjacency list
    graph = {
        'A': ['B', 'C'],
        'B': ['D', 'E'],
        'C': ['F', 'G'],
        'D': [],
        'E': ['H'],
        'F': [],
        'G': [],
        'H': []
    }
    
    # Starting node
    start_node = 'A'
    
    print("Breadth-First Search starting from node", start_node)
    bfs(graph, start_node)
