
---

# ➕ Problem: Merge Sorted Array

## 📘 Problem Statement

> You are given two integer arrays `nums1` and `nums2`, sorted in **non-decreasing** order.  
> Merge `nums2` into `nums1` as one sorted array.  
> **Note:**
> - The number of elements initialized in `nums1` and `nums2` are `m` and `n` respectively.
> - You must merge the arrays in **place**, meaning you should not use extra space except for the given `nums1` array.

**LeetCode Link:** [88. Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/)

---

```
Example 1:

Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]

Example 2:

Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
```

---

## ✅ Constraints

- `nums1.length == m + n`
- `nums2.length == n`
- `0 <= m, n <= 200`
- `1 <= m + n <= 200`
- `-10⁹ <= nums1[i], nums2[i] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Merge Using Extra Space

**Approach:**  
Create a new array and merge both arrays into it.

```python
# Time Complexity: O(m + n)
# Space Complexity: O(m + n)
def merge(nums1, m, nums2, n):
    merged = []
    i, j = 0, 0
    while i < m and j < n:
        if nums1[i] < nums2[j]:
            merged.append(nums1[i])
            i += 1
        else:
            merged.append(nums2[j])
            j += 1
    while i < m:
        merged.append(nums1[i])
        i += 1
    while j < n:
        merged.append(nums2[j])
        j += 1
    nums1[:] = merged
```

---

### ⚙️ Level 2: Two Pointer Technique (Merge in Place)

**Approach:**  
Use two pointers starting from the end of both arrays to merge them into `nums1`.

```python
# Time Complexity: O(m + n)
# Space Complexity: O(1)
def merge(nums1, m, nums2, n):
    i, j, k = m - 1, n - 1, m + n - 1
    
    while i >= 0 and j >= 0:
        if nums1[i] > nums2[j]:
            nums1[k] = nums1[i]
            i -= 1
        else:
            nums1[k] = nums2[j]
            j -= 1
        k -= 1
    
    while j >= 0:
        nums1[k] = nums2[j]
        j -= 1
        k -= 1
```

---

### 🚀 Level 3: Optimized with Early Stopping

**Approach:**  
Implement a more optimized two-pointer solution with slight early stopping in case `nums2` is empty.

```python
# Time Complexity: O(m + n)
# Space Complexity: O(1)
def merge(nums1, m, nums2, n):
    i, j, k = m - 1, n - 1, m + n - 1
    
    while j >= 0:  # Since nums2 can be smaller than nums1
        if i >= 0 and nums1[i] > nums2[j]:
            nums1[k] = nums1[i]
            i -= 1
        else:
            nums1[k] = nums2[j]
            j -= 1
        k -= 1
```

---

## 🔗 Similar Problems

1. [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)
2. [88. Merge Sorted Array (Follow-up with multiple inputs)](https://leetcode.com/problems/merge-sorted-array/)
3. [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
4. [88. Merge Sorted Array (In-Place)](https://leetcode.com/problems/merge-sorted-array/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Merge Using Extra Space           | O(m + n)        | O(m + n)         |
| 2     | Two Pointer Technique             | O(m + n)        | O(1)             |
| 3     | Optimized Early Stopping          | O(m + n)        | O(1)             |

---

## 📌 Takeaway Points

- Merging sorted arrays is a classic problem that can be efficiently solved in linear time.
- Two pointers starting from the end of both arrays help avoid overwriting elements in `nums1`.
- Early stopping can reduce unnecessary operations in certain cases.

---
