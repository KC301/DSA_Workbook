
---

# ➕ Problem: House Robber II

## 📘 Problem Statement

> You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. The only constraint stopping you from robbing two adjacent houses is that **adjacent houses have security systems connected** and it will automatically contact the police if two adjacent houses are robbed.
> 
> This time, the houses are arranged in a circle. That means the first house is adjacent to the last house. Determine the maximum amount of money you can rob tonight without alerting the police.

**LeetCode Link:** [213. House Robber II](https://leetcode.com/problems/house-robber-ii/)

---

```
Example 1:

Input: nums = [2,3,2]
Output: 3
Explanation: Rob house 2 (money = 3). Total amount you can rob = 3.

Example 2:

Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and rob house 3 (money = 3). Total amount you can rob = 1 + 3 = 4.
```

---

## ✅ Constraints

- `1 <= nums.length <= 100`
- `0 <= nums[i] <= 400`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion with Two Cases

**Approach:**  
Since the houses are arranged in a circle, we break the problem into two separate cases: one where we rob the first house and one where we skip it. The solution will be the maximum of these two cases.

```python
# Time Complexity: O(2^n) due to the exponential branching
# Space Complexity: O(n) due to the recursion stack
def rob(nums):
    def dfs(i, nums):
        if i >= len(nums):
            return 0
        return max(dfs(i + 1, nums), nums[i] + dfs(i + 2, nums))
    
    if len(nums) <= 1:
        return nums[0] if nums else 0

    # Case 1: Rob the first house
    case1 = dfs(0, nums[:-1])

    # Case 2: Skip the first house
    case2 = dfs(1, nums[1:])
    
    return max(case1, case2)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:**  
Using **top-down dynamic programming** with memoization, we solve both cases (rob first house or skip first house) and store the results to avoid redundant computations.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) due to the recursion stack and memoization
def rob(nums):
    def dfs(i, nums, memo):
        if i >= len(nums):
            return 0
        if i in memo:
            return memo[i]
        memo[i] = max(dfs(i + 1, nums, memo), nums[i] + dfs(i + 2, nums, memo))
        return memo[i]

    if len(nums) <= 1:
        return nums[0] if nums else 0

    memo = {}
    # Case 1: Rob the first house
    case1 = dfs(0, nums[:-1], memo)

    memo = {}
    # Case 2: Skip the first house
    case2 = dfs(1, nums[1:], memo)

    return max(case1, case2)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
We use **bottom-up dynamic programming** to solve both subproblems (rob first house or skip first house). This approach eliminates recursion and uses constant space for computation.

```python
# Time Complexity: O(n)
# Space Complexity: O(1) due to constant space usage
def rob(nums):
    def rob_linear(nums):
        if len(nums) <= 1:
            return nums[0] if nums else 0
        prev, curr = 0, 0
        for num in nums:
            prev, curr = curr, max(curr, prev + num)
        return curr

    if len(nums) <= 1:
        return nums[0] if nums else 0

    # Case 1: Rob the first house (exclude last house)
    case1 = rob_linear(nums[:-1])

    # Case 2: Skip the first house (exclude first house)
    case2 = rob_linear(nums[1:])

    return max(case1, case2)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force Recursion with Two Cases | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)    | O(n)            | O(n)             |
| 3     | Dynamic Programming (Tabulation)     | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [198. House Robber](https://leetcode.com/problems/house-robber/)
2. [746. Min Cost Climbing Stairs](https://leetcode.com/problems/min-cost-climbing-stairs/)
3. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

## 📌 Takeaway Points

- In problems with circular dependencies (like this one), break the problem into two cases: one where you include the first element and one where you exclude it.
- **Memoization** optimizes recursive solutions by caching previously computed results.
- **Tabulation** is often the most efficient solution in terms of both time and space, especially when recursion is unnecessary.

---
