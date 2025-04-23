
---

# ➕ Problem: Palindrome Partitioning

## 📘 Problem Statement

> Given a string `s`, partition `s` such that every substring of the partition is a palindrome.  
> Return all possible palindrome partitioning of `s`.

**LeetCode Link:** [131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/)

---

```
Example 1:

Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]

Example 2:

Input: s = "a"
Output: [["a"]]
```

---

## ✅ Constraints

- `1 <= s.length <= 16`
- `s` consists of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking with Palindrome Check)

**Approach:**  
Use backtracking to try all possible splits of the string and check if each substring is a palindrome.

```python
# Time Complexity: O(2^n * n)
# Space Complexity: O(n)
def partition(s):
    result = []
    
    def backtrack(start, path):
        if start == len(s):
            result.append(path[:])
            return
        for end in range(start + 1, len(s) + 1):
            if s[start:end] == s[start:end][::-1]:  # Check if substring is palindrome
                backtrack(end, path + [s[start:end]])

    backtrack(0, [])
    return result
```

---

### ⚙️ Level 2: Optimized Backtracking with Early Exit

**Approach:**  
This approach is similar to the brute force solution but with more optimized palindrome checks using memoization.

```python
# Time Complexity: O(2^n * n)
# Space Complexity: O(n)
def partition(s):
    result = []
    
    def is_palindrome(start, end):
        while start < end:
            if s[start] != s[end]:
                return False
            start += 1
            end -= 1
        return True

    def backtrack(start, path):
        if start == len(s):
            result.append(path[:])
            return
        for end in range(start + 1, len(s) + 1):
            if is_palindrome(start, end - 1):
                backtrack(end, path + [s[start:end]])

    backtrack(0, [])
    return result
```

---

### 🚀 Level 3: Backtracking with Precomputed Palindrome Table (Dynamic Programming)

**Approach:**  
Precompute whether a substring is a palindrome using dynamic programming to avoid redundant checks during backtracking.

```python
# Time Complexity: O(2^n * n)
# Space Complexity: O(n^2)
def partition(s):
    result = []
    n = len(s)
    
    # Create a 2D table to store palindrome information
    dp = [[False] * n for _ in range(n)]
    
    # Fill the table with palindrome info
    for i in range(n):
        dp[i][i] = True
    for length in range(2, n + 1):
        for start in range(n - length + 1):
            end = start + length - 1
            dp[start][end] = (s[start] == s[end]) and (length == 2 or dp[start + 1][end - 1])

    def backtrack(start, path):
        if start == n:
            result.append(path[:])
            return
        for end in range(start + 1, n + 1):
            if dp[start][end - 1]:  # Check palindrome using precomputed table
                backtrack(end, path + [s[start:end]])

    backtrack(0, [])
    return result
```

---

## 🔗 Similar Problems

1. [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
2. [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)
3. [131. Palindrome Partitioning (Subset)](https://leetcode.com/problems/palindrome-partitioning/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)       | O(2^n * n)      | O(n)             |
| 2     | Optimized Backtracking           | O(2^n * n)      | O(n)             |
| 3     | Backtracking with DP (Precomputed Palindrome Table) | O(2^n * n) | O(n^2)           |

---

## 📌 Takeaway Points

- **Backtracking** is an effective method for exploring all possible combinations, but we can optimize it by using precomputed information to reduce redundant checks.
- **Palindrome checking** can be optimized with dynamic programming, making the solution more efficient.
- For problems involving substrings and partitions, memoization and dynamic programming are great tools for improving performance.

---
