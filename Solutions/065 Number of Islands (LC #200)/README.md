
---

# ➕ Problem: Number of Islands

## 📘 Problem Statement

> Given a 2D grid of characters `'1'` (land) and `'0'` (water), count the number of islands.  
> An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically.  
> You may assume all four edges of the grid are surrounded by water.

**LeetCode Link:** [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

---

```
Example 1:

Input:
grid = [
  ['1','1','1','1','0'],
  ['1','1','0','1','0'],
  ['1','1','0','0','0'],
  ['0','0','0','0','0']
]
Output: 1

Example 2:

Input:
grid = [
  ['1','1','0','0','0'],
  ['1','1','0','0','0'],
  ['0','0','1','0','0'],
  ['0','0','0','1','1']
]
Output: 3
```

---

## ✅ Constraints

- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 300`
- `grid[i][j]` is `'0'` or `'1'`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: DFS (Depth-First Search)

**Approach:**  
Use depth-first search to explore and mark all connected `'1'`s (land) starting from each unvisited land cell. Each time an unvisited `'1'` is found, increment the island count and mark all connected land cells as visited.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns
# Space Complexity: O(m * n) for the recursion stack or visited set
def numIslands(grid):
    def dfs(i, j):
        if i < 0 or i >= len(grid) or j < 0 or j >= len(grid[0]) or grid[i][j] == '0':
            return
        grid[i][j] = '0'  # Mark the cell as visited
        dfs(i + 1, j)
        dfs(i - 1, j)
        dfs(i, j + 1)
        dfs(i, j - 1)
    
    if not grid:
        return 0
    
    count = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == '1':  # Start DFS for each unvisited land cell
                dfs(i, j)
                count += 1
    
    return count
```

---

### ⚙️ Level 2: BFS (Breadth-First Search)

**Approach:**  
Use breadth-first search to explore each island. Start from an unvisited land cell, and mark all connected land cells as visited.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) for the queue
from collections import deque

def numIslands(grid):
    if not grid:
        return 0
    
    def bfs(i, j):
        queue = deque([(i, j)])
        grid[i][j] = '0'  # Mark the cell as visited
        while queue:
            x, y = queue.popleft()
            for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < len(grid) and 0 <= ny < len(grid[0]) and grid[nx][ny] == '1':
                    grid[nx][ny] = '0'  # Mark as visited
                    queue.append((nx, ny))
    
    count = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == '1':  # Start BFS for each unvisited land cell
                bfs(i, j)
                count += 1
    
    return count
```

---

### 🚀 Level 3: Optimized BFS (Using the Queue and Avoiding Redundant Checks)

**Approach:**  
Optimized BFS by using a queue, reducing the space complexity to O(m * n) for the queue and making sure to mark all connected land cells only once.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) for the queue and visited cells
from collections import deque

def numIslands(grid):
    if not grid:
        return 0
    
    def bfs(i, j):
        queue = deque([(i, j)])
        grid[i][j] = '0'  # Mark the cell as visited
        while queue:
            x, y = queue.popleft()
            for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < len(grid) and 0 <= ny < len(grid[0]) and grid[nx][ny] == '1':
                    grid[nx][ny] = '0'  # Mark as visited
                    queue.append((nx, ny))

    count = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == '1':  # Start BFS for each unvisited land cell
                bfs(i, j)
                count += 1
    
    return count
```

---

## 🔗 Similar Problems

1. [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
2. [463. Island Perimeter](https://leetcode.com/problems/island-perimeter/)
3. [130. Surrounded Regions](https://leetcode.com/problems/surrounded-regions/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|---------------------------------|-----------------|------------------|
| 1     | DFS (Recursive)                 | O(m * n)        | O(m * n)         |
| 2     | BFS (Queue-based)               | O(m * n)        | O(m * n)         |
| 3     | Optimized BFS                   | O(m * n)        | O(m * n)         |

---

## 📌 Takeaway Points

- **DFS and BFS** are both effective for graph traversal problems like this one.
- **Recursive DFS** is easier to implement but can run into stack overflow issues for large grids.
- **BFS** is a more robust solution when we want to avoid deep recursion and can use a queue to explore nodes iteratively.

---
