
---

# ➕ Problem: Subsets

## 📘 Problem Statement

> Given an integer array `nums` of unique elements, return all possible subsets (the power set).  
> The solution set must not contain duplicate subsets.

**LeetCode Link:** [78. Subsets](https://leetcode.com/problems/subsets/)

---

```
Example 1:

Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

Example 2:

Input: nums = [0]
Output: [[],[0]]
```

---

## ✅ Constraints

- `1 <= nums.length <= 10`
- `-10⁹ <= nums[i] <= 10⁹`
- All the numbers of `nums` are unique.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Generate All Subsets)

**Approach:**  
Generate all possible subsets of `nums` by iterating through all subsets of different sizes and adding elements one by one.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(2^n)
def subsets(nums):
    result = []
    n = len(nums)
    for i in range(2 ** n):
        subset = []
        for j in range(n):
            if (i >> j) & 1:
                subset.append(nums[j])
        result.append(subset)
    return result
```

---

### ⚙️ Level 2: Backtracking

**Approach:**  
Use backtracking to generate subsets by either including or excluding each element.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def subsets(nums):
    result = []
    
    def backtrack(start, path):
        result.append(path)
        for i in range(start, len(nums)):
            backtrack(i + 1, path + [nums[i]])

    backtrack(0, [])
    return result
```

---

### 🚀 Level 3: Iterative Approach

**Approach:**  
Start with the empty set and iteratively add each element to all the subsets found so far.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(2^n)
def subsets(nums):
    result = [[]]
    for num in nums:
        result += [item + [num] for item in result]
    return result
```

---

## 🔗 Similar Problems

1. [90. Subsets II](https://leetcode.com/problems/subsets-ii/)
2. [78. Subsets (Iterative approach)](https://leetcode.com/problems/subsets/)
3. [46. Permutations](https://leetcode.com/problems/permutations/)
4. [77. Combinations](https://leetcode.com/problems/combinations/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Generate All Subsets) | O(2^n)          | O(2^n)           |
| 2     | Backtracking                     | O(2^n)          | O(n)             |
| 3     | Iterative Approach               | O(2^n)          | O(2^n)           |

---

## 📌 Takeaway Points

- All subsets of a set of size `n` are generated in `O(2^n)` time.
- The backtracking approach allows more control over subset generation, especially useful in problems with additional constraints.
- The iterative approach is a clean and elegant way to generate subsets without recursion.

---
