
---

# ➕ Problem: Number of 1 Bits

## 📘 Problem Statement

> Write a function that takes the binary representation of an unsigned integer and returns the number of `'1'` bits it has (also known as the Hamming weight).  
>  
> Note that in some languages, like Java, you need to handle the input as an unsigned value.

**LeetCode Link:** [191. Number of 1 Bits](https://leetcode.com/problems/number-of-1-bits/)

---

```
Example 1:

Input: n = 00000000000000000000000000001011
Output: 3
Explanation: The input binary string has a total of three '1' bits.

Example 2:

Input: n = 00000000000000000000000010000000
Output: 1

Example 3:

Input: n = 11111111111111111111111111111101
Output: 31

```

---

## ✅ Constraints

- The input must be a binary string of length 32.
- Input is a **positive integer** in binary format (or represented as such in the function).

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force by Shifting Right

**Approach:**  
Check each bit of the number using bitwise AND with 1. Shift the number to the right one bit at a time and count how many times the least significant bit is `1`.

```python
# Time Complexity: O(32) = O(1)
# Space Complexity: O(1)
def hammingWeight(n: int) -> int:
    count = 0
    while n:
        count += n & 1
        n >>= 1
    return count
```

---

### ⚙️ Level 2: Brian Kernighan’s Algorithm

**Approach:**  
Instead of checking all 32 bits, this approach flips the least significant `1` bit of the number to `0` and increases the count. This only runs as many times as there are `1`s in the number.

```python
# Time Complexity: O(k), where k is the number of 1 bits
# Space Complexity: O(1)
def hammingWeight(n: int) -> int:
    count = 0
    while n:
        n &= n - 1
        count += 1
    return count
```

---

### 🚀 Level 3: Built-in Optimization Using Python Functionality

**Approach:**  
Use Python's built-in capabilities to convert the number to binary and count the `'1'`s directly.

```python
# Time Complexity: O(1)
# Space Complexity: O(1)
def hammingWeight(n: int) -> int:
    return bin(n).count('1')
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Bit Shifting                       | O(1)            | O(1)             |
| 2     | Brian Kernighan’s Algorithm        | O(k)            | O(1)             |
| 3     | Built-in `bin().count('1')`        | O(1)            | O(1)             |

---

## 🔗 Similar Problems

1. [338. Counting Bits](https://leetcode.com/problems/counting-bits/)
2. [190. Reverse Bits](https://leetcode.com/problems/reverse-bits/)
3. [201. Bitwise AND of Numbers Range](https://leetcode.com/problems/bitwise-and-of-numbers-range/)

---

## 📌 Takeaway Points

- **Brian Kernighan's algorithm** is a smart bit manipulation trick that optimizes counting 1s.
- For interviews, this algorithm often stands out more than using Python’s built-in `bin()` function.
- All approaches run in **constant time** due to the 32-bit constraint, but differ in elegance and performance for higher-level languages.

---
