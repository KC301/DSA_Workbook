
---

# ➕ Problem: Subsets II

## 📘 Problem Statement

> Given an integer array `nums` that may contain duplicates, return all possible subsets (the power set).  
> The solution set must not contain duplicate subsets.

**LeetCode Link:** [90. Subsets II](https://leetcode.com/problems/subsets-ii/)

---

```
Example 1:

Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]

Example 2:

Input: nums = [0]
Output: [[],[0]]
```

---

## ✅ Constraints

- `1 <= nums.length <= 10`
- `-10⁹ <= nums[i] <= 10⁹`
- `nums[i]` is a unique element in the set.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Sorting and Deduplication

**Approach:**  
Generate all subsets as in Problem 78 and then remove duplicate subsets by sorting and using a set for uniqueness.

```python
# Time Complexity: O(2^n * n log n)
# Space Complexity: O(2^n)
def subsetsWithDup(nums):
    nums.sort()
    result = []
    n = len(nums)
    for i in range(2 ** n):
        subset = []
        for j in range(n):
            if (i >> j) & 1:
                subset.append(nums[j])
        result.append(subset)
    return sorted(result)
```

---

### ⚙️ Level 2: Backtracking with Deduplication

**Approach:**  
Use backtracking to generate subsets while ensuring that the same subset is not included more than once by checking for duplicates in the recursive calls.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def subsetsWithDup(nums):
    result = []
    nums.sort()

    def backtrack(start, path):
        result.append(path)
        for i in range(start, len(nums)):
            if i > start and nums[i] == nums[i - 1]:
                continue
            backtrack(i + 1, path + [nums[i]])

    backtrack(0, [])
    return result
```

---

### 🚀 Level 3: Iterative Approach with Deduplication

**Approach:**  
Iteratively generate subsets and handle duplicates by checking if the current subset is a new combination.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(2^n)
def subsetsWithDup(nums):
    nums.sort()
    result = [[]]
    start = 0
    for i in range(len(nums)):
        if i > 0 and nums[i] == nums[i - 1]:
            start = len(result)  # Start from the last index to avoid duplicates
        n = len(result)
        for j in range(start, n):
            result.append(result[j] + [nums[i]])
    return result
```

---

## 🔗 Similar Problems

1. [78. Subsets](https://leetcode.com/problems/subsets/)
2. [46. Permutations](https://leetcode.com/problems/permutations/)
3. [77. Combinations](https://leetcode.com/problems/combinations/)
4. [90. Subsets II (With Duplicate Handling)](https://leetcode.com/problems/subsets-ii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force with Sorting         | O(2^n * n log n) | O(2^n)           |
| 2     | Backtracking with Deduplication  | O(2^n)          | O(n)             |
| 3     | Iterative Approach with Deduplication | O(2^n)       | O(2^n)           |

---

## 📌 Takeaway Points

- Sorting the input is essential to handle duplicates in subsets generation.
- Backtracking offers a flexible approach to avoid duplicates by controlling which elements are included in each subset.
- The iterative approach provides an elegant solution to generate subsets without recursion.

---
