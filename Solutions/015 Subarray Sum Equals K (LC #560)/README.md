
---

# ➕ Problem: Subarray Sum Equals K

## 📘 Problem Statement

> Given an array of integers `nums` and an integer `k`, return the **total number of continuous subarrays** whose sum equals to `k`.

**LeetCode Link:** [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)

---

```
Example 1:

Input: nums = [1,1,1], k = 2  
Output: 2

Example 2:

Input: nums = [1,2,3], k = 3  
Output: 2

Example 3:

Input: nums = [1,-1,0], k = 0  
Output: 3
```

---

## ✅ Constraints

- `1 <= nums.length <= 2 * 10⁴`
- `-1000 <= nums[i] <= 1000`
- `-10⁷ <= k <= 10⁷`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Nested Loops)

**Approach:**  
Try all possible subarrays using two loops and compute their sum.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(1)
def subarraySum(nums, k):
    count = 0
    for start in range(len(nums)):
        for end in range(start + 1, len(nums) + 1):
            if sum(nums[start:end]) == k:
                count += 1
    return count
```

---

### ⚙️ Level 2: Prefix Sum (Two Loops)

**Approach:**  
Use a prefix sum array to avoid recomputing subarray sums.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def subarraySum(nums, k):
    n = len(nums)
    prefix = [0] * (n + 1)
    
    for i in range(n):
        prefix[i + 1] = prefix[i] + nums[i]
    
    count = 0
    for start in range(n):
        for end in range(start + 1, n + 1):
            if prefix[end] - prefix[start] == k:
                count += 1
    return count
```

---

### 🚀 Level 3: HashMap + Prefix Sum (Single-Pass)

**Approach:**  
Track the running sum and use a hashmap to store frequency of seen prefix sums.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import defaultdict

def subarraySum(nums, k):
    prefix_sum = 0
    prefix_map = defaultdict(int)
    prefix_map[0] = 1
    count = 0

    for num in nums:
        prefix_sum += num
        count += prefix_map[prefix_sum - k]
        prefix_map[prefix_sum] += 1

    return count
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (sum for each range) | O(n³)           | O(1)             |
| 2     | Prefix Sum (precompute sums)     | O(n²)           | O(n)             |
| 3     | HashMap + Prefix Sum             | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [974. Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/)
2. [325. Maximum Size Subarray Sum Equals k](https://leetcode.com/problems/maximum-size-subarray-sum-equals-k/)
3. [437. Path Sum III](https://leetcode.com/problems/path-sum-iii/)
4. [930. Binary Subarrays With Sum](https://leetcode.com/problems/binary-subarrays-with-sum/)
5. [523. Continuous Subarray Sum](https://leetcode.com/problems/continuous-subarray-sum/)

---

## 📌 Takeaway Points

- The **brute force** approach helps understand the problem but is highly inefficient.
- **Prefix sums** help avoid recomputing subarray totals, a big improvement.
- The **hashmap + prefix sum** strategy is a must-know pattern for subarray sum problems:
  - Store frequencies of cumulative sums.
  - If `prefix_sum - k` exists, a subarray ending here sums to `k`.

---
