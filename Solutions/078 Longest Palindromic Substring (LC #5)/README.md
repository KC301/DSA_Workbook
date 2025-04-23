
---

# ➕ Problem: Longest Palindromic Substring

## 📘 Problem Statement

> Given a string `s`, return the longest palindromic substring in `s`.
> A palindrome string is one that reads the same forward and backward.

**LeetCode Link:** [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

---

```
Example 1:

Input: s = "babad"
Output: "bab"
Explanation: "aba" is also a valid answer.

Example 2:

Input: s = "cbbd"
Output: "bb"

```

---

## ✅ Constraints

- `1 <= s.length <= 1000`
- `s` consist of only digits and English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:**  
The brute force approach is to check every possible substring and verify if it is a palindrome, then return the longest one.

```python
# Time Complexity: O(n^3) due to checking all substrings and verifying palindrome
# Space Complexity: O(1)
def longestPalindrome(s):
    def is_palindrome(sub):
        return sub == sub[::-1]

    max_len = 0
    result = ""
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            if is_palindrome(s[i:j]) and (j - i) > max_len:
                max_len = j - i
                result = s[i:j]
    return result
```

---

### ⚙️ Level 2: Expand Around Center

**Approach:**  
Every palindrome can be expanded from its center. The idea is to treat each character (and each pair of characters for even-length palindromes) as the center, then expand outwards to check for palindromes.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def longestPalindrome(s):
    def expand_around_center(left, right):
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        return s[left + 1:right]

    result = ""
    for i in range(len(s)):
        odd_palindrome = expand_around_center(i, i)
        even_palindrome = expand_around_center(i, i + 1)
        result = max(result, odd_palindrome, even_palindrome, key=len)

    return result
```

---

### 🚀 Level 3: Dynamic Programming

**Approach:**  
We use dynamic programming to keep track of which substrings are palindromes. A 2D table is used to store results where `dp[i][j]` represents whether the substring from index `i` to `j` is a palindrome.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n^2)
def longestPalindrome(s):
    n = len(s)
    if n == 0:
        return ""

    dp = [[False] * n for _ in range(n)]
    max_len = 1
    start = 0

    for i in range(n):
        dp[i][i] = True  # All single characters are palindromes

    for length in range(2, n + 1):  # length of substring
        for i in range(n - length + 1):
            j = i + length - 1
            if s[i] == s[j]:
                if length == 2:
                    dp[i][j] = True
                else:
                    dp[i][j] = dp[i + 1][j - 1]
                if dp[i][j] and length > max_len:
                    max_len = length
                    start = i

    return s[start:start + max_len]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force                         | O(n^3)          | O(1)             |
| 2     | Expand Around Center                | O(n^2)          | O(1)             |
| 3     | Dynamic Programming                 | O(n^2)          | O(n^2)           |

---

## 🔗 Similar Problems

1. [516. Longest Palindromic Subsequence](https://leetcode.com/problems/longest-palindromic-subsequence/)
2. [647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)
3. [92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)

---

## 📌 Takeaway Points

- The brute force solution is easy to understand but inefficient for larger inputs.
- The **Expand Around Center** approach provides an elegant and efficient solution, reducing time complexity to **O(n²)** while keeping space complexity low.
- The **Dynamic Programming** solution is optimal in terms of clarity but requires more space compared to the center-expansion method.

---