
---

# ➕ Problem: Largest Rectangle in Histogram

## 📘 Problem Statement

> Given an array of integers `heights` representing the histogram's bar heights where the width of each bar is `1`, find the area of the largest rectangle in the histogram.  

**LeetCode Link:** [84. Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)

---

```
Example 1:

Input: heights = [2,1,5,6,2,3]
Output: 10
Explanation: The largest rectangle is formed by the height 5 and width 2, which has an area = 5 * 2 = 10.

Example 2:

Input: heights = [2,4]
Output: 4
```

---

## ✅ Constraints

- `1 <= heights.length <= 10⁴`
- `0 <= heights[i] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Checking all pairs of heights)

**Approach:**  
Use a brute-force approach to check each possible rectangle in the histogram. For each bar, calculate the area by extending left and right until the height is smaller than the current bar. This solution has high time complexity but is easy to understand.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def largestRectangleArea(heights):
    n = len(heights)
    max_area = 0
    
    for i in range(n):
        min_height = heights[i]
        for j in range(i, n):
            min_height = min(min_height, heights[j])
            max_area = max(max_area, min_height * (j - i + 1))
    
    return max_area
```

---

### ⚙️ Level 2: Using Stack to Optimize (Single Pass)

**Approach:**  
Use a stack to keep track of the bars in increasing order of height. When a bar is smaller than the bar at the top of the stack, it means we have found a potential right boundary for the largest rectangle that can be formed with the bar at the top of the stack as the shortest bar. This reduces the time complexity to `O(n)`.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def largestRectangleArea(heights):
    stack = []
    max_area = 0
    heights.append(0)  # Add a sentinel value to flush out remaining bars
    
    for i in range(len(heights)):
        while stack and heights[i] < heights[stack[-1]]:
            h = heights[stack.pop()]
            w = i if not stack else i - stack[-1] - 1
            max_area = max(max_area, h * w)
        stack.append(i)
    
    return max_area
```

---

### 🚀 Level 3: Optimized Stack Approach (Single Pass)

**Approach:**  
This approach is almost identical to Level 2, but it optimizes the conditions for popping elements from the stack and calculates the rectangle's area more efficiently by considering all possible boundaries as we go through the bars in a single pass.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def largestRectangleArea(heights):
    stack = []
    max_area = 0
    heights.append(0)  # Sentinel value to empty the stack at the end
    
    for i in range(len(heights)):
        while stack and heights[i] < heights[stack[-1]]:
            h = heights[stack.pop()]
            w = i if not stack else i - stack[-1] - 1
            max_area = max(max_area, h * w)
        stack.append(i)
    
    return max_area
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (Checking all pairs)   | O(n^2)          | O(1)             |
| 2     | Stack with Single Pass Optimization| O(n)            | O(n)             |
| 3     | Optimized Stack with Sentinel      | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [85. Maximal Rectangle](https://leetcode.com/problems/maximal-rectangle/)
2. [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)
3. [84. Largest Rectangle in Histogram (Optimization Variation)](https://leetcode.com/problems/largest-rectangle-in-histogram/)

---

## 📌 Takeaway Points

- A brute-force solution checks all possible pairs, but its time complexity makes it inefficient for larger inputs.
- The **stack-based approach** reduces time complexity to **O(n)** by processing each bar only once.
- Using a **sentinel value** at the end ensures all bars are processed and removed from the stack, making the logic simpler and cleaner.

---
