# 🔤 Problem: Valid Anagram

## 📘 Problem Statement

> Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise.  
> An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase.

**LeetCode Link:** [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)

---

```

Example 1:

Input: s = "anagram", t = "nagaram"

Output: true

Example 2:

Input: s = "rat", t = "car"

Output: false

```

## ✅ Constraints

- `1 <= s.length, t.length <= 5 * 10⁴`
- `s` and `t` consist of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sorting Permutations)

**Approach:** Generate all permutations of `s` and check if `t` is one of them.

```python
# Time Complexity: O(n!)
# Space Complexity: O(n)
from itertools import permutations

def isAnagram(s, t):
    return t in map("".join, permutations(s))
```

> ⚠️ Extremely inefficient and not suitable for large inputs.

---

### ⚙️ Level 2: Sort and Compare

**Approach:** Sort both strings and compare equality.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def isAnagram(s, t):
    return sorted(s) == sorted(t)
```

---

### 🚀 Level 3: Count Characters (Hash Map)

**Approach:** Count characters using a dictionary or array and compare counts.

```python
# Time Complexity: O(n)
# Space Complexity: O(1) (since only lowercase English letters)
def isAnagram(s, t):
    if len(s) != len(t):
        return False
    
    count = [0] * 26  # only lowercase letters
    for ch1, ch2 in zip(s, t):
        count[ord(ch1) - ord('a')] += 1
        count[ord(ch2) - ord('a')] -= 1

    return all(c == 0 for c in count)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                | Time Complexity | Space Complexity |
|-------|--------------------------|-----------------|------------------|
| 1     | Permutation Brute Force | O(n!)           | O(n)             |
| 2     | Sort and Compare        | O(n log n)      | O(n)             |
| 3     | Count Frequency (Optimal)| O(n)           | O(1)             |

---

## 🔗 Similar Problems

1. [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)
2. [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)
3. [383. Ransom Note](https://leetcode.com/problems/ransom-note/)

---

## 📌 Takeaway Points

- Sorting is easy and safe but not optimal.
- Use counting or hashing for O(n) optimality with fixed character sets.
- Always check length first for early termination in string comparison.

---
