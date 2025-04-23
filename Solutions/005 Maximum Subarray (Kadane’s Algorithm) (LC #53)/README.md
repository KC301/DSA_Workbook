Here's the solution for **LeetCode 53: Maximum Subarray**.

---

# 📈 Problem: Maximum Subarray

## 📘 Problem Statement

> Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

**LeetCode Link:** [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)

---

```

Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum 6.
Example 2:

Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum 1.
Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum 23.

```

## ✅ Constraints

- `1 <= nums.length <= 10^5`
- `-10^4 <= nums[i] <= 10^4`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:** Try every possible subarray and compute their sums.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def maxSubArray(nums):
    max_sum = float('-inf')
    for i in range(len(nums)):
        current_sum = 0
        for j in range(i, len(nums)):
            current_sum += nums[j]
            max_sum = max(max_sum, current_sum)
    return max_sum
```

---

### ⚙️ Level 2: Slight Optimization with Prefix Sum

**Approach:** Use prefix sums to compute subarray sums more efficiently.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def maxSubArray(nums):
    n = len(nums)
    prefix = [0] * (n + 1)
    for i in range(n):
        prefix[i+1] = prefix[i] + nums[i]
    
    max_sum = float('-inf')
    for i in range(n):
        for j in range(i+1, n+1):
            max_sum = max(max_sum, prefix[j] - prefix[i])
    return max_sum
```

---

### 🚀 Level 3: Kadane’s Algorithm (Optimal)

**Approach:** Maintain a running current sum and reset it to zero if it goes negative.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def maxSubArray(nums):
    max_sum = current_sum = nums[0]
    for num in nums[1:]:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)
    return max_sum
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force                       | O(n²)           | O(1)             |
| 2     | Prefix Sum                        | O(n²)           | O(n)             |
| 3     | Kadane’s Algorithm                | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [918. Maximum Sum Circular Subarray](https://leetcode.com/problems/maximum-sum-circular-subarray/)
2. [152. Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)
3. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

## 📌 Takeaway Points

- Kadane’s algorithm is a classic dynamic programming solution that can solve this in linear time.
- Resetting the current sum when it drops below zero ensures that subarrays with negative prefixes are ignored.
- Prefix sums can simplify some variations of the problem but aren't optimal for this one.

---
