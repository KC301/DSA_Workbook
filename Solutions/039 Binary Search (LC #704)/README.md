
---

# ➕ Problem: Binary Search

## 📘 Problem Statement

> Given an array of integers `nums` which is sorted in **ascending order**, and an integer `target`, write a function to search `target` in `nums`.  
> If `target` exists, then return its index. Otherwise, return `-1`.

**LeetCode Link:** [704. Binary Search](https://leetcode.com/problems/binary-search/)

---

```
Example 1:

Input: nums = [-1,0,3,5,9,12], target = 9  
Output: 4  
Explanation: 9 exists in nums and its index is 4

Example 2:

Input: nums = [-1,0,3,5,9,12], target = 2  
Output: -1  
Explanation: 2 does not exist in nums so return -1
```

---

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁴ < nums[i], target < 10⁴`
- All the integers in `nums` are **unique**
- `nums` is sorted in ascending order

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

### ⚙️ Level 2: Iterative Binary Search

**Approach:**  
Use two pointers to divide the search space in half each time.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    left, right = 0, len(nums) - 1
    
    while left <= right:
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
            
    return -1
```

---

### 🚀 Level 3: Recursive Binary Search

**Approach:**  
Divide and conquer recursively until the target is found or the range collapses.

```python
# Time Complexity: O(log n)
# Space Complexity: O(log n) due to recursion stack
def search(nums, target):
    def binary_search(left, right):
        if left > right:
            return -1
        mid = (left + right) // 2
        if nums[mid] == target:
            return mid
        elif nums[mid] < target:
            return binary_search(mid + 1, right)
        else:
            return binary_search(left, mid - 1)

    return binary_search(0, len(nums) - 1)
```

---

## 🔗 Similar Problems

1. [35. Search Insert Position](https://leetcode.com/problems/search-insert-position/)
2. [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)
3. [704. Binary Search (Recursive/Iterative)](https://leetcode.com/problems/binary-search/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach              | Time Complexity | Space Complexity |
|-------|-----------------------|-----------------|------------------|
| 1     | Linear Search         | O(n)            | O(1)             |
| 2     | Iterative Binary      | O(log n)        | O(1)             |
| 3     | Recursive Binary      | O(log n)        | O(log n)         |

---

## 📌 Takeaway Points

- Binary search reduces time complexity from linear to logarithmic for sorted arrays.
- Iterative is more space-efficient than recursive due to no call stack.
- Make sure to handle edge cases like empty arrays and off-by-one errors in bounds.

---

