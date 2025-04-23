
---

# ➕ Problem: 3Sum

## 📘 Problem Statement

> Given an integer array `nums`, return all the triplets `[nums[i], nums[j], nums[k]]` such that:
> - `i != j`,  
> - `i != k`,  
> - `j != k`,  
> and  
> - `nums[i] + nums[j] + nums[k] == 0`.
> 
> Notice that the solution set must not contain duplicate triplets.

**LeetCode Link:** [15. 3Sum](https://leetcode.com/problems/3sum/)

---

```
Example 1:

Input: nums = [-1,0,1,2,-1,-4]  
Output: [[-1,-1,2],[-1,0,1]]

Example 2:

Input: nums = [0,1,1]  
Output: []

Example 3:

Input: nums = [0,0,0]  
Output: [[0,0,0]]
```

---

## ✅ Constraints

- `3 <= nums.length <= 3000`
- `-10⁵ <= nums[i] <= 10⁵`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Triple Nested Loops)

**Approach:**  
Check all triplets in the array and add those that sum to zero. Use a set to handle duplicates.

```python
# Time Complexity: O(n³)
# Space Complexity: O(1)
def threeSum(nums):
    result = set()
    n = len(nums)

    for i in range(n - 2):
        for j in range(i + 1, n - 1):
            for k in range(j + 1, n):
                if nums[i] + nums[j] + nums[k] == 0:
                    result.add(tuple(sorted([nums[i], nums[j], nums[k]])))

    return list(result)
```

---

### ⚙️ Level 2: Sorting + Two Pointers (Optimized)

**Approach:**  
Sort the array first, then use two pointers to find pairs that sum to a specific target, adjusting the target as you iterate through the array.

```python
# Time Complexity: O(n²)
# Space Complexity: O(1)
def threeSum(nums):
    nums.sort()
    result = []
    
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i - 1]:
            continue  # Skip duplicates
        
        left, right = i + 1, len(nums) - 1
        while left < right:
            total = nums[i] + nums[left] + nums[right]
            if total == 0:
                result.append([nums[i], nums[left], nums[right]])
                # Skip duplicates for left and right
                while left < right and nums[left] == nums[left + 1]:
                    left += 1
                while left < right and nums[right] == nums[right - 1]:
                    right -= 1
                left += 1
                right -= 1
            elif total < 0:
                left += 1
            else:
                right -= 1

    return result
```

---

### 🚀 Level 3: Optimized Sorting with Early Breaks

**Approach:**  
The same two-pointer technique as Level 2 but with early breaks to optimize further and reduce unnecessary computations.

```python
# Time Complexity: O(n²)
# Space Complexity: O(1)
def threeSum(nums):
    nums.sort()
    result = []
    
    for i in range(len(nums) - 2):
        if i > 0 and nums[i] == nums[i - 1]:
            continue  # Skip duplicates
        
        left, right = i + 1, len(nums) - 1
        while left < right:
            total = nums[i] + nums[left] + nums[right]
            if total == 0:
                result.append([nums[i], nums[left], nums[right]])
                # Skip duplicates for left and right
                while left < right and nums[left] == nums[left + 1]:
                    left += 1
                while left < right and nums[right] == nums[right - 1]:
                    right -= 1
                left += 1
                right -= 1
            elif total < 0:
                left += 1
            else:
                right -= 1
            # Early break if total is positive and moving left won't help
            if nums[i] + nums[left] > 0:
                break

    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Triple Loops)       | O(n³)           | O(1)             |
| 2     | Sorting + Two Pointers           | O(n²)           | O(1)             |
| 3     | Optimized Two-Pointer + Early Break | O(n²)           | O(1)             |

---

## 🔗 Similar Problems

1. [18. 4Sum](https://leetcode.com/problems/4sum/)
2. [16. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)
3. [259. 3Sum Smaller](https://leetcode.com/problems/3sum-smaller/)
4. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
5. [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

---

## 📌 Takeaway Points

- **Sorting** is crucial for applying the two-pointer approach efficiently.
- **Skip duplicates** in the sorted array to avoid unnecessary computations and duplicate triplets.
- The **two-pointer technique** allows us to find valid triplets in linear time after sorting, significantly improving performance compared to brute-force solutions.

---
