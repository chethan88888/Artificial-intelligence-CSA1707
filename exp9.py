import itertools

def travelling_salesman(distance_matrix, start=0):
    cities = list(range(len(distance_matrix)))
    min_path = None
    min_cost = float('inf')

    # Generate all possible paths (permutations) excluding start
    for perm in itertools.permutations(cities):
        if perm[0] == start:  # Fix starting city
            cost = 0
            for i in range(len(perm) - 1):
                cost += distance_matrix[perm[i]][perm[i+1]]
            cost += distance_matrix[perm[-1]][start]  # Return to start

            if cost < min_cost:
                min_cost = cost
                min_path = perm + (start,)

    return min_path, min_cost

# Example distance matrix (4 cities)
distance_matrix = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
]

path, cost = travelling_salesman(distance_matrix)
print("Optimal Path:", path)
print("Minimum Cost:", cost)
