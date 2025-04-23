# 🧵 Problem: Longest Substring Without Repeating Characters

## 📘 Problem Statement

> Given a string `s`, find the length of the longest substring without repeating characters.

**LeetCode Link:** [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

---

## ✅ Constraints

```

Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

```

- `0 <= s.length <= 5 * 10⁴`
- `s` consists of English letters, digits, symbols and spaces.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with All Substrings

**Approach:** Generate all substrings and check each for unique characters.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(min(n, m)) — for substring set
def lengthOfLongestSubstring(s):
    max_len = 0
    n = len(s)
    for i in range(n):
        seen = set()
        for j in range(i, n):
            if s[j] in seen:
                break
            seen.add(s[j])
            max_len = max(max_len, j - i + 1)
    return max_len
```

---

### ⚙️ Level 2: Sliding Window with Set

**Approach:** Use two pointers and a set to maintain a window of unique characters.

```python
# Time Complexity: O(2n) = O(n)
# Space Complexity: O(min(n, m))
def lengthOfLongestSubstring(s):
    char_set = set()
    left = 0
    max_len = 0
    
    for right in range(len(s)):
        while s[right] in char_set:
            char_set.remove(s[left])
            left += 1
        char_set.add(s[right])
        max_len = max(max_len, right - left + 1)
        
    return max_len
```

---

### 🚀 Level 3: Sliding Window with HashMap for Index Tracking

**Approach:** Use a dictionary to remember the last seen index of characters and skip forward accordingly.

```python
# Time Complexity: O(n)
# Space Complexity: O(min(n, m))
def lengthOfLongestSubstring(s):
    char_index = {}
    left = 0
    max_len = 0
    
    for right in range(len(s)):
        if s[right] in char_index and char_index[s[right]] >= left:
            left = char_index[s[right]] + 1
        char_index[s[right]] = right
        max_len = max(max_len, right - left + 1)
        
    return max_len
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force Substrings            | O(n³)           | O(n)             |
| 2     | Sliding Window + Set              | O(n)            | O(n)             |
| 3     | Optimized Sliding Window + Hash   | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [159. Longest Substring with At Most Two Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)
2. [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
3. [340. Longest Substring with At Most K Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/)

---

## 📌 Takeaway Points

- Brute force is useful for understanding but infeasible at scale.
- Sliding window reduces time from O(n³) to O(n) by maintaining dynamic valid windows.
- Use a hash map to track exact positions and jump the left pointer optimally.

---