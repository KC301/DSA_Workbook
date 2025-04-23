
---

# ➕ Problem: Longest Increasing Subsequence

## 📘 Problem Statement

> Given an integer array `nums`, return the length of the longest strictly increasing subsequence.

> A subsequence is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.

**LeetCode Link:** [300. Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/)

---

```
Example 1:

Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

Example 2:

Input: nums = [0,1,0,3,2,3]
Output: 4
Explanation: The longest increasing subsequence is [0,1,2,3], therefore the length is 4.

```

---

## ✅ Constraints

- `1 <= nums.length <= 2500`
- `-10⁴ <= nums[i] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Exponential Search)

**Approach:**  
We can explore all subsequences of the array and check which ones are strictly increasing. This brute-force method will be inefficient for large inputs due to the exponential growth of possible subsequences.

```python
# Time Complexity: O(2^n) due to the number of possible subsequences
# Space Complexity: O(n) due to recursion stack
def longestIncreasingSubsequence(nums):
    def dfs(i, prev_val):
        if i == len(nums):
            return 0
        # Skip current element or take it if it's larger than the previous value
        take = 0
        if nums[i] > prev_val:
            take = 1 + dfs(i + 1, nums[i])
        skip = dfs(i + 1, prev_val)
        return max(take, skip)

    return dfs(0, float('-inf'))
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:**  
Memoize the results of subproblems to avoid redundant calculations. We store the length of the longest increasing subsequence starting from each index `i`.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n) due to memoization
def longestIncreasingSubsequence(nums):
    memo = {}

    def dfs(i, prev_val):
        if i == len(nums):
            return 0
        if (i, prev_val) in memo:
            return memo[(i, prev_val)]
        
        take = 0
        if nums[i] > prev_val:
            take = 1 + dfs(i + 1, nums[i])
        skip = dfs(i + 1, prev_val)
        
        memo[(i, prev_val)] = max(take, skip)
        return memo[(i, prev_val)]

    return dfs(0, float('-inf'))
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
We use **bottom-up dynamic programming**. We create a `dp` array where `dp[i]` represents the length of the longest increasing subsequence ending at index `i`. We then fill out the table iteratively.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def longestIncreasingSubsequence(nums):
    n = len(nums)
    if n == 0:
        return 0
    
    dp = [1] * n  # Initialize dp array where every element is at least a subsequence of length 1

    for i in range(1, n):
        for j in range(i):
            if nums[i] > nums[j]:
                dp[i] = max(dp[i], dp[j] + 1)

    return max(dp)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force                         | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)    | O(n^2)          | O(n)             |
| 3     | Dynamic Programming (Tabulation)     | O(n^2)          | O(n)             |

---

## 🔗 Similar Problems

1. [673. Number of Longest Increasing Subsequence](https://leetcode.com/problems/number-of-longest-increasing-subsequence/)
2. [354. Russian Doll Envelopes](https://leetcode.com/problems/russian-doll-envelopes/)
3. [918. Maximum Sum Circular Subarray](https://leetcode.com/problems/maximum-sum-circular-subarray/)

---

## 📌 Takeaway Points

- The brute force solution is not practical for larger inputs because of the exponential time complexity.
- **Memoization** reduces the repeated computation in the recursive approach, making it more efficient, though it still has quadratic time complexity.
- **Dynamic Programming** using tabulation is the most efficient in practice and provides an optimal solution with **O(n²)** time complexity and **O(n)** space complexity.

---
