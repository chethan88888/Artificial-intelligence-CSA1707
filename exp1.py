from collections import deque

# Goal state we want to reach
goal = "123456780"   # 0 = empty space

# Possible moves of empty tile
moves = {
    0: [1,3],    1: [0,2,4],    2: [1,5],
    3: [0,4,6],  4: [1,3,5,7],  5: [2,4,8],
    6: [3,7],    7: [4,6,8],    8: [5,7]
}

def solve(start):
    q = deque()
    q.append((start, [start]))  # (current_state, path)
    visited = {start}

    while q:
        state, path = q.popleft()
        if state == goal:   # Final state found
            return path

        zero = state.index("0")   # find empty space
        for m in moves[zero]:     # possible swaps
            new_state = list(state)
            new_state[zero], new_state[m] = new_state[m], new_state[zero]
            new_state = "".join(new_state)

            if new_state not in visited:
                visited.add(new_state)
                q.append((new_state, path+[new_state]))

    return None  # no solution

# Example shuffled puzzle
start = "125340678"  # any shuffle
solution = solve(start)

print("Steps to solve 8 Puzzle:")
for s in solution:
    for i in range(0,9,3):
        print(s[i:i+3])
    print()
print("Final state reached!")
