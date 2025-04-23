
---

# ➕ Problem: Find Minimum in Rotated Sorted Array

## 📘 Problem Statement

> Suppose an array of length `n` sorted in ascending order is **rotated** between `1` and `n` times.  
> Given the rotated array `nums` of **unique elements**, return the minimum element of the array.  
> You must write an algorithm that runs in **O(log n)** time.

**LeetCode Link:** [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)

---

```
Example 1:

Input: nums = [3,4,5,1,2]  
Output: 1

Example 2:

Input: nums = [4,5,6,7,0,1,2]  
Output: 0

Example 3:

Input: nums = [11,13,15,17]  
Output: 11
```

---

## ✅ Constraints

- `1 <= nums.length <= 5000`
- `-5000 <= nums[i] <= 5000`
- All the integers of `nums` are **unique**
- `nums` is sorted and then rotated

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Linear Scan

**Approach:**  
Just iterate and return the smallest element.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def findMin(nums):
    minimum = nums[0]
    for num in nums:
        if num < minimum:
            minimum = num
    return minimum
```

---

### ⚙️ Level 2: Binary Search with Left Comparison

**Approach:**  
Compare middle with right to decide which half to discard.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def findMin(nums):
    left, right = 0, len(nums) - 1
    
    while left < right:
        mid = (left + right) // 2
        if nums[mid] > nums[right]:
            left = mid + 1
        else:
            right = mid
            
    return nums[left]
```

---

### 🚀 Level 3: Optimized Binary Search with Early Termination

**Approach:**  
Add a check for early termination when subarray is already sorted.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def findMin(nums):
    l, r = 0, len(nums) - 1

    while l < r:
        if nums[l] < nums[r]:  # already sorted
            return nums[l]
        mid = (l + r) // 2
        if nums[mid] >= nums[l]:
            l = mid + 1
        else:
            r = mid

    return nums[l]
```

---

## 🔗 Similar Problems

1. [154. Find Minimum in Rotated Sorted Array II](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/)
2. [33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)
3. [704. Binary Search](https://leetcode.com/problems/binary-search/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                               | Time Complexity | Space Complexity |
|-------|----------------------------------------|-----------------|------------------|
| 1     | Linear Scan                            | O(n)            | O(1)             |
| 2     | Binary Search w/ Mid vs Right          | O(log n)        | O(1)             |
| 3     | Optimized Binary w/ Early Termination  | O(log n)        | O(1)             |

---

## 📌 Takeaway Points

- The minimum is always in the unsorted half of the rotated array.
- Checking `nums[mid]` against `nums[right]` or `nums[left]` helps decide the direction.
- Early termination improves performance when part of the array is already sorted.

---

