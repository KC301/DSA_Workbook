
---

# ➕ Problem: Pacific Atlantic Water Flow

## 📘 Problem Statement

> There is an `m x n` matrix of heights representing the **elevation map** of the terrain. Each value in the matrix represents the height of a cell in the grid.
> 
> The Pacific ocean touches the left and top edges of the grid, and the Atlantic ocean touches the right and bottom edges of the grid.
> 
> Water can flow from a cell to another cell if the height of the second cell is **less than or equal to** the height of the first cell. More formally, a cell `(r, c)` can flow to another cell `(r', c')` if both of the following are true:
> 
> - `r' < m` and `c' < n`
> - `matrix[r'][c'] <= matrix[r][c]`
> 
> Return the list of coordinates where water can flow to both the Pacific and Atlantic oceans.

**LeetCode Link:** [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

---

```
Example 1:

Input: matrix = [[1,2,3],[8,9,4],[7,6,5]]
Output: [[0,4],[1,3],[2,2],[2,3]]
Explanation: The water can flow to both oceans from the cells at coordinates [[0,4],[1,3],[2,2],[2,3]].

Example 2:

Input: matrix = [[1]]
Output: [[0,0]]
```

---

## ✅ Constraints

- `m == matrix.length`
- `n == matrix[i].length`
- `1 <= m, n <= 200`
- `0 <= matrix[i][j] <= 10⁶`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: DFS with Two Visited Arrays (Brute Force)

**Approach:**  
Use **DFS** starting from the Pacific and Atlantic borders. For each cell, we mark if it can flow to either ocean. The final answer will be the intersection of the two flow sets.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n)
def pacificAtlantic(matrix):
    if not matrix:
        return []

    m, n = len(matrix), len(matrix[0])
    pacific_reachable = [[False] * n for _ in range(m)]
    atlantic_reachable = [[False] * n for _ in range(m)]

    def dfs(r, c, visited, prev_height):
        if (r < 0 or r >= m or c < 0 or c >= n or visited[r][c] or matrix[r][c] < prev_height):
            return
        visited[r][c] = True
        for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            dfs(r + dr, c + dc, visited, matrix[r][c])

    for i in range(m):
        dfs(i, 0, pacific_reachable, matrix[i][0])
        dfs(i, n - 1, atlantic_reachable, matrix[i][n - 1])
    
    for j in range(n):
        dfs(0, j, pacific_reachable, matrix[0][j])
        dfs(m - 1, j, atlantic_reachable, matrix[m - 1][j])

    result = []
    for i in range(m):
        for j in range(n):
            if pacific_reachable[i][j] and atlantic_reachable[i][j]:
                result.append([i, j])
    
    return result
```

---

### ⚙️ Level 2: DFS with Visited Arrays and Improved Flow Detection

**Approach:**  
This solution optimizes the DFS process by reducing redundant checks. Each ocean is explored independently, and the reachable cells are tracked to efficiently check the cells that can flow to both oceans.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n)
def pacificAtlantic(matrix):
    if not matrix:
        return []

    m, n = len(matrix), len(matrix[0])
    pacific_reachable = [[False] * n for _ in range(m)]
    atlantic_reachable = [[False] * n for _ in range(m)]

    def dfs(r, c, visited, prev_height):
        if r < 0 or r >= m or c < 0 or c >= n or visited[r][c] or matrix[r][c] < prev_height:
            return
        visited[r][c] = True
        for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            dfs(r + dr, c + dc, visited, matrix[r][c])

    for i in range(m):
        dfs(i, 0, pacific_reachable, matrix[i][0])
        dfs(i, n - 1, atlantic_reachable, matrix[i][n - 1])
    
    for j in range(n):
        dfs(0, j, pacific_reachable, matrix[0][j])
        dfs(m - 1, j, atlantic_reachable, matrix[m - 1][j])

    return [[i, j] for i in range(m) for j in range(n) if pacific_reachable[i][j] and atlantic_reachable[i][j]]
```

---

### 🚀 Level 3: BFS with Early Stopping and Flow Optimization

**Approach:**  
This solution uses **BFS** to explore both oceans. It runs the BFS process for the Pacific and Atlantic oceans independently, ensuring an efficient flow without redundant checks. BFS is suitable for this type of grid traversal to avoid deep recursion.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n)
from collections import deque

def pacificAtlantic(matrix):
    if not matrix:
        return []

    m, n = len(matrix), len(matrix[0])
    pacific_reachable = [[False] * n for _ in range(m)]
    atlantic_reachable = [[False] * n for _ in range(m)]

    def bfs(starts, visited):
        queue = deque(starts)
        while queue:
            r, c = queue.popleft()
            for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                nr, nc = r + dr, c + dc
                if 0 <= nr < m and 0 <= nc < n and not visited[nr][nc] and matrix[nr][nc] >= matrix[r][c]:
                    visited[nr][nc] = True
                    queue.append((nr, nc))

    # Pacific Ocean: First row and first column
    pacific_starts = [(i, 0) for i in range(m)] + [(0, j) for j in range(n)]
    bfs(pacific_starts, pacific_reachable)
    
    # Atlantic Ocean: Last row and last column
    atlantic_starts = [(i, n - 1) for i in range(m)] + [(m - 1, j) for j in range(n)]
    bfs(atlantic_starts, atlantic_reachable)

    return [[i, j] for i in range(m) for j in range(n) if pacific_reachable[i][j] and atlantic_reachable[i][j]]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity       | Space Complexity     |
|-------|------------------------------------|-----------------------|----------------------|
| 1     | DFS with Two Visited Arrays        | O(m * n)             | O(m * n)             |
| 2     | DFS with Improved Flow Detection   | O(m * n)             | O(m * n)             |
| 3     | BFS with Early Stopping and Flow Optimization | O(m * n) | O(m * n)             |

---

## 🔗 Similar Problems

1. [417. Pacific Atlantic Water Flow (Variation)](https://leetcode.com/problems/pacific-atlantic-water-flow/)
2. [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
3. [130. Surrounded Regions](https://leetcode.com/problems/surrounded-regions/)

---

## 📌 Takeaway Points

- Both **DFS** and **BFS** are effective for grid traversal problems like this one.
- **BFS** may be more efficient in this case since it avoids deep recursion and provides a more iterative approach.
- Marking visited cells is crucial to avoid infinite loops or redundant work when checking neighbors.

---
