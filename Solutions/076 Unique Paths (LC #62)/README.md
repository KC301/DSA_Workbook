
---

# ➕ Problem: Unique Paths

## 📘 Problem Statement

> A robot is located at the top-left corner of a `m x n` grid. The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid.
> 
> How many possible unique paths are there?

**LeetCode Link:** [62. Unique Paths](https://leetcode.com/problems/unique-paths/)

---

```
Example 1:

Input: m = 3, n = 7
Output: 28
Explanation: There are 28 unique paths to reach the bottom-right corner.

Example 2:

Input: m = 3, n = 2
Output: 3
Explanation: There are 3 unique paths to reach the bottom-right corner.

```

---

## ✅ Constraints

- `1 <= m, n <= 100`
- The answer is guaranteed to be less than or equal to 2 * 10⁹.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion

**Approach:**  
A recursive solution that explores both possible moves (down and right) at each step and returns the number of ways to reach the bottom-right corner.

```python
# Time Complexity: O(2^(m+n)) due to the exponential branching
# Space Complexity: O(m + n) due to the recursion stack
def uniquePaths(m, n):
    def dfs(i, j):
        if i == m - 1 or j == n - 1:
            return 1
        return dfs(i + 1, j) + dfs(i, j + 1)

    return dfs(0, 0)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:**  
We can use **memoization** to store the number of unique paths from a specific point, avoiding redundant computations.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) due to the memoization table
def uniquePaths(m, n):
    memo = {}

    def dfs(i, j):
        if i == m - 1 or j == n - 1:
            return 1
        if (i, j) in memo:
            return memo[(i, j)]
        memo[(i, j)] = dfs(i + 1, j) + dfs(i, j + 1)
        return memo[(i, j)]

    return dfs(0, 0)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
A **bottom-up dynamic programming** approach where we iteratively compute the number of unique paths to reach each cell in the grid, starting from the top-left corner.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(n) due to constant space usage
def uniquePaths(m, n):
    dp = [1] * n
    for i in range(1, m):
        for j in range(1, n):
            dp[j] += dp[j - 1]
    return dp[-1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force Recursion               | O(2^(m+n))      | O(m + n)         |
| 2     | Dynamic Programming (Memoization)    | O(m * n)        | O(m * n)         |
| 3     | Dynamic Programming (Tabulation)     | O(m * n)        | O(n)             |

---

## 🔗 Similar Problems

1. [63. Unique Paths II](https://leetcode.com/problems/unique-paths-ii/)
2. [64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)
3. [70. Climbing Stairs](https://leetcode.com/problems/climbing-stairs/)

---

## 📌 Takeaway Points

- The brute force approach works but has an exponential time complexity, making it inefficient for larger grids.
- **Memoization** is an improvement, reducing redundant calculations by storing intermediate results.
- **Tabulation** is the most efficient approach, reducing both time and space complexity by iterating over the grid and updating a single row at a time.

---