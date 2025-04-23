
---

# ➕ Problem: Power of Two

## 📘 Problem Statement

> Given an integer `n`, return `true` if it is a power of two. Otherwise, return `false`.  
>  
> An integer `n` is a power of two, if there exists an integer `x` such that `n == 2ˣ`.

**LeetCode Link:** [231. Power of Two](https://leetcode.com/problems/power-of-two/)

---

```
Example 1:

Input: n = 1
Output: true
Explanation: 2⁰ = 1

Example 2:

Input: n = 16
Output: true
Explanation: 2⁴ = 16

Example 3:

Input: n = 3
Output: false
```

---

## ✅ Constraints

- `-2³¹ <= n <= 2³¹ - 1`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Multiplication

**Approach:**  
Multiply powers of 2 from `1` to a high enough value and check if any equals `n`.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def isPowerOfTwo(n: int) -> bool:
    if n < 1:
        return False
    power = 1
    while power < n:
        power *= 2
    return power == n
```

---

### ⚙️ Level 2: Bit Count using bin()

**Approach:**  
A power of two has exactly one bit set in its binary form. Check if `n` > 0 and `bin(n).count('1') == 1`.

```python
# Time Complexity: O(1)
# Space Complexity: O(1)
def isPowerOfTwo(n: int) -> bool:
    return n > 0 and bin(n).count('1') == 1
```

---

### 🚀 Level 3: Bit Manipulation Trick (n & (n - 1) == 0)

**Approach:**  
For powers of two, only one bit is set. Subtracting `1` flips all lower bits. `n & (n - 1)` will be 0 only for powers of two.

```python
# Time Complexity: O(1)
# Space Complexity: O(1)
def isPowerOfTwo(n: int) -> bool:
    return n > 0 and (n & (n - 1)) == 0
```

---

## 🔗 Similar Problems

1. [342. Power of Four](https://leetcode.com/problems/power-of-four/)
2. [326. Power of Three](https://leetcode.com/problems/power-of-three/)
3. [231. Power of Two](https://leetcode.com/problems/power-of-two/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force Multiply             | O(log n)        | O(1)             |
| 2     | Binary Count Trick               | O(1)            | O(1)             |
| 3     | Bit Manipulation (n & n-1)       | O(1)            | O(1)             |

---

## 📌 Takeaway Points

- Bitwise operations are efficient and elegant for checking power-of-two properties.
- Powers of two always have a single bit set in binary.
- `(n & (n - 1)) == 0` is a common pattern to check for powers of two.

---
