
---

# ➕ Problem: Median of Two Sorted Arrays

## 📘 Problem Statement

> Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return **the median** of the two sorted arrays.  
> The overall run time complexity should be **O(log (m+n))**.

**LeetCode Link:** [4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)

---

```
Example 1:

Input: nums1 = [1,3], nums2 = [2]  
Output: 2.0  
Explanation: merged array = [1,2,3], median = 2

Example 2:

Input: nums1 = [1,2], nums2 = [3,4]  
Output: 2.5  
Explanation: merged array = [1,2,3,4], median = (2 + 3) / 2 = 2.5
```

---

## ✅ Constraints

- `nums1.length == m`
- `nums2.length == n`
- `0 <= m <= 1000`
- `0 <= n <= 1000`
- `1 <= m + n <= 2000`
- `-10⁶ <= nums1[i], nums2[i] <= 10⁶`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Merge and Median

**Approach:**  
Merge the arrays, sort them, and return the middle element(s).

```python
# Time Complexity: O((m+n) log (m+n))
# Space Complexity: O(m+n)
def findMedianSortedArrays(nums1, nums2):
    merged = sorted(nums1 + nums2)
    n = len(merged)
    if n % 2 == 0:
        return (merged[n//2 - 1] + merged[n//2]) / 2
    else:
        return merged[n//2]
```

---

### ⚙️ Level 2: Merge Without Sorting

**Approach:**  
Use two pointers to merge without full sorting and compute the median on the fly.

```python
# Time Complexity: O(m + n)
# Space Complexity: O(m + n)
def findMedianSortedArrays(nums1, nums2):
    merged = []
    i = j = 0

    while i < len(nums1) and j < len(nums2):
        if nums1[i] < nums2[j]:
            merged.append(nums1[i])
            i += 1
        else:
            merged.append(nums2[j])
            j += 1
    merged.extend(nums1[i:])
    merged.extend(nums2[j:])
    
    n = len(merged)
    if n % 2 == 0:
        return (merged[n//2 - 1] + merged[n//2]) / 2
    else:
        return merged[n//2]
```

---

### 🚀 Level 3: Binary Search on Shorter Array

**Approach:**  
Use binary search to partition both arrays such that the left parts and right parts are valid for median calculation.

```python
# Time Complexity: O(log(min(m, n)))
# Space Complexity: O(1)
def findMedianSortedArrays(nums1, nums2):
    if len(nums1) > len(nums2):
        nums1, nums2 = nums2, nums1

    m, n = len(nums1), len(nums2)
    total = m + n
    half = total // 2

    left, right = 0, m
    while True:
        i = (left + right) // 2
        j = half - i

        Aleft = nums1[i - 1] if i > 0 else float('-inf')
        Aright = nums1[i] if i < m else float('inf')
        Bleft = nums2[j - 1] if j > 0 else float('-inf')
        Bright = nums2[j] if j < n else float('inf')

        if Aleft <= Bright and Bleft <= Aright:
            if total % 2 == 0:
                return (max(Aleft, Bleft) + min(Aright, Bright)) / 2
            else:
                return min(Aright, Bright)
        elif Aleft > Bright:
            right = i - 1
        else:
            left = i + 1
```

---

## 🔗 Similar Problems

1. [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)
2. [88. Merge Sorted Array](https://leetcode.com/problems/merge-sorted-array/)
3. [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity       | Space Complexity |
|-------|-----------------------------------|------------------------|------------------|
| 1     | Merge and Sort                    | O((m+n) log(m+n))      | O(m+n)           |
| 2     | Manual Merge                      | O(m + n)               | O(m+n)           |
| 3     | Binary Search on Shorter Array    | O(log(min(m, n)))      | O(1)             |

---

## 📌 Takeaway Points

- The median of two sorted arrays can be found without merging, using binary partitioning.
- Always binary search on the smaller array to optimize.
- Classic divide-and-conquer problem; great example of binary search in an unusual context.

---
