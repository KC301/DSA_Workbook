
---

# ➕ Problem: Decode Ways

## 📘 Problem Statement

> A message containing letters from A-Z can be encoded into numbers using the following mapping:
> `'A' -> "1"`, `'B' -> "2"`, ..., `'Z' -> "26"`.
> To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, `"11106"` can be mapped into:
> `"AAJF"` with the grouping (1 1 10 6) or, `"KJF"` with the grouping (11 10 6).
> Given a string `s` consisting of digits, return the total number of ways to decode it.

> **Note:**  
> 1. A digit `0` cannot be mapped to any letter.
> 2. The input string is not empty and contains only digits.

**LeetCode Link:** [91. Decode Ways](https://leetcode.com/problems/decode-ways/)

---

```
Example 1:

Input: s = "12"
Output: 2
Explanation: "12" could be decoded as "AB" (1 2) or "L" (12).

Example 2:

Input: s = "226"
Output: 3
Explanation: "226" could be decoded as "BBF" (2 2 6), "BZ" (2 26), or "VF" (22 6).

Example 3:

Input: s = "0"
Output: 0
Explanation: There is no valid encoding for "0".

```

---

## ✅ Constraints

- `1 <= s.length <= 100`
- `s` contains only digits and may contain leading zero(s).

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive)

**Approach:**  
In this approach, we recursively explore all possible decodings by either taking one digit or two digits at a time, checking if the current substring is valid (i.e., between 1 and 26).

```python
# Time Complexity: O(2^n) due to the branching recursion
# Space Complexity: O(n) due to recursion stack
def numDecodings(s):
    def dfs(i):
        if i == len(s): return 1
        if s[i] == '0': return 0
        one_digit = dfs(i + 1)
        two_digits = 0
        if i + 1 < len(s) and int(s[i:i + 2]) <= 26:
            two_digits = dfs(i + 2)
        return one_digit + two_digits

    return dfs(0)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:**  
To optimize the brute-force solution, we use memoization to store intermediate results of subproblems, avoiding recalculating the number of ways to decode from a certain index multiple times.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) due to memoization
def numDecodings(s):
    memo = {}

    def dfs(i):
        if i == len(s): return 1
        if s[i] == '0': return 0
        if i in memo: return memo[i]

        one_digit = dfs(i + 1)
        two_digits = 0
        if i + 1 < len(s) and int(s[i:i + 2]) <= 26:
            two_digits = dfs(i + 2)

        memo[i] = one_digit + two_digits
        return memo[i]

    return dfs(0)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
We use dynamic programming (DP) to iteratively compute the number of ways to decode the string. We maintain a DP array where `dp[i]` represents the number of ways to decode the substring `s[0:i]`. This approach avoids recursion and stores all results in a bottom-up manner.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def numDecodings(s):
    if not s or s[0] == '0': return 0
    n = len(s)
    dp = [0] * (n + 1)
    dp[0], dp[1] = 1, 1

    for i in range(2, n + 1):
        if s[i - 1] != '0':
            dp[i] += dp[i - 1]
        if s[i - 2:i] >= '10' and s[i - 2:i] <= '26':
            dp[i] += dp[i - 2]

    return dp[n]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Recursive)              | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)    | O(n)            | O(n)             |
| 3     | Dynamic Programming (Tabulation)     | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [91. Decode Ways (Follow-up with additional constraints)](https://leetcode.com/problems/decode-ways/)
2. [639. Decode Ways II](https://leetcode.com/problems/decode-ways-ii/)
3. [17. Letter Combinations of a Phone Number](https://leetcode.com/problems/letter-combinations-of-a-phone-number/)

---

## 📌 Takeaway Points

- The recursive brute-force solution is simple but inefficient due to exponential time complexity.
- **Memoization** significantly improves the solution by storing results and reducing repeated calculations.
- **Dynamic Programming (Tabulation)** is the most efficient approach for this problem and avoids the overhead of recursion.

---
