
---

# ➕ Problem: Surrounded Regions

## 📘 Problem Statement

> Given a 2D board containing `'X'` and `'O'` (the letter O), capture all regions surrounded by `'X'`.  
> A region is captured by flipping all `'O'`s into `'X'`s in that surrounded region.  
> The border `'O'`s (those on the edge of the board) are not captured, as well as any `'O'`s connected to a border `'O'` (such as those in the middle of the board that are not surrounded by `'X'`s).

**LeetCode Link:** [130. Surrounded Regions](https://leetcode.com/problems/surrounded-regions/)

---

```
Example 1:

Input:
board = [
  ['X', 'X', 'X', 'X'],
  ['X', 'O', 'O', 'X'],
  ['X', 'X', 'O', 'X'],
  ['X', 'O', 'X', 'X']
]
Output:
[
  ['X', 'X', 'X', 'X'],
  ['X', 'X', 'X', 'X'],
  ['X', 'X', 'X', 'X'],
  ['X', 'O', 'X', 'X']
]

Example 2:

Input:
board = [
  ['X', 'X', 'X', 'X'],
  ['X', 'O', 'X', 'X'],
  ['X', 'X', 'O', 'X'],
  ['X', 'O', 'X', 'X']
]
Output:
[
  ['X', 'X', 'X', 'X'],
  ['X', 'O', 'X', 'X'],
  ['X', 'X', 'O', 'X'],
  ['X', 'O', 'X', 'X']
]
```

---

## ✅ Constraints

- `m == board.length`
- `n == board[i].length`
- `1 <= m, n <= 200`
- `board[i][j]` is `'X'` or `'O'`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: DFS for Border 'O' Regions

**Approach:**  
First, traverse the borders of the board, and for each `'O'`, perform a DFS to mark all connected `'O'`s as safe. Then, iterate through the board and convert all remaining `'O'`s to `'X'`, and all the marked `'O'`s back to `'O'`.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns
# Space Complexity: O(m * n) for the recursion stack
def solve(board):
    if not board:
        return
    
    def dfs(i, j):
        if i < 0 or i >= len(board) or j < 0 or j >= len(board[0]) or board[i][j] != 'O':
            return
        board[i][j] = 'S'  # Mark this 'O' as safe
        dfs(i + 1, j)
        dfs(i - 1, j)
        dfs(i, j + 1)
        dfs(i, j - 1)
    
    # Perform DFS on the border rows and columns
    for i in range(len(board)):
        for j in range(len(board[0])):
            if (i == 0 or i == len(board) - 1 or j == 0 or j == len(board[0]) - 1) and board[i][j] == 'O':
                dfs(i, j)
    
    # Convert remaining 'O' to 'X' and 'S' (safe) back to 'O'
    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j] == 'O':
                board[i][j] = 'X'
            elif board[i][j] == 'S':
                board[i][j] = 'O'
```

---

### ⚙️ Level 2: BFS for Border 'O' Regions

**Approach:**  
Similar to the DFS approach, use BFS to traverse the borders and mark connected `'O'`s. Then, traverse the entire board to flip surrounded `'O'`s to `'X'`, while marking border-connected `'O'`s back to `'O'`.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) for the queue
from collections import deque

def solve(board):
    if not board:
        return
    
    def bfs(i, j):
        queue = deque([(i, j)])
        board[i][j] = 'S'  # Mark this 'O' as safe
        while queue:
            x, y = queue.popleft()
            for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < len(board) and 0 <= ny < len(board[0]) and board[nx][ny] == 'O':
                    board[nx][ny] = 'S'
                    queue.append((nx, ny))
    
    # Perform BFS on the border rows and columns
    for i in range(len(board)):
        for j in range(len(board[0])):
            if (i == 0 or i == len(board) - 1 or j == 0 or j == len(board[0]) - 1) and board[i][j] == 'O':
                bfs(i, j)
    
    # Convert remaining 'O' to 'X' and 'S' (safe) back to 'O'
    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j] == 'O':
                board[i][j] = 'X'
            elif board[i][j] == 'S':
                board[i][j] = 'O'
```

---

### 🚀 Level 3: Optimized DFS (In-place Marking)

**Approach:**  
This is an optimized DFS approach where we mark the safe `'O'`s as `'S'` during the DFS traversal, and after the traversal, we only need one pass to convert `'O'`s to `'X'` and `'S'` back to `'O'`.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) for recursion stack
def solve(board):
    if not board:
        return
    
    def dfs(i, j):
        if i < 0 or i >= len(board) or j < 0 or j >= len(board[0]) or board[i][j] != 'O':
            return
        board[i][j] = 'S'  # Mark 'O' as safe
        dfs(i + 1, j)
        dfs(i - 1, j)
        dfs(i, j + 1)
        dfs(i, j - 1)
    
    # Perform DFS from the borders
    for i in range(len(board)):
        for j in range(len(board[0])):
            if (i == 0 or i == len(board) - 1 or j == 0 or j == len(board[0]) - 1) and board[i][j] == 'O':
                dfs(i, j)
    
    # Final pass to change 'O' to 'X' and 'S' back to 'O'
    for i in range(len(board)):
        for j in range(len(board[0])):
            if board[i][j] == 'O':
                board[i][j] = 'X'
            elif board[i][j] == 'S':
                board[i][j] = 'O'
```

---

## 🔗 Similar Problems

1. [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
2. [463. Island Perimeter](https://leetcode.com/problems/island-perimeter/)
3. [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | DFS (Recursive)                      | O(m * n)        | O(m * n)         |
| 2     | BFS (Queue-based)                    | O(m * n)        | O(m * n)         |
| 3     | Optimized DFS (In-place Marking)     | O(m * n)        | O(m * n)         |

---

## 📌 Takeaway Points

- Use **DFS** or **BFS** for traversal when dealing with problems on grids.
- **DFS** is easier to implement recursively, but the **BFS** approach may be better in avoiding stack overflow in large grids.
- In problems like this, it's critical to **mark border-connected components** to prevent them from being mistakenly flipped.

---
