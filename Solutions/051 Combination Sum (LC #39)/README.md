
---

# ➕ Problem: Combination Sum

## 📘 Problem Statement

> Given an array of distinct integers `candidates` and a target integer `target`, return all unique combinations of `candidates` where the candidate numbers sum to `target`.  
> The same number may be chosen from `candidates` an unlimited number of times.

**LeetCode Link:** [39. Combination Sum](https://leetcode.com/problems/combination-sum/)

---

```
Example 1:

Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]

Example 2:

Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
```

---

## ✅ Constraints

- `1 <= candidates.length <= 30`
- `2 <= candidates[i] <= 40`
- All elements in `candidates` are distinct.
- `1 <= target <= 40`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking)

**Approach:**  
Generate all combinations by trying every possible way to combine candidates, with no early exits or pruning.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def combinationSum(candidates, target):
    result = []
    
    def backtrack(start, path, target):
        if target == 0:
            result.append(path)
            return
        for i in range(start, len(candidates)):
            if candidates[i] > target:
                continue
            backtrack(i, path + [candidates[i]], target - candidates[i])

    backtrack(0, [], target)
    return result
```

---

### ⚙️ Level 2: Optimized Backtracking with Pruning

**Approach:**  
Apply pruning to skip unnecessary candidates and reduce the search space. This ensures that combinations do not exceed the target.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def combinationSum(candidates, target):
    result = []
    
    def backtrack(start, path, target):
        if target == 0:
            result.append(path)
            return
        for i in range(start, len(candidates)):
            if candidates[i] > target:
                break  # Pruning step: No need to consider numbers greater than the remaining target
            backtrack(i, path + [candidates[i]], target - candidates[i])

    candidates.sort()  # Sorting helps in pruning
    backtrack(0, [], target)
    return result
```

---

### 🚀 Level 3: Iterative Approach (with Dynamic Programming)

**Approach:**  
Use dynamic programming to generate all possible sums from 0 to the target, then generate combinations iteratively.

```python
# Time Complexity: O(n * target)
# Space Complexity: O(target)
def combinationSum(candidates, target):
    dp = [[] for _ in range(target + 1)]
    dp[0] = [[]]

    for i in range(1, target + 1):
        for num in candidates:
            if i - num >= 0:
                for comb in dp[i - num]:
                    dp[i].append(comb + [num])

    return dp[target]
```

---

## 🔗 Similar Problems

1. [40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/)
2. [216. Combination Sum III](https://leetcode.com/problems/combination-sum-iii/)
3. [77. Combinations](https://leetcode.com/problems/combinations/)
4. [40. Combination Sum II (With Duplicates)](https://leetcode.com/problems/combination-sum-ii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)       | O(2^n)          | O(n)             |
| 2     | Optimized Backtracking with Pruning | O(2^n)        | O(n)             |
| 3     | Iterative Approach (Dynamic Programming) | O(n * target) | O(target)        |

---

## 📌 Takeaway Points

- Backtracking is an effective approach for combinatorics problems, and pruning ensures efficiency.
- Sorting the candidates is useful for pruning and improving the logic.
- Dynamic programming can be used for optimization, especially when overlapping subproblems exist.

---
