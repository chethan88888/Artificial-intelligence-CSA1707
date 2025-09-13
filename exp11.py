# Define map (graph) with neighbors
graph = {
    "A": ["B", "C"],
    "B": ["A", "C", "D"],
    "C": ["A", "B", "D", "E"],
    "D": ["B", "C", "E"],
    "E": ["C", "D"]
}

# Available colors
colors = ["Red", "Green", "Blue"]

# Assign colors using backtracking
def is_valid(node, color, assignment):
    for neighbor in graph[node]:
        if neighbor in assignment and assignment[neighbor] == color:
            return False
    return True

def backtrack(assignment):
    if len(assignment) == len(graph):
        return assignment

    # Select unassigned region
    node = [n for n in graph if n not in assignment][0]

    for color in colors:
        if is_valid(node, color, assignment):
            assignment[node] = color
            result = backtrack(assignment)
            if result:
                return result
            assignment.pop(node)
    return None

solution = backtrack({})
print("Map Coloring Solution:")
print(solution)
