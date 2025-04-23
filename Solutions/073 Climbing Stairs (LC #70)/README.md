
---

# ➕ Problem: Climbing Stairs

## 📘 Problem Statement

> You are climbing a staircase. It takes `n` steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

**LeetCode Link:** [70. Climbing Stairs](https://leetcode.com/problems/climbing-stairs/)

---

```
Example 1:

Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top:
1. 1 step + 1 step
2. 2 steps

Example 2:

Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top:
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

---

## ✅ Constraints

- `1 <= n <= 45`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion

**Approach:**  
A simple recursive approach where we try both possibilities at each step: climb 1 step or climb 2 steps. This leads to overlapping subproblems.

```python
# Time Complexity: O(2^n) due to the exponential branching
# Space Complexity: O(n) due to the recursion stack
def climbStairs(n):
    if n <= 2:
        return n
    return climbStairs(n - 1) + climbStairs(n - 2)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:**  
We use a **top-down** dynamic programming approach with memoization. We store the results of subproblems in a cache to avoid redundant calculations.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) due to the recursion stack and memoization
def climbStairs(n):
    memo = {}

    def helper(n):
        if n <= 2:
            return n
        if n in memo:
            return memo[n]
        memo[n] = helper(n - 1) + helper(n - 2)
        return memo[n]

    return helper(n)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
We use a **bottom-up** dynamic programming approach. We iteratively compute the number of ways to reach each step, starting from the base cases. This eliminates recursion overhead and reduces space complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1) due to the constant space usage
def climbStairs(n):
    if n <= 2:
        return n
    first, second = 1, 2
    for i in range(3, n + 1):
        first, second = second, first + second
    return second
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force Recursion               | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)    | O(n)            | O(n)             |
| 3     | Dynamic Programming (Tabulation)     | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/)
2. [1137. N-th Tribonacci Number](https://leetcode.com/problems/n-th-tribonacci-number/)
3. [91. Decode Ways](https://leetcode.com/problems/decode-ways/)

---

## 📌 Takeaway Points

- **Recursion** can be a quick and intuitive way to solve problems like this, but it has exponential time complexity and can lead to stack overflow for large inputs.
- **Memoization** optimizes the recursive approach by storing results of subproblems, making it much more efficient.
- **Tabulation** is the most efficient approach here, reducing both time and space complexity by using a bottom-up iterative method.

---