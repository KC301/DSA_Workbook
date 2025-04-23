# ➕ Problem: Two Sum

## 📘 Problem Statement

> Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.  
> You may assume that each input would have **exactly one solution**, and you may not use the same element twice.  
> You can return the answer in any order.

**LeetCode Link:** [1. Two Sum](https://leetcode.com/problems/two-sum/)

---

```

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

```

## ✅ Constraints

- `2 <= nums.length <= 10⁴`
- `-10⁹ <= nums[i] <= 10⁹`
- `-10⁹ <= target <= 10⁹`
- **Exactly one solution exists**

---

## 🧠 Python Solutions (All Using HashMap)

---

### 🧪 Level 1: HashMap Post-Scan (Two-Pass)

**Approach:**  
First pass: Store all values and their indices in a hashmap.  
Second pass: For each element, check if the complement exists in the map and return the pair if indices are different.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def twoSum(nums, target):
    num_to_index = {}
    
    # First pass: fill the hashmap
    for i in range(len(nums)):
        num_to_index[nums[i]] = i

    # Second pass: search for complement
    for i in range(len(nums)):
        complement = target - nums[i]
        if complement in num_to_index and num_to_index[complement] != i:
            return [i, num_to_index[complement]]
```

---

### ⚙️ Level 2: HashMap Inline (Single-Pass)

**Approach:**  
Iterate once and store each number as you go. Before storing, check if its complement is already in the map.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def twoSum(nums, target):
    num_to_index = {}
    
    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_to_index:
            return [num_to_index[complement], i]
        num_to_index[num] = i
```

---

### 🚀 Level 3: HashMap with Optimized Conditions and Early Return

**Approach:**  
Same as Level 2 but written with more optimal access pattern and early returns for better readability and efficiency in practice.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def twoSum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        if (target - num) in seen:
            return [seen[target - num], i]
        seen[num] = i
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | HashMap (Two-Pass)               | O(n)            | O(n)             |
| 2     | HashMap (Single-Pass)            | O(n)            | O(n)             |
| 3     | Optimized Single-Pass HashMap    | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
2. [653. Two Sum IV - Input is a BST](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)
3. [1. Two Sum (Follow-up with multiple results)](https://leetcode.com/problems/two-sum/description/)

---

## 📌 Takeaway Points

- HashMap makes solving this problem in linear time straightforward.
- Single-pass approaches save memory and simplify logic.
- Always ensure not to use the same element twice by checking indices properly.

---
