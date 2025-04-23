
---

# ➕ Problem: Container With Most Water

## 📘 Problem Statement

> You are given an integer array `height` of length `n`.  
> There are `n` vertical lines drawn such that the two endpoints of the `iᵗʰ` line are at `(i, 0)` and `(i, height[i])`.  
> Find two lines that together with the x-axis form a container, such that the container contains the most water.  
> Return the maximum amount of water a container can store.

**LeetCode Link:** [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)

---

```
Example 1:

Input: height = [1,8,6,2,5,4,8,3,7]  
Output: 49  
Explanation: The lines at index 1 and 8 form the container with the most water.

Example 2:

Input: height = [1,1]  
Output: 1
```

---

## ✅ Constraints

- `n == height.length`
- `2 <= n <= 10⁵`
- `0 <= height[i] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:**  
Check every pair of lines and compute the area they form.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def maxArea(height):
    max_area = 0
    for i in range(len(height)):
        for j in range(i + 1, len(height)):
            width = j - i
            h = min(height[i], height[j])
            max_area = max(max_area, width * h)
    return max_area
```

---

### ⚙️ Level 2: Optimized Brute Force (Skip Redundant Heights)

**Approach:**  
Skip inner lines that are not taller than previously seen boundaries.

```python
# Time Complexity: ~O(n^2) worst-case
# Space Complexity: O(1)
def maxArea(height):
    max_area = 0
    n = len(height)
    
    for i in range(n):
        for j in range(n - 1, i, -1):
            if height[j] >= height[i]:
                area = (j - i) * height[i]
                max_area = max(max_area, area)
                break
            else:
                area = (j - i) * min(height[i], height[j])
                max_area = max(max_area, area)

    return max_area
```

---

### 🚀 Level 3: Two-Pointer Technique

**Approach:**  
Use two pointers moving toward each other. Always move the pointer with the smaller height.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def maxArea(height):
    left, right = 0, len(height) - 1
    max_area = 0
    
    while left < right:
        width = right - left
        h = min(height[left], height[right])
        max_area = max(max_area, width * h)
        
        if height[left] < height[right]:
            left += 1
        else:
            right -= 1
            
    return max_area
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force                      | O(n²)           | O(1)             |
| 2     | Optimized Brute (Early Break)    | ~O(n²)          | O(1)             |
| 3     | Two Pointers                     | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)
2. [407. Trapping Rain Water II](https://leetcode.com/problems/trapping-rain-water-ii/)
3. [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
4. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
5. [862. Shortest Subarray with Sum at Least K](https://leetcode.com/problems/shortest-subarray-with-sum-at-least-k/)

---

## 📌 Takeaway Points

- Always consider **width × height** when working with containers.
- Moving the shorter line is a greedy strategy that **ensures coverage of all widths** while **favoring taller lines**.
- Two-pointer technique is optimal for container and array-based boundary problems.

---
