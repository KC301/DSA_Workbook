
---

# ➕ Problem: Candy

## 📘 Problem Statement

> There are `n` children standing in a line. Each child is assigned a rating value `ratings[i]`.  
> You are responsible for distributing candies to these children. Each child gets at least one candy.  
> Children with a higher rating get more candies than their neighbors.  
> Return the minimum number of candies you need to distribute to the children.

**LeetCode Link:** [135. Candy](https://leetcode.com/problems/candy/)

---

```
Example 1:

Input: ratings = [1,0,2]
Output: 5
Explanation: You can distribute candies to the children as follows: [2, 1, 2].

Example 2:

Input: ratings = [1,2,2]
Output: 4
Explanation: You can distribute candies to the children as follows: [1, 2, 1].

```

---

## ✅ Constraints

- `n == ratings.length`
- `1 <= n <= 2 * 10⁴`
- `0 <= ratings[i] <= 2 * 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Naive Approach)

**Approach:**  
The brute-force approach starts by giving each child 1 candy and then checks for every pair of children to adjust the candy distribution. This approach is inefficient as it requires multiple passes and comparisons to adjust the candies.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def candy(ratings):
    n = len(ratings)
    candies = [1] * n
    
    for i in range(1, n):
        if ratings[i] > ratings[i - 1]:
            candies[i] = candies[i - 1] + 1
    
    for i in range(n - 2, -1, -1):
        if ratings[i] > ratings[i + 1]:
            candies[i] = max(candies[i], candies[i + 1] + 1)
    
    return sum(candies)
```

---

### ⚙️ Level 2: Greedy Approach (Two-Pass)

**Approach:**  
The greedy approach is more efficient. We make two passes over the ratings:
1. The first pass ensures that children with higher ratings get more candies than their left neighbor.
2. The second pass ensures that children with higher ratings get more candies than their right neighbor.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def candy(ratings):
    n = len(ratings)
    candies = [1] * n
    
    # First pass: left to right
    for i in range(1, n):
        if ratings[i] > ratings[i - 1]:
            candies[i] = candies[i - 1] + 1
    
    # Second pass: right to left
    for i in range(n - 2, -1, -1):
        if ratings[i] > ratings[i + 1]:
            candies[i] = max(candies[i], candies[i + 1] + 1)
    
    return sum(candies)
```

---

### 🚀 Level 3: Optimized Greedy (Space Optimization)

**Approach:**  
In this approach, we can avoid using extra space for the `candies` array. Instead, we perform the candy allocation in two passes while keeping track of the necessary number of candies using just variables to reduce the space complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def candy(ratings):
    n = len(ratings)
    if n == 1: return 1
    
    # Left pass: calculate the required candies from left to right
    left = [1] * n
    for i in range(1, n):
        if ratings[i] > ratings[i - 1]:
            left[i] = left[i - 1] + 1
    
    # Right pass: calculate the required candies from right to left
    right = [1] * n
    for i in range(n - 2, -1, -1):
        if ratings[i] > ratings[i + 1]:
            right[i] = right[i + 1] + 1
    
    total = 0
    for i in range(n):
        total += max(left[i], right[i])
    
    return total
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity | Space Complexity |
|-------|-------------------------------------|-----------------|------------------|
| 1     | Brute Force (Naive Approach)        | O(n^2)          | O(n)             |
| 2     | Greedy Approach (Two-Pass)          | O(n)            | O(n)             |
| 3     | Optimized Greedy (Space Optimization) | O(n)          | O(1)             |

---

## 🔗 Similar Problems

1. [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)
2. [55. Jump Game](https://leetcode.com/problems/jump-game/)
3. [376. Wiggle Subsequence](https://leetcode.com/problems/wiggle-subsequence/)

---

## 📌 Takeaway Points

- **Brute force** is highly inefficient for large input sizes, with a time complexity of **O(n^2)**.
- The **greedy two-pass approach** is efficient, requiring only **O(n)** time and **O(n)** space.
- **Space optimization** can further improve the solution to **O(1)** space complexity by using two auxiliary arrays for the left and right candy distributions.

---
