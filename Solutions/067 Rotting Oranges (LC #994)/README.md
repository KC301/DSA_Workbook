Here’s **LeetCode 994: Rotting Oranges** in your preferred format:

---

# ➕ Problem: Rotting Oranges

## 📘 Problem Statement

> You are given an `m x n` grid where each cell can have one of three values:
> - `0` representing an empty cell,
> - `1` representing a fresh orange,
> - `2` representing a rotten orange.
>
> Every minute, any fresh orange that is **4-directionally adjacent** to a rotten orange becomes rotten.
> Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return `-1`.

**LeetCode Link:** [994. Rotting Oranges](https://leetcode.com/problems/rotting-oranges/)

---

```
Example 1:

Input: grid = [
  [2,1,1],
  [1,1,0],
  [0,1,1]
]
Output: 4

Example 2:

Input: grid = [
  [2,1,1],
  [0,1,1],
  [1,0,1]
]
Output: -1

Example 3:

Input: grid = [
  [0,2]
]
Output: 0
```

---

## ✅ Constraints

- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 10⁴`
- `grid[i][j]` is `0`, `1`, or `2`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: BFS (Queue-Based) - Simple Approach

**Approach:**  
We perform a **multi-source BFS** from all the initially rotten oranges. We track the time (or minutes) it takes for the rotten oranges to spread to all the fresh ones. If any fresh orange is unreachable, return `-1`.

```python
# Time Complexity: O(m * n) 
# Space Complexity: O(m * n) for the queue
from collections import deque

def orangesRotting(grid):
    rows, cols = len(grid), len(grid[0])
    queue = deque()
    fresh_count = 0
    minutes = 0

    # Add all rotten oranges to the queue and count the fresh ones
    for i in range(rows):
        for j in range(cols):
            if grid[i][j] == 2:
                queue.append((i, j))
            elif grid[i][j] == 1:
                fresh_count += 1
    
    # Directions: right, down, left, up
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    while queue and fresh_count > 0:
        minutes += 1
        for _ in range(len(queue)):
            x, y = queue.popleft()
            for dx, dy in directions:
                nx, ny = x + dx, y + dy
                if 0 <= nx < rows and 0 <= ny < cols and grid[nx][ny] == 1:
                    grid[nx][ny] = 2
                    fresh_count -= 1
                    queue.append((nx, ny))
    
    return minutes if fresh_count == 0 else -1
```

---

### ⚙️ Level 2: Optimized BFS (Tracking Rotten Oranges)

**Approach:**  
We perform BFS but only increment the minute counter once per level of the BFS traversal, making sure to track the time accurately without re-checking already processed cells.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) for the queue
from collections import deque

def orangesRotting(grid):
    rows, cols = len(grid), len(grid[0])
    queue = deque()
    fresh_count = 0
    
    # Add rotten oranges to the queue and count fresh ones
    for i in range(rows):
        for j in range(cols):
            if grid[i][j] == 2:
                queue.append((i, j))
            elif grid[i][j] == 1:
                fresh_count += 1
    
    # Directions for 4-adjacency (right, down, left, up)
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    minutes = 0
    
    while queue and fresh_count > 0:
        for _ in range(len(queue)):
            x, y = queue.popleft()
            for dx, dy in directions:
                nx, ny = x + dx, y + dy
                if 0 <= nx < rows and 0 <= ny < cols and grid[nx][ny] == 1:
                    grid[nx][ny] = 2
                    fresh_count -= 1
                    queue.append((nx, ny))
        
        minutes += 1
    
    return minutes if fresh_count == 0 else -1
```

---

### 🚀 Level 3: Optimized BFS (Single Pass with Tracking)

**Approach:**  
This is an optimized BFS approach where we minimize overhead by directly tracking fresh oranges that turn rotten in each minute, without re-checking previous layers.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) for the queue
from collections import deque

def orangesRotting(grid):
    rows, cols = len(grid), len(grid[0])
    queue = deque()
    fresh_count = 0

    # Initialize queue with rotten oranges and count fresh oranges
    for i in range(rows):
        for j in range(cols):
            if grid[i][j] == 2:
                queue.append((i, j))
            elif grid[i][j] == 1:
                fresh_count += 1
    
    # Directions for adjacent cells (right, down, left, up)
    directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    
    minutes = 0
    while queue and fresh_count > 0:
        for _ in range(len(queue)):
            x, y = queue.popleft()
            for dx, dy in directions:
                nx, ny = x + dx, y + dy
                if 0 <= nx < rows and 0 <= ny < cols and grid[nx][ny] == 1:
                    grid[nx][ny] = 2
                    fresh_count -= 1
                    queue.append((nx, ny))
        minutes += 1
    
    return minutes if fresh_count == 0 else -1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | BFS (Simple Queue-Based)            | O(m * n)        | O(m * n)         |
| 2     | Optimized BFS (Tracking Rotten)     | O(m * n)        | O(m * n)         |
| 3     | Optimized BFS (Single Pass)         | O(m * n)        | O(m * n)         |

---

## 🔗 Similar Problems

1. [733. Flood Fill](https://leetcode.com/problems/flood-fill/)
2. [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
3. [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

---

## 📌 Takeaway Points

- **BFS** is ideal for problems involving levels or distances, such as spreading processes (rotting oranges, flood fill, etc.).
- Carefully track the number of fresh oranges to determine if the problem is solvable and ensure you’re not revisiting processed elements.
- When using BFS, **queue management** and **directional iteration** are key to keeping track of all valid adjacent cells.

---
