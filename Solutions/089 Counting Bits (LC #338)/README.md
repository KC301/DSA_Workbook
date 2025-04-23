
---

# ➕ Problem: Counting Bits

## 📘 Problem Statement

> Given an integer `n`, return an array `ans` of length `n + 1` such that for each `i` (`0 <= i <= n`), `ans[i]` is the number of `1`'s in the binary representation of `i`.

**LeetCode Link:** [338. Counting Bits](https://leetcode.com/problems/counting-bits/)

---

```
Example 1:

Input: n = 2
Output: [0,1,1]
Explanation:
0 --> 0 (0 ones)
1 --> 1 (1 one)
2 --> 10 (1 one)

Example 2:

Input: n = 5
Output: [0,1,1,2,1,2]

```

---

## ✅ Constraints

- `0 <= n <= 10⁵`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with `bin().count('1')`

**Approach:**  
Iterate from `0` to `n` and count the number of `'1'`s in the binary representation using Python’s built-in `bin()` function.

```python
# Time Complexity: O(n * log n)
# Space Complexity: O(n)
def countBits(n: int) -> list[int]:
    return [bin(i).count('1') for i in range(n + 1)]
```

---

### ⚙️ Level 2: Using Brian Kernighan’s Algorithm for Each Number

**Approach:**  
For each number from `0` to `n`, count the number of 1s using the `n & (n-1)` trick that removes the lowest set bit.

```python
# Time Complexity: O(n * k), where k is average set bits (~log n)
# Space Complexity: O(n)
def countBits(n: int) -> list[int]:
    def hammingWeight(x):
        count = 0
        while x:
            x &= x - 1
            count += 1
        return count
    
    return [hammingWeight(i) for i in range(n + 1)]
```

---

### 🚀 Level 3: Dynamic Programming with Bit Patterns

**Approach:**  
Use previously computed values to build the result:
- `dp[i] = dp[i >> 1] + (i & 1)`

This uses the fact that:
- Right-shifting `i` is equivalent to dividing it by 2.
- `i & 1` gives `1` if the current number is odd (i.e., ends in 1).

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def countBits(n: int) -> list[int]:
    dp = [0] * (n + 1)
    for i in range(1, n + 1):
        dp[i] = dp[i >> 1] + (i & 1)
    return dp
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|----------------------------------------|-----------------|------------------|
| 1     | Built-in bin().count('1')             | O(n log n)      | O(n)             |
| 2     | Brian Kernighan’s per number          | O(n log n)      | O(n)             |
| 3     | DP with Bit Manipulation              | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [191. Number of 1 Bits](https://leetcode.com/problems/number-of-1-bits/)
2. [222. Count Complete Tree Nodes](https://leetcode.com/problems/count-complete-tree-nodes/)
3. [137. Single Number II](https://leetcode.com/problems/single-number-ii/)

---

## 📌 Takeaway Points

- Bit manipulation and DP go hand in hand when you need to build answers from previous computations.
- The `dp[i] = dp[i >> 1] + (i & 1)` trick is both elegant and performant.
- Mastering basic bit operations can help solve a large class of problems efficiently.

---