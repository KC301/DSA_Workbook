
---

# ➕ Problem: House Robber

## 📘 Problem Statement

> You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. The only constraint stopping you from robbing two adjacent houses is that **adjacent houses have security systems connected** and it will automatically contact the police if two adjacent houses are robbed.
> 
> Given a list of non-negative integers representing the amount of money of each house, determine the maximum amount of money you can rob tonight without alerting the police.

**LeetCode Link:** [198. House Robber](https://leetcode.com/problems/house-robber/)

---

```
Example 1:

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and rob house 3 (money = 3). Total amount you can rob = 1 + 3 = 4.

Example 2:

Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9), and rob house 5 (money = 1). Total amount you can rob = 2 + 9 + 1 = 12.
```

---

## ✅ Constraints

- `1 <= nums.length <= 100`
- `0 <= nums[i] <= 400`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion

**Approach:**  
A brute force approach is to recursively check both possibilities for each house: either rob it or skip it, and return the maximum possible amount.

```python
# Time Complexity: O(2^n) due to the exponential branching
# Space Complexity: O(n) due to the recursion stack
def rob(nums):
    def dfs(i):
        if i >= len(nums):
            return 0
        return max(dfs(i + 1), nums[i] + dfs(i + 2))

    return dfs(0)
```

---

### ⚙️ Level 2: Dynamic Programming with Memoization

**Approach:**  
We use **top-down dynamic programming** with memoization to avoid redundant calculations. This will optimize the recursive approach by storing results of subproblems.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) due to the recursion stack and memoization
def rob(nums):
    memo = {}

    def dfs(i):
        if i >= len(nums):
            return 0
        if i in memo:
            return memo[i]
        memo[i] = max(dfs(i + 1), nums[i] + dfs(i + 2))
        return memo[i]

    return dfs(0)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
We use **bottom-up dynamic programming** to iteratively compute the maximum amount of money that can be robbed up to each house. This eliminates recursion and reduces both time and space complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1) due to constant space usage
def rob(nums):
    if not nums:
        return 0
    prev, curr = 0, 0
    for num in nums:
        prev, curr = curr, max(curr, prev + num)
    return curr
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

1. [213. House Robber II](https://leetcode.com/problems/house-robber-ii/)
2. [746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/)
3. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

## 📌 Takeaway Points

- The brute force recursive approach is simple but inefficient due to overlapping subproblems.
- Memoization can significantly optimize the recursion, ensuring each subproblem is solved only once.
- The tabulation approach is the most efficient and eliminates recursion overhead while using constant space.

---
