from itertools import permutations

def calculate_total_distance(route, distance_matrix):
    total_distance = 0
    num_cities = len(route)
    
    for i in range(num_cities - 1):
        total_distance += distance_matrix[route[i]][route[i+1]]
    total_distance += distance_matrix[route[-1]][route[0]]  # Return to the start city
    
    return total_distance

def traveling_salesman_brute_force(distance_matrix):
    num_cities = len(distance_matrix)
    cities = list(range(num_cities))
    min_route = None
    min_distance = float('inf')
    
    for perm in permutations(cities):
        current_distance = calculate_total_distance(perm, distance_matrix)
        if current_distance < min_distance:
            min_distance = current_distance
            min_route = perm
    
    return min_route, min_distance

if __name__ == "__main__":
    # Example distance matrix (symmetric)
    distance_matrix = [
        [0, 10, 15, 20],
        [10, 0, 35, 25],
        [15, 35, 0, 30],
        [20, 25, 30, 0]
    ]
    
    route, distance = traveling_salesman_brute_force(distance_matrix)
    
    print("Optimal route:", route)
    print("Minimal distance:", distance)
