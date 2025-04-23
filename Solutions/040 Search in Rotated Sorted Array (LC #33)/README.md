
---

# ➕ Problem: Search in Rotated Sorted Array

## 📘 Problem Statement

> There is an integer array `nums` sorted in ascending order (with **distinct values**), which is **rotated at an unknown pivot** index `k` (0 <= k < nums.length).  
> Given the array `nums` and an integer `target`, return the **index** of `target` if it is in `nums`, or `-1` if it is not in `nums`.  
> You must write an algorithm with **O(log n)** runtime complexity.

**LeetCode Link:** [33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)

---

```
Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0  
Output: 4

Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3  
Output: -1

Example 3:

Input: nums = [1], target = 0  
Output: -1
```

---

## ✅ Constraints

- `1 <= nums.length <= 5000`
- `-10⁴ <= nums[i] <= 10⁴`
- All values of `nums` are **unique**
- `nums` is guaranteed to be a rotated sorted array
- `-10⁴ <= target <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Linear Search

**Approach:**  
Scan every element and return the index if it matches the target.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def search(nums, target):
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1
```

---

### ⚙️ Level 2: Modified Binary Search with Rotation Detection

**Approach:**  
Use standard binary search logic but decide which side is sorted to narrow the search window accordingly.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    left, right = 0, len(nums) - 1
    
    while left <= right:
        mid = (left + right) // 2
        
        if nums[mid] == target:
            return mid
        
        # Left part is sorted
        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        # Right part is sorted
        else:
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1
                
    return -1
```

---

### 🚀 Level 3: Optimized Binary Search with Early Checks

**Approach:**  
Same as Level 2 but more concise and adds faster exits when possible for clean readability.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    lo, hi = 0, len(nums) - 1
    
    while lo <= hi:
        mid = (lo + hi) // 2
        if nums[mid] == target:
            return mid
        
        if nums[lo] <= nums[mid]:  # Left half is sorted
            if nums[lo] <= target < nums[mid]:
                hi = mid - 1
            else:
                lo = mid + 1
        else:  # Right half is sorted
            if nums[mid] < target <= nums[hi]:
                lo = mid + 1
            else:
                hi = mid - 1
                
    return -1
```

---

## 🔗 Similar Problems

1. [81. Search in Rotated Sorted Array II](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/)
2. [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)
3. [704. Binary Search](https://leetcode.com/problems/binary-search/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity | Space Complexity |
|-------|-------------------------------------|-----------------|------------------|
| 1     | Linear Scan                         | O(n)            | O(1)             |
| 2     | Binary Search w/ Rotation Logic     | O(log n)        | O(1)             |
| 3     | Optimized Binary w/ Early Conditions| O(log n)        | O(1)             |

---

## 📌 Takeaway Points

- This is a binary search variant requiring rotation awareness.
- At every step, at least one half of the array is sorted—leverage that.
- Efficient handling of edge cases makes the binary approach robust and elegant.

---
