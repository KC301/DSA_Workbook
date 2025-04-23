
---

# ➕ Problem: Combination Sum II

## 📘 Problem Statement

> Given a collection of candidate numbers (`candidates`) and a target number (`target`), find all unique combinations in `candidates` where the candidate numbers sum to `target`.  
> Each number in `candidates` may only be used once in the combination.

**LeetCode Link:** [40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/)

---

```
Example 1:

Input: candidates = [10,1,2,7,6,5], target = 8
Output: [[1,2,5],[1,7],[2,6]]

Example 2:

Input: candidates = [2,5,2,1,2], target = 5
Output: [[1,2,2],[5]]
```

---

## ✅ Constraints

- `1 <= candidates.length <= 100`
- `1 <= candidates[i] <= 50`
- All elements of `candidates` are positive integers.
- The input list `candidates` is not sorted.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking with Deduplication)

**Approach:**  
Generate all possible combinations and eliminate duplicates by sorting the input and skipping over repeated candidates.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def combinationSum2(candidates, target):
    result = []
    candidates.sort()

    def backtrack(start, path, target):
        if target == 0:
            result.append(path)
            return
        for i in range(start, len(candidates)):
            if i > start and candidates[i] == candidates[i - 1]:
                continue  # Skip duplicates
            if candidates[i] > target:
                break  # No point in continuing if the number exceeds the target
            backtrack(i + 1, path + [candidates[i]], target - candidates[i])

    backtrack(0, [], target)
    return result
```

---

### ⚙️ Level 2: Optimized Backtracking (Handling Duplicates in Recursion)

**Approach:**  
Same as Level 1 but with more optimized handling of duplicates and pruning to avoid unnecessary branches in the recursion.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def combinationSum2(candidates, target):
    result = []
    candidates.sort()

    def backtrack(start, path, target):
        if target == 0:
            result.append(path)
            return
        for i in range(start, len(candidates)):
            if i > start and candidates[i] == candidates[i - 1]:
                continue  # Skip duplicate elements to avoid redundant combinations
            if candidates[i] > target:
                break  # No need to continue if the number exceeds the target
            backtrack(i + 1, path + [candidates[i]], target - candidates[i])

    backtrack(0, [], target)
    return result
```

---

### 🚀 Level 3: Dynamic Programming with Backtracking

**Approach:**  
Use dynamic programming to precompute possible sums and avoid recomputation of overlapping subproblems while generating combinations.

```python
# Time Complexity: O(n * target)
# Space Complexity: O(target)
def combinationSum2(candidates, target):
    dp = [[] for _ in range(target + 1)]
    dp[0] = [[]]

    for num in candidates:
        for i in range(target, num - 1, -1):
            for comb in dp[i - num]:
                dp[i].append(comb + [num])

    return dp[target]
```

---

## 🔗 Similar Problems

1. [39. Combination Sum](https://leetcode.com/problems/combination-sum/)
2. [216. Combination Sum III](https://leetcode.com/problems/combination-sum-iii/)
3. [77. Combinations](https://leetcode.com/problems/combinations/)
4. [40. Combination Sum II (With Duplicates)](https://leetcode.com/problems/combination-sum-ii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking with Deduplication) | O(2^n)          | O(n)             |
| 2     | Optimized Backtracking (Handling Duplicates)  | O(2^n)          | O(n)             |
| 3     | Dynamic Programming with Backtracking | O(n * target)  | O(target)        |

---

## 📌 Takeaway Points

- **Deduplication** in combinatorics problems is crucial when the input contains repeated elements. Sorting the array before the backtracking ensures this is handled effectively.
- **Pruning** techniques (such as breaking when the candidate exceeds the remaining target) significantly improve the performance of backtracking solutions.
- **Dynamic Programming** can be applied when combinations involve overlapping subproblems to reduce the overall complexity.

---
