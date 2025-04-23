
---

# ➕ Problem: Jump Game

## 📘 Problem Statement

> You are given an integer array `nums`. Each element in `nums` represents your maximum jump length from that position.  
> Initially, you are positioned at the first index.  
> Return `true` if you can reach the last index, or `false` otherwise.

**LeetCode Link:** [55. Jump Game](https://leetcode.com/problems/jump-game/)

---

```
Example 1:

Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.

Example 2:

Input: nums = [3,2,1,0,4]
Output: false
Explanation: You will always arrive at index 3, where you can't move further.

```

---

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `0 <= nums[i] <= 10⁵`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive)

**Approach:**  
This brute-force recursive approach checks all possible paths from the current index. At each position, we try jumping to all reachable indices. This leads to a large number of subproblems and poor performance, especially for larger inputs.

```python
# Time Complexity: O(2^n) due to the branching recursion
# Space Complexity: O(n) due to recursion stack
def canJump(nums):
    def dfs(i):
        if i >= len(nums) - 1: return True
        max_jump = min(i + nums[i], len(nums) - 1)
        for next_i in range(i + 1, max_jump + 1):
            if dfs(next_i):
                return True
        return False

    return dfs(0)
```

---

### ⚙️ Level 2: Greedy (Rightmost Reach)

**Approach:**  
We use a greedy approach where we keep track of the rightmost index that can be reached. As we iterate through the array, we update this reach. If at any point the current index is beyond the current reach, we return `False`. Otherwise, if the rightmost reach ends up at or beyond the last index, we return `True`.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def canJump(nums):
    rightmost = 0
    for i in range(len(nums)):
        if i > rightmost:  # If the current index is beyond the reach, we can't proceed
            return False
        rightmost = max(rightmost, i + nums[i])
    return True
```

---

### 🚀 Level 3: Optimized Greedy with Early Termination

**Approach:**  
This approach builds on the greedy technique but with early termination: if we can reach the last index or any index beyond it, we return `True` immediately without checking further.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def canJump(nums):
    rightmost = 0
    for i in range(len(nums)):
        if i > rightmost:  # If the current index is beyond the reach, we can't proceed
            return False
        rightmost = max(rightmost, i + nums[i])
        if rightmost >= len(nums) - 1:  # Early exit once we can reach the last index
            return True
    return False
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Recursive)              | O(2^n)          | O(n)             |
| 2     | Greedy (Rightmost Reach)             | O(n)            | O(1)             |
| 3     | Optimized Greedy with Early Termination | O(n)          | O(1)             |

---

## 🔗 Similar Problems

1. [45. Jump Game II](https://leetcode.com/problems/jump-game-ii/)
2. [134. Gas Station](https://leetcode.com/problems/gas-station/)
3. [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)

---

## 📌 Takeaway Points

- **Brute-force recursion** has exponential time complexity and is impractical for large inputs.
- The **greedy approach** is more efficient with a time complexity of **O(n)** and constant space complexity.
- **Early termination** in the greedy approach allows for even faster results, especially when the last index becomes reachable before the end of the array.

---
