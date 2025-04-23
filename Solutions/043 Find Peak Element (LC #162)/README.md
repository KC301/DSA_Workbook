
---

# ➕ Problem: Find Peak Element

## 📘 Problem Statement

> A peak element is an element that is **strictly greater than its neighbors**.  
> Given an integer array `nums`, find a peak element, and return its **index**.  
> You may imagine that `nums[-1] = nums[n] = -∞`.  
> You must implement a solution with **O(log n)** time complexity.

**LeetCode Link:** [162. Find Peak Element](https://leetcode.com/problems/find-peak-element/)

---

```
Example 1:

Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.

Example 2:

Input: nums = [1,2,1,3,5,6,4]
Output: 5
Explanation: Your function can return either index 1 (2) or 5 (6), both are valid.
```

---

## ✅ Constraints

- `1 <= nums.length <= 1000`
- `-2³¹ <= nums[i] <= 2³¹ - 1`
- `nums[i] ≠ nums[i + 1]` for all valid `i`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Linear Scan

**Approach:**  
Scan the array and return the first index where `nums[i] > nums[i+1]`.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def findPeakElement(nums):
    for i in range(len(nums) - 1):
        if nums[i] > nums[i + 1]:
            return i
    return len(nums) - 1
```

---

### ⚙️ Level 2: Iterative Binary Search

**Approach:**  
Use binary search. If `nums[mid] > nums[mid+1]`, the peak is on the left (including mid), else it's on the right.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def findPeakElement(nums):
    left, right = 0, len(nums) - 1

    while left < right:
        mid = (left + right) // 2
        if nums[mid] > nums[mid + 1]:
            right = mid
        else:
            left = mid + 1

    return left
```

---

### 🚀 Level 3: Recursive Binary Search

**Approach:**  
Same logic as Level 2, implemented recursively for elegance.

```python
# Time Complexity: O(log n)
# Space Complexity: O(log n) due to recursion
def findPeakElement(nums):
    def search(left, right):
        if left == right:
            return left
        mid = (left + right) // 2
        if nums[mid] > nums[mid + 1]:
            return search(left, mid)
        return search(mid + 1, right)
    
    return search(0, len(nums) - 1)
```

---

## 🔗 Similar Problems

1. [852. Peak Index in a Mountain Array](https://leetcode.com/problems/peak-index-in-a-mountain-array/)
2. [1095. Find in Mountain Array](https://leetcode.com/problems/find-in-mountain-array/)
3. [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Linear Scan                     | O(n)            | O(1)             |
| 2     | Iterative Binary Search         | O(log n)        | O(1)             |
| 3     | Recursive Binary Search         | O(log n)        | O(log n)         |

---

## 📌 Takeaway Points

- A peak always exists because of the `-∞` virtual bounds.
- Binary search works because at least one peak must be in the "uphill" direction.
- This is a good example of binary search applied to unsorted data.

---
