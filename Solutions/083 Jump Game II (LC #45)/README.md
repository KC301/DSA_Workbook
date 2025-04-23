
---

# ➕ Problem: Jump Game II

## 📘 Problem Statement

> You are given a 0-indexed array `nums` of `n` integers. Initially, you are positioned at `nums[0]`.  
> Each element in the array represents your maximum jump length from that position.  
> Your goal is to reach the last index in the minimum number of jumps.

> Return the minimum number of jumps required to reach the last index. If it is not possible to reach the last index, return `-1`.

**LeetCode Link:** [45. Jump Game II](https://leetcode.com/problems/jump-game-ii/)

---

```
Example 1:

Input: nums = [2,3,1,1,4]
Output: 2
Explanation: The minimum number of jumps to reach the last index is 2. Jump 1 step from index 0 to 1, then 3 steps to the last index.

Example 2:

Input: nums = [3,2,1,0,4]
Output: -1
Explanation: It is not possible to reach the last index.

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
The brute-force recursive approach explores all possible paths from the current index. For each position, we try all reachable indices and recursively calculate the minimum number of jumps. This solution is highly inefficient due to overlapping subproblems.

```python
# Time Complexity: O(2^n) due to the branching recursion
# Space Complexity: O(n) due to recursion stack
def jump(nums):
    def dfs(i):
        if i >= len(nums) - 1: return 0
        max_jump = min(i + nums[i], len(nums) - 1)
        min_jumps = float('inf')
        for next_i in range(i + 1, max_jump + 1):
            min_jumps = min(min_jumps, 1 + dfs(next_i))
        return min_jumps

    res = dfs(0)
    return res if res != float('inf') else -1
```

---

### ⚙️ Level 2: Greedy with Level Tracking (BFS-like)

**Approach:**  
We use a greedy approach where we track the number of jumps needed to reach each index. Instead of examining each possible jump recursively, we maintain a window of reachable indices and increase the jump count when we exhaust that window.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def jump(nums):
    jumps, curr_end, curr_furthest = 0, 0, 0
    for i in range(len(nums) - 1):
        curr_furthest = max(curr_furthest, i + nums[i])
        if i == curr_end:
            jumps += 1
            curr_end = curr_furthest
        if curr_end >= len(nums) - 1:
            return jumps
    return -1
```

---

### 🚀 Level 3: Optimized Greedy (Minimizing Jumps)

**Approach:**  
In this approach, we use a greedy strategy where we try to minimize the number of jumps while ensuring that we can always move forward. We update the end of the current range of reachable indices and the farthest point we can reach in the next jump, incrementing the jump count whenever necessary.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def jump(nums):
    jumps, curr_end, curr_furthest = 0, 0, 0
    for i in range(len(nums) - 1):
        curr_furthest = max(curr_furthest, i + nums[i])
        if i == curr_end:
            jumps += 1
            curr_end = curr_furthest
            if curr_end >= len(nums) - 1:
                return jumps
    return -1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Recursive)              | O(2^n)          | O(n)             |
| 2     | Greedy with Level Tracking (BFS-like) | O(n)            | O(1)             |
| 3     | Optimized Greedy (Minimizing Jumps)  | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [55. Jump Game](https://leetcode.com/problems/jump-game/)
2. [134. Gas Station](https://leetcode.com/problems/gas-station/)
3. [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)

---

## 📌 Takeaway Points

- **Brute-force recursion** is inefficient due to the exponential number of possibilities it explores.
- The **greedy approach with level tracking** effectively solves the problem with **O(n)** time complexity and constant space.
- **Optimizing jumps** is the most efficient approach for this problem, ensuring that the minimum number of jumps is achieved by tracking the farthest reachable index within each jump.

---
