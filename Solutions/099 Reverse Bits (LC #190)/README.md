
---

# ➕ Problem: Reverse Bits

## 📘 Problem Statement

> Reverse bits of a given 32 bits unsigned integer.  
>  
> Note:  
> - Input is assumed to be a 32-bit unsigned integer, so zero-fill left shift must be used if needed.  
> - The result must also be treated as a 32-bit unsigned integer.

**LeetCode Link:** [190. Reverse Bits](https://leetcode.com/problems/reverse-bits/)

---

```
Example 1:

Input: n = 00000010100101000001111010011100
Output:    00111001011110000010100101000000
Explanation: The input represents the unsigned integer 43261596, and the output is 964176192.

Example 2:

Input: n = 11111111111111111111111111111101
Output:    10111111111111111111111111111111
Explanation: The input represents the unsigned integer 4294967293, and the output is 3221225471.
```

---

## ✅ Constraints

- The input must be a **binary representation** of a 32-bit unsigned integer.
- You must return another 32-bit **unsigned** integer as output.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Bit Reversal with String Conversion

**Approach:**  
Convert to binary string, pad to 32 bits, reverse it, and convert back.

```python
# Time Complexity: O(1)
# Space Complexity: O(1)
def reverseBits(n: int) -> int:
    return int('{:032b}'.format(n)[::-1], 2)
```

---

### ⚙️ Level 2: Manual Bit Manipulation with Loop

**Approach:**  
Iteratively extract each bit from `n` and construct the reversed number using left shifts.

```python
# Time Complexity: O(32) = O(1)
# Space Complexity: O(1)
def reverseBits(n: int) -> int:
    result = 0
    for _ in range(32):
        result = (result << 1) | (n & 1)
        n >>= 1
    return result
```

---

### 🚀 Level 3: Bit Manipulation with Caching (for repeated calls)

**Approach:**  
If the function will be called multiple times, break the number into bytes and cache reversed bytes to reduce future computation.

```python
# Time Complexity: O(1)
# Space Complexity: O(1) for one call, O(256) if using cache across calls

reverse_byte = {}

def reverseBits(n: int) -> int:
    def reverse_bytewise(b):
        if b in reverse_byte:
            return reverse_byte[b]
        rev = 0
        for i in range(8):
            rev = (rev << 1) | (b & 1)
            b >>= 1
        reverse_byte[b] = rev
        return rev

    return (
        (reverse_bytewise(n & 0xff) << 24) |
        (reverse_bytewise((n >> 8) & 0xff) << 16) |
        (reverse_bytewise((n >> 16) & 0xff) << 8) |
        (reverse_bytewise((n >> 24) & 0xff))
    )
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                               | Time Complexity | Space Complexity |
|-------|----------------------------------------|-----------------|------------------|
| 1     | String Formatting and Reversal         | O(1)            | O(1)             |
| 2     | Bitwise Loop                           | O(1)            | O(1)             |
| 3     | Byte-wise Reverse with Caching         | O(1)            | O(1) / O(256)    |

---

## 🔗 Similar Problems

1. [191. Number of 1 Bits](https://leetcode.com/problems/number-of-1-bits/)
2. [338. Counting Bits](https://leetcode.com/problems/counting-bits/)
3. [201. Bitwise AND of Numbers Range](https://leetcode.com/problems/bitwise-and-of-numbers-range/)

---

## 📌 Takeaway Points

- Bitwise operations allow efficient manipulation of binary data.
- For 32-bit operations, everything is constant time due to fixed size.
- Caching partial results like reversed bytes can help if called multiple times.

---