# 🔡 Problem: Group Anagrams

## 📘 Problem Statement

> Given an array of strings `strs`, group the anagrams together.  
> You can return the answer in **any order**.

**LeetCode Link:** [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)

---

```

Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]

Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Explanation:

There is no string in strs that can be rearranged to form "bat".
The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.
Example 2:

Input: strs = [""]

Output: [[""]]

Example 3:

Input: strs = ["a"]

Output: [["a"]]

```

## ✅ Constraints

- `1 <= strs.length <= 10⁴`
- `0 <= strs[i].length <= 100`
- `strs[i]` consists of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Manual Grouping

**Approach:** For each word, compare it against groups by checking if it's an anagram via sorting.

```python
# Time Complexity: O(n^2 * k log k)
# Space Complexity: O(n)
def groupAnagrams(strs):
    res = []
    for word in strs:
        found = False
        for group in res:
            if sorted(group[0]) == sorted(word):
                group.append(word)
                found = True
                break
        if not found:
            res.append([word])
    return res
```

---

### ⚙️ Level 2: Use Sorted Tuple as Hash Key

**Approach:** Sort each word and use the tuple of sorted characters as a key in a dictionary.

```python
# Time Complexity: O(n * k log k)
# Space Complexity: O(n * k)
from collections import defaultdict

def groupAnagrams(strs):
    anagrams = defaultdict(list)
    for word in strs:
        key = tuple(sorted(word))
        anagrams[key].append(word)
    return list(anagrams.values())
```

---

### 🚀 Level 3: Use Character Count as Hash Key

**Approach:** Use a fixed-length array (26 elements) as a key representing letter counts.

```python
# Time Complexity: O(n * k)
# Space Complexity: O(n * k)
from collections import defaultdict

def groupAnagrams(strs):
    anagrams = defaultdict(list)
    for word in strs:
        count = [0] * 26
        for ch in word:
            count[ord(ch) - ord('a')] += 1
        anagrams[tuple(count)].append(word)
    return list(anagrams.values())
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Manual Compare + Sort            | O(n² * k log k) | O(n)             |
| 2     | Sorted String as Hash Key        | O(n * k log k)  | O(n * k)         |
| 3     | Letter Count as Hash Key (Optimal) | O(n * k)     | O(n * k)         |

> `n` = number of strings, `k` = average length of each string

---

## 🔗 Similar Problems

1. [242. Valid Anagram](https://leetcode.com/problems/valid-anagram/)
2. [438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)
3. [890. Find and Replace Pattern](https://leetcode.com/problems/find-and-replace-pattern/)

---

## 📌 Takeaway Points

- Sorting provides a quick and easy key for anagram grouping.
- Using a 26-element character count array is faster and avoids sorting overhead.
- Always consider input constraints before picking between hashing and sorting.

---
