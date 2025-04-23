# 🧮 Problem: Longest Consecutive Sequence

## 📘 Problem Statement

> Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.  
You must write an algorithm that runs in `O(n)` time.

**LeetCode Link:** [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

---

```

Example 1:

Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
Example 2:

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Output: 9
Example 3:

Input: nums = [1,0,1,2]
Output: 3

```

## ✅ Constraints

- `0 <= nums.length <= 10⁵`
- `-10⁹ <= nums[i] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:** For each number, try to find the next consecutive numbers by scanning the array.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def longestConsecutive(nums):
    max_len = 0
    for num in nums:
        current = num
        length = 1
        while current + 1 in nums:
            current += 1
            length += 1
        max_len = max(max_len, length)
    return max_len
```

---

### ⚙️ Level 2: Sort + Linear Scan

**Approach:** Sort the array and scan linearly while skipping duplicates and counting consecutive numbers.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(1) or O(n) (depends on sort implementation)
def longestConsecutive(nums):
    if not nums:
        return 0
    nums.sort()
    max_len = 1
    current_len = 1
    
    for i in range(1, len(nums)):
        if nums[i] == nums[i-1]:
            continue
        elif nums[i] == nums[i-1] + 1:
            current_len += 1
        else:
            max_len = max(max_len, current_len)
            current_len = 1
            
    return max(max_len, current_len)
```

---

### 🚀 Level 3: HashSet for O(n)

**Approach:** Use a set to check sequence starts efficiently and avoid repeated work.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def longestConsecutive(nums):
    num_set = set(nums)
    max_len = 0
    
    for num in num_set:
        if num - 1 not in num_set:  # start of a sequence
            current = num
            length = 1
            while current + 1 in num_set:
                current += 1
                length += 1
            max_len = max(max_len, length)
    
    return max_len
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                    | Time Complexity | Space Complexity |
|-------|-----------------------------|-----------------|------------------|
| 1     | Brute Force Scan            | O(n²)           | O(1)             |
| 2     | Sort + Scan                 | O(n log n)      | O(1)/O(n)        |
| 3     | HashSet (Optimal)           | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [674. Longest Continuous Increasing Subsequence](https://leetcode.com/problems/longest-continuous-increasing-subsequence/)
2. [300. Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/)
3. [139. Word Break](https://leetcode.com/problems/word-break/)

---

## 📌 Takeaway Points

- Use a `set` to enable O(1) average time checks for consecutive elements.
- Only start counting sequences from elements that are not preceded.
- Sorting works but violates the O(n) time requirement.

---
