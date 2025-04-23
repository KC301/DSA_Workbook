
---

# ➕ Problem: Trapping Rain Water

## 📘 Problem Statement

> Given `n` non-negative integers representing the heights of walls in a histogram, where the width of each bar is 1, compute how much water it is able to trap after raining.

**LeetCode Link:** [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

---

```
Example 1:

Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]  
Output: 6  
Explanation: The trapped water is 6 units, as shown in the diagram below.

Example 2:

Input: height = [4,2,0,3,2,5]  
Output: 9
```

---

## ✅ Constraints

- `n == height.length`
- `2 <= n <= 10⁵`
- `0 <= height[i] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Double Loop)

**Approach:**  
For each bar, find the maximum height on the left and right side, and calculate the water it can trap.

```python
# Time Complexity: O(n²)
# Space Complexity: O(1)
def trap(height):
    n = len(height)
    water_trapped = 0

    for i in range(1, n - 1):
        left_max = max(height[:i + 1])
        right_max = max(height[i:])
        water_trapped += max(0, min(left_max, right_max) - height[i])

    return water_trapped
```

---

### ⚙️ Level 2: Dynamic Programming (Precompute Left and Right Maximums)

**Approach:**  
Use dynamic programming to precompute the left and right maximum heights for each position.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def trap(height):
    n = len(height)
    if n <= 2:
        return 0

    left_max = [0] * n
    right_max = [0] * n
    water_trapped = 0

    left_max[0] = height[0]
    for i in range(1, n):
        left_max[i] = max(left_max[i - 1], height[i])

    right_max[n - 1] = height[n - 1]
    for i in range(n - 2, -1, -1):
        right_max[i] = max(right_max[i + 1], height[i])

    for i in range(1, n - 1):
        water_trapped += max(0, min(left_max[i], right_max[i]) - height[i])

    return water_trapped
```

---

### 🚀 Level 3: Two-Pointer Approach (Optimal)

**Approach:**  
Use two pointers to traverse the height array from both ends and compute trapped water.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def trap(height):
    left, right = 0, len(height) - 1
    left_max, right_max = height[left], height[right]
    water_trapped = 0

    while left < right:
        if height[left] < height[right]:
            left += 1
            left_max = max(left_max, height[left])
            water_trapped += max(0, left_max - height[left])
        else:
            right -= 1
            right_max = max(right_max, height[right])
            water_trapped += max(0, right_max - height[right])

    return water_trapped
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Double Loop)        | O(n²)           | O(1)             |
| 2     | Dynamic Programming (Left & Right Max Arrays) | O(n) | O(n)             |
| 3     | Two Pointers (Optimal)           | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)
2. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
3. [84. Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)
4. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
5. [31. Next Permutation](https://leetcode.com/problems/next-permutation/)

---

## 📌 Takeaway Points

- Brute force is straightforward but highly inefficient.
- **Dynamic programming** reduces redundant calculations by storing left and right max values.
- The **two-pointer technique** is optimal:
  - Track two boundary heights and fill between them to accumulate water.

---
