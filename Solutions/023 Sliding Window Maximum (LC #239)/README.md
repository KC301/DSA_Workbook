
---

# ➕ Problem: Sliding Window Maximum

## 📘 Problem Statement

> You are given an array of integers `nums` and an integer `k`, where `k` is the size of the sliding window.  
> You need to find the maximum value in each sliding window of size `k`.

**LeetCode Link:** [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

---

```
Example 1:

Input: nums = [1,3,-1,-3,5,3,6,7], k = 3  
Output: [3,3,5,5,6,7]  
Explanation:  
Window position                Max  
---------------               -----  
[1 3 -1] -3 5 3 6 7            3  
1 [3 -1 -3] 5 3 6 7            3  
1 3 [-1 -3 5] 3 6 7            5  
1 3 -1 [-3 5 3] 6 7            5  
1 3 -1 -3 [5 3 6] 7            6  
1 3 -1 -3 5 [3 6 7]            7  

Example 2:

Input: nums = [1], k = 1  
Output: [1]  

Example 3:

Input: nums = [1,-1], k = 1  
Output: [1,-1]  

Example 4:

Input: nums = [9,11], k = 2  
Output: [11]  
```

---

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁴ <= nums[i] <= 10⁴`
- `1 <= k <= nums.length`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recalculate Max for Each Window)

**Approach:**  
For each window, find the maximum value by iterating over the elements inside the window. This approach is not optimal and has a time complexity of O(n * k).

```python
# Time Complexity: O(n * k)
# Space Complexity: O(n)
def maxSlidingWindow(nums, k):
    result = []
    for i in range(len(nums) - k + 1):
        result.append(max(nums[i:i+k]))
    return result
```

---

### ⚙️ Level 2: Sliding Window with Deque

**Approach:**  
Use a deque (double-ended queue) to store indices of the elements in the current window. Ensure the deque is always sorted in decreasing order of values, so the first element is always the maximum. This approach reduces the time complexity to O(n).

```python
# Time Complexity: O(n)
# Space Complexity: O(k)
from collections import deque

def maxSlidingWindow(nums, k):
    deq = deque()
    result = []
    
    for i in range(len(nums)):
        # Remove indices of elements that are out of the current window
        if deq and deq[0] < i - k + 1:
            deq.popleft()
        
        # Remove indices of elements smaller than the current element
        while deq and nums[deq[-1]] < nums[i]:
            deq.pop()
        
        # Add current element index to the deque
        deq.append(i)
        
        # Add the maximum of the current window (first element of deque)
        if i >= k - 1:
            result.append(nums[deq[0]])
    
    return result
```

---

### 🚀 Level 3: Optimized Sliding Window with Single Pass

**Approach:**  
This is the same approach as Level 2 but with minor optimizations to handle the deque efficiently and avoid redundant operations.

```python
# Time Complexity: O(n)
# Space Complexity: O(k)
from collections import deque

def maxSlidingWindow(nums, k):
    deq = deque()
    result = []
    
    for i, num in enumerate(nums):
        # Remove indices that are out of the window
        if deq and deq[0] < i - k + 1:
            deq.popleft()
        
        # Remove indices where the corresponding values are less than the current value
        while deq and nums[deq[-1]] < num:
            deq.pop()
        
        deq.append(i)
        
        # Start adding results to the list after processing the first k elements
        if i >= k - 1:
            result.append(nums[deq[0]])
    
    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Recalculate Max)    | O(n * k)        | O(n)             |
| 2     | Sliding Window with Deque        | O(n)            | O(k)             |
| 3     | Optimized Sliding Window         | O(n)            | O(k)             |

---

## 🔗 Similar Problems

1. [239. Sliding Window Maximum (Advanced)](https://leetcode.com/problems/sliding-window-maximum/)
2. [239. Sliding Window Maximum II](https://leetcode.com/problems/sliding-window-maximum/)
3. [739. Daily Temperature](https://leetcode.com/problems/daily-temperature/)
4. [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)
5. [1438. Longest Continuous Subarray with Absolute Diff Less Than or Equal to Limit](https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/)

---

## 📌 Takeaway Points

- **Sliding Window** technique helps efficiently process subarrays or substrings without recalculating values for overlapping parts.
- **Deque** is particularly useful for problems where you need to maintain an ordered collection with fast access to both ends.
- Always ensure to remove elements from the deque that are outside the current window to maintain the correct state.

---
