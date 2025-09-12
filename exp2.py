N = 8
board = [[0]*N for _ in range(N)]
pos = [0,4,7,5,2,6,1,3]  # safe solution

for i in range(N):
    board[i][pos[i]] = 1

print("8 Queen Final State:")
for row in board:
    print(row)
