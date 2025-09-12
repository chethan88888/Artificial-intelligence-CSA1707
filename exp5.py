from collections import deque

# Check if state is valid
def is_valid(m, c):
    return (0 <= m <= 3) and (0 <= c <= 3) and (m == 0 or m >= c) and ((3 - m) == 0 or (3 - m) >= (3 - c))

# BFS to solve problem
def missionaries_cannibals():
    start = (3, 3, 1)  # (missionaries, cannibals, boat side -> 1:left, 0:right)
    goal = (0, 0, 0)
    queue = deque([(start, [])])
    visited = set([start])

    while queue:
        (m, c, b), path = queue.popleft()

        if (m, c, b) == goal:
            return path + [(m, c, b)]

        moves = []
        if b == 1:  # boat on left
            moves = [(-1, 0), (-2, 0), (0, -1), (0, -2), (-1, -1)]
        else:  # boat on right
            moves = [(1, 0), (2, 0), (0, 1), (0, 2), (1, 1)]

        for dm, dc in moves:
            new_state = (m + dm, c + dc, 1 - b)
            if is_valid(new_state[0], new_state[1]) and new_state not in visited:
                visited.add(new_state)
                queue.append((new_state, path + [(m, c, b)]))
    return None

# Run the program
solution = missionaries_cannibals()
if solution:
    print("Solution Path:")
    for state in solution:
        print(state)
else:
    print("No solution found.")
