
---

# ➕ Problem: N-Queens

## 📘 Problem Statement

> The N-Queens puzzle is the problem of placing `N` chess queens on an `N x N` chessboard such that no two queens threaten each other.  
> The queens can attack horizontally, vertically, or diagonally.  
> Given an integer `n`, return all distinct solutions to the N-Queens puzzle.  
> Each solution contains a distinct board configuration of the queens' positions, where 'Q' and '.' both indicate a queen and an empty space, respectively.

**LeetCode Link:** [51. N-Queens](https://leetcode.com/problems/n-queens/)

---

```
Example 1:

Input: n = 4
Output: [[".Q..","...Q","Q...",".Q.."],["..Q.","Q...",".Q..","...Q"]]

Example 2:

Input: n = 1
Output: [["Q"]]
```

---

## ✅ Constraints

- `1 <= n <= 9`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking)

**Approach:**  
Generate all possible placements of the queens, and check if each placement is valid.

```python
# Time Complexity: O(N!)
# Space Complexity: O(N)
def solveNQueens(n):
    result = []
    board = [["." for _ in range(n)] for _ in range(n)]

    def is_valid(row, col):
        # Check the column
        for i in range(row):
            if board[i][col] == "Q":
                return False
        # Check diagonals
        for i, j in zip(range(row - 1, -1, -1), range(col - 1, -1, -1)):
            if board[i][j] == "Q":
                return False
        for i, j in zip(range(row - 1, -1, -1), range(col + 1, n)):
            if board[i][j] == "Q":
                return False
        return True

    def backtrack(row):
        if row == n:
            result.append(["".join(board[i]) for i in range(n)])
            return
        for col in range(n):
            if is_valid(row, col):
                board[row][col] = "Q"
                backtrack(row + 1)
                board[row][col] = "."

    backtrack(0)
    return result
```

---

### ⚙️ Level 2: Optimized Backtracking (Column and Diagonal Tracking)

**Approach:**  
Instead of checking the entire board each time, use sets to track the columns and diagonals where queens are already placed.

```python
# Time Complexity: O(N!)
# Space Complexity: O(N)
def solveNQueens(n):
    result = []
    columns = set()
    diagonals1 = set()
    diagonals2 = set()
    board = [["." for _ in range(n)] for _ in range(n)]

    def backtrack(row):
        if row == n:
            result.append(["".join(board[i]) for i in range(n)])
            return
        for col in range(n):
            if col in columns or (row - col) in diagonals1 or (row + col) in diagonals2:
                continue
            columns.add(col)
            diagonals1.add(row - col)
            diagonals2.add(row + col)
            board[row][col] = "Q"
            backtrack(row + 1)
            columns.remove(col)
            diagonals1.remove(row - col)
            diagonals2.remove(row + col)
            board[row][col] = "."

    backtrack(0)
    return result
```

---

### 🚀 Level 3: Optimized Backtracking with Bitmasking

**Approach:**  
Use bitmasking to efficiently track the columns and diagonals, reducing the space complexity.

```python
# Time Complexity: O(N!)
# Space Complexity: O(N)
def solveNQueens(n):
    result = []
    def backtrack(row, columns, diagonals1, diagonals2, board):
        if row == n:
            result.append(["".join(row) for row in board])
            return
        available_positions = (~(columns | diagonals1 | diagonals2)) & ((1 << n) - 1)
        while available_positions:
            position = available_positions & -available_positions
            col = bin(position).count('1') - 1
            board[row][col] = 'Q'
            backtrack(row + 1, columns | position, (diagonals1 | position) << 1, (diagonals2 | position) >> 1, board)
            board[row][col] = '.'
            available_positions ^= position

    backtrack(0, 0, 0, 0, [['.' for _ in range(n)] for _ in range(n)])
    return result
```

---

## 🔗 Similar Problems

1. [52. N-Queens II](https://leetcode.com/problems/n-queens-ii/)
2. [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)
3. [51. N-Queens (Generalized)](https://leetcode.com/problems/n-queens/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)       | O(N!)           | O(N)             |
| 2     | Optimized Backtracking (Column and Diagonal Tracking) | O(N!) | O(N)             |
| 3     | Optimized Backtracking with Bitmasking | O(N!) | O(N)             |

---

## 📌 Takeaway Points

- **Backtracking** is a natural approach to solve the N-Queens problem. It systematically explores all possible placements of queens and prunes invalid solutions.
- **Column and diagonal tracking** improves performance by preventing redundant checks for each placement.
- **Bitmasking** is a highly efficient technique, especially in problems involving subsets, to reduce space and time complexity when managing constraints like columns and diagonals.

---
