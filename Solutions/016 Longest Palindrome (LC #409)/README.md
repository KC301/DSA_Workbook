
---

# ➕ Problem: Longest Palindrome

## 📘 Problem Statement

> Given a string `s` which consists of lowercase or uppercase letters, return the **length of the longest palindrome** that can be built with those letters.  
> Letters are case sensitive, so `'A'` and `'a'` are considered different.

**LeetCode Link:** [409. Longest Palindrome](https://leetcode.com/problems/longest-palindrome/)

---

```
Example 1:

Input: s = "abccccdd"  
Output: 7  
Explanation: One possible palindrome is "dccaccd", length is 7.

Example 2:

Input: s = "a"  
Output: 1

Example 3:

Input: s = "bb"  
Output: 2
```

---

## ✅ Constraints

- `1 <= s.length <= 2000`
- `s` consists of lowercase and/or uppercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (All Permutations)

**Approach:**  
Try all permutations and check if they are palindromes.

```python
# Time Complexity: O(n!)
# Space Complexity: O(n)
from itertools import permutations

def longestPalindrome(s):
    for i in range(len(s), 0, -1):
        for p in permutations(s, i):
            t = ''.join(p)
            if t == t[::-1]:
                return i
    return 0
```

---

### ⚙️ Level 2: Count Frequencies + Greedy Construction

**Approach:**  
Count each character. Use all even counts. If any odd counts exist, one can be placed in the center.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
from collections import Counter

def longestPalindrome(s):
    count = Counter(s)
    length = 0
    odd_found = False

    for freq in count.values():
        if freq % 2 == 0:
            length += freq
        else:
            length += freq - 1
            odd_found = True

    return length + 1 if odd_found else length
```

---

### 🚀 Level 3: Set-Based Frequency Tracker

**Approach:**  
Track unmatched characters in a set. When a pair is formed, increase length by 2. Add one more if there's any unmatched char left.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def longestPalindrome(s):
    char_set = set()
    length = 0

    for char in s:
        if char in char_set:
            char_set.remove(char)
            length += 2
        else:
            char_set.add(char)

    return length + 1 if char_set else length
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Permutations                     | O(n!)           | O(n)             |
| 2     | Counter + Greedy                 | O(n)            | O(1)             |
| 3     | Set-Based Matching               | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [266. Palindrome Permutation](https://leetcode.com/problems/palindrome-permutation/)
2. [680. Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/)
3. [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)
4. [131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/)
5. [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/)

---

## 📌 Takeaway Points

- Palindromes require symmetrical character counts.
- Characters with **even counts** can always be fully used.
- At most **one odd-count character** can be the palindrome's center.
- You don't need to build the palindrome, just count its possible length.

---
