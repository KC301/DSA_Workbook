
---

# ➕ Problem: Minimum Window Substring

## 📘 Problem Statement

> Given two strings `s` and `t`, return the **minimum window** substring of `s` such that every character in `t` (including duplicates) is included in the window. If there is no such substring, return the empty string `""`.

> The answer is guaranteed to be unique.

**LeetCode Link:** [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

---

```
Example 1:

Input: s = "ADOBECODEBANC", t = "ABC"  
Output: "BANC"  
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

Example 2:

Input: s = "ADOBECODEBANC", t = "AB"  
Output: "BANC"  

Example 3:

Input: s = "A", t = "A"  
Output: "A"  

Example 4:

Input: s = "A", t = "AA"  
Output: ""  
Explanation: Both 'A's are needed in t, but only one 'A' is available in s.
```

---

## ✅ Constraints

- `1 <= s.length, t.length <= 10⁵`
- `s` and `t` consist of English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sliding Window with All Substrings)

**Approach:**  
Generate all substrings of `s` and check if each contains all characters of `t`. Return the shortest valid substring.

```python
# Time Complexity: O(n³)
# Space Complexity: O(n)
def minWindow(s: str, t: str) -> str:
    def contains_all_chars(window, t_chars):
        for char in t_chars:
            if window.count(char) < t_chars.count(char):
                return False
        return True
    
    result = ""
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            if contains_all_chars(s[i:j], t):
                if not result or len(s[i:j]) < len(result):
                    result = s[i:j]
    return result
```

---

### ⚙️ Level 2: Sliding Window with Hash Map

**Approach:**  
Use a sliding window with two pointers and a hashmap to keep track of the characters of `t`. Expand the window to the right and contract from the left as needed to find the smallest valid substring.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import Counter

def minWindow(s: str, t: str) -> str:
    if not s or not t:
        return ""
    
    t_count = Counter(t)
    window_count = Counter()
    left, right = 0, 0
    min_len = float('inf')
    min_window = ""
    
    while right < len(s):
        window_count[s[right]] += 1
        right += 1
        
        while all(window_count[char] >= t_count[char] for char in t_count):
            if right - left < min_len:
                min_len = right - left
                min_window = s[left:right]
            
            window_count[s[left]] -= 1
            left += 1
    
    return min_window
```

---

### 🚀 Level 3: Optimized Sliding Window with Early Exit

**Approach:**  
Same as Level 2 but with early exits for efficiency. As soon as we find a valid window, try to minimize it by moving the left pointer and ensure we break as soon as possible when the window becomes invalid.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import Counter

def minWindow(s: str, t: str) -> str:
    if not s or not t:
        return ""
    
    t_count = Counter(t)
    window_count = Counter()
    left, right = 0, 0
    min_len = float('inf')
    min_window = ""
    required = len(t_count)
    formed = 0
    
    while right < len(s):
        char = s[right]
        window_count[char] += 1
        
        if window_count[char] == t_count[char]:
            formed += 1
        
        while left <= right and formed == required:
            if right - left + 1 < min_len:
                min_len = right - left + 1
                min_window = s[left:right + 1]
            
            window_count[s[left]] -= 1
            if window_count[s[left]] < t_count[s[left]]:
                formed -= 1
            left += 1
        
        right += 1
    
    return min_window
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (All Substrings)     | O(n³)           | O(n)             |
| 2     | Sliding Window with Hash Map     | O(n)            | O(n)             |
| 3     | Optimized Sliding Window         | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [76. Minimum Window Substring (Variants)](https://leetcode.com/problems/minimum-window-substring/)
2. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
3. [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)
4. [76. Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words/)
5. [438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)

---

## 📌 Takeaway Points

- **Sliding Window** is highly effective for substring problems, especially when we need to check all characters of a string.
- **Hash maps** are used to efficiently keep track of character counts and allow quick checks.
- **Optimized sliding window** ensures we do not perform unnecessary steps, such as checking already invalid windows or recalculating conditions.

---
