# 🔺 Problem: 3Sum

## 📘 Problem Statement

> Given an integer array `nums`, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.  
> Notice that the solution set must not contain duplicate triplets.

**LeetCode Link:** [15. 3Sum](https://leetcode.com/problems/3sum/)

---

```

Example 1:

Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
Notice that the order of the output and the order of the triplets does not matter.
Example 2:

Input: nums = [0,1,1]
Output: []
Explanation: The only possible triplet does not sum up to 0.
Example 3:

Input: nums = [0,0,0]
Output: [[0,0,0]]
Explanation: The only possible triplet sums up to 0.

```

## ✅ Constraints

- `3 <= nums.length <= 3000`
- `-10⁵ <= nums[i] <= 10⁵`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Three Loops + Set for Duplicates

**Approach:** Check every triplet, and use a set to avoid duplicates.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(n)
def threeSum(nums):
    result = set()
    n = len(nums)
    
    for i in range(n):
        for j in range(i+1, n):
            for k in range(j+1, n):
                if nums[i] + nums[j] + nums[k] == 0:
                    triplet = tuple(sorted([nums[i], nums[j], nums[k]]))
                    result.add(triplet)
                    
    return [list(triplet) for triplet in result]
```

---

### ⚙️ Level 2: HashSet + Two Loops

**Approach:** For each number, use a set to find two-sum that complements to zero.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def threeSum(nums):
    nums.sort()
    result = set()
    
    for i in range(len(nums)):
        target = -nums[i]
        seen = set()
        for j in range(i+1, len(nums)):
            complement = target - nums[j]
            if complement in seen:
                result.add((nums[i], complement, nums[j]))
            seen.add(nums[j])
    
    return [list(triplet) for triplet in result]
```

---

### 🚀 Level 3: Two-Pointer Approach After Sorting

**Approach:** Sort the array, fix one number and use two pointers to find pairs summing to the negative of the fixed number.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1) (ignoring output)
def threeSum(nums):
    nums.sort()
    res = []
    
    for i in range(len(nums)):
        if i > 0 and nums[i] == nums[i-1]:
            continue  # skip duplicates
        
        left, right = i+1, len(nums)-1
        while left < right:
            s = nums[i] + nums[left] + nums[right]
            if s == 0:
                res.append([nums[i], nums[left], nums[right]])
                left += 1
                right -= 1
                while left < right and nums[left] == nums[left - 1]:
                    left += 1
                while left < right and nums[right] == nums[right + 1]:
                    right -= 1
            elif s < 0:
                left += 1
            else:
                right -= 1
                
    return res
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Triple Loop + Set               | O(n³)           | O(n)             |
| 2     | HashSet per Element             | O(n²)           | O(n)             |
| 3     | Two-Pointer after Sorting       | O(n²)           | O(1)*            |

> *Excludes space for output result.

---

## 🔗 Similar Problems

1. [16. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)
2. [18. 4Sum](https://leetcode.com/problems/4sum/)
3. [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)

---

## 📌 Takeaway Points

- Sorting followed by two-pointer is the most efficient general technique for 2-sum/3-sum problems.
- Always handle duplicates carefully when building result sets.
- Hashing can be a good stepping stone when optimizing from brute force.

---
