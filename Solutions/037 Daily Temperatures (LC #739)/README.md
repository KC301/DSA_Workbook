
---

# ➕ Problem: Daily Temperatures

## 📘 Problem Statement

> Given an array of integers `temperatures` represents the daily temperatures,  
> return an array `answer` such that `answer[i]` is the number of days you have to wait after the `i-th` day to get a warmer temperature.  
> If there is no future day for which this is possible, put `0` instead.

**LeetCode Link:** [739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)

---

```
Example 1:

Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]

Example 2:

Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]

Example 3:

Input: temperatures = [30,60,90]
Output: [1,1,0]
```

---

## ✅ Constraints

- `1 <= temperatures.length <= 10⁵`
- `30 <= temperatures[i] <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:**  
For each day, loop through the future days to find the first warmer temperature. This results in a nested loop.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def dailyTemperatures(temperatures):
    n = len(temperatures)
    answer = [0] * n
    for i in range(n):
        for j in range(i + 1, n):
            if temperatures[j] > temperatures[i]:
                answer[i] = j - i
                break
    return answer
```

---

### ⚙️ Level 2: Backward Iteration with Skipping

**Approach:**  
Traverse the array from the end and use previously computed results to skip multiple days when possible.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def dailyTemperatures(temperatures):
    n = len(temperatures)
    answer = [0] * n
    for i in range(n - 2, -1, -1):
        j = i + 1
        while j < n and temperatures[j] <= temperatures[i]:
            if answer[j] == 0:
                j = n
            else:
                j += answer[j]
        if j < n:
            answer[i] = j - i
    return answer
```

---

### 🚀 Level 3: Monotonic Stack

**Approach:**  
Use a stack to keep indices of decreasing temperatures. Pop from the stack until a warmer temperature is found.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def dailyTemperatures(temperatures):
    n = len(temperatures)
    answer = [0] * n
    stack = []

    for i in range(n):
        while stack and temperatures[i] > temperatures[stack[-1]]:
            prev_index = stack.pop()
            answer[prev_index] = i - prev_index
        stack.append(i)
    
    return answer
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force                        | O(n²)           | O(n)             |
| 2     | Skipping with Backward Iteration   | O(n)            | O(n)             |
| 3     | Monotonic Stack                    | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [496. Next Greater Element I](https://leetcode.com/problems/next-greater-element-i/)
2. [503. Next Greater Element II](https://leetcode.com/problems/next-greater-element-ii/)
3. [901. Online Stock Span](https://leetcode.com/problems/online-stock-span/)

---

## 📌 Takeaway Points

- Brute force works but is inefficient for large inputs (`O(n²)`).
- Monotonic stacks are ideal for "next greater element" problems.
- Stack-based approaches guarantee linear time by visiting each element only once.

---
