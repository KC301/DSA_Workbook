
---

# ➕ Problem: Longest Repeating Character Replacement

## 📘 Problem Statement

> You are given a string `s` and an integer `k`.  
> You can perform at most `k` operations on the string, where in each operation, you can replace one character in the string with any other uppercase English letter.  
> Return the length of the longest substring containing the same letter you can get after performing at most `k` operations.

**LeetCode Link:** [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/)

---

```
Example 1:

Input: s = "ABAB", k = 2  
Output: 4  
Explanation: Replace the two 'A's with two 'B's. The longest substring is "BBBB".

Example 2:

Input: s = "AABABBA", k = 1  
Output: 4  
Explanation: Replace the one 'B' in the middle with an 'A'. The longest substring is "AAAA".

Example 3:

Input: s = "A", k = 0  
Output: 1
```

---

## ✅ Constraints

- `1 <= s.length <= 10⁵`
- `0 <= k <= s.length`
- `s` consists of only uppercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (All Substrings)

**Approach:**  
Generate all substrings of `s` and check each one by replacing up to `k` characters. This brute force approach will find the longest substring after replacement.

```python
# Time Complexity: O(n²)
# Space Complexity: O(1)
def characterReplacement(s: str, k: int) -> int:
    def can_replace(substring, k):
        return sum(1 for c in set(substring) if substring.count(c) < len(substring) - k) <= k

    max_len = 0
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            if can_replace(s[i:j], k):
                max_len = max(max_len, j - i)
    return max_len
```

---

### ⚙️ Level 2: Sliding Window with Frequency Count

**Approach:**  
Use a sliding window to track the most frequent character in the current window. If the number of characters that need to be replaced exceeds `k`, shrink the window from the left.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
from collections import Counter

def characterReplacement(s: str, k: int) -> int:
    left = 0
    max_freq = 0
    max_len = 0
    count = Counter()
    
    for right in range(len(s)):
        count[s[right]] += 1
        max_freq = max(max_freq, count[s[right]])
        
        # If the current window size minus the count of the most frequent character
        # exceeds k, we shrink the window
        if (right - left + 1) - max_freq > k:
            count[s[left]] -= 1
            left += 1
        
        max_len = max(max_len, right - left + 1)
    
    return max_len
```

---

### 🚀 Level 3: Optimized Sliding Window with Constant Space

**Approach:**  
Same as Level 2, but use a fixed-size array to track character frequencies instead of a `Counter` for constant space complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def characterReplacement(s: str, k: int) -> int:
    left = 0
    max_freq = 0
    max_len = 0
    freq = [0] * 26  # Array to track frequency of each character (A-Z)
    
    for right in range(len(s)):
        # Convert char to index: ord('A') = 65, so ord(s[right]) - ord('A') gives 0-25 range
        freq[ord(s[right]) - ord('A')] += 1
        max_freq = max(max_freq, freq[ord(s[right]) - ord('A')])
        
        # If the window size minus the most frequent character's frequency exceeds k, move left pointer
        if (right - left + 1) - max_freq > k:
            freq[ord(s[left]) - ord('A')] -= 1
            left += 1
        
        max_len = max(max_len, right - left + 1)
    
    return max_len
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (All Substrings)     | O(n²)           | O(1)             |
| 2     | Sliding Window with Frequency Count | O(n)           | O(1)             |
| 3     | Optimized Sliding Window (Fixed Array) | O(n)         | O(1)             |

---

## 🔗 Similar Problems

1. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
2. [340. Longest Substring with At Most K Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-k-distinct-characters/)
3. [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)
4. [159. Longest Substring with At Most Two Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)
5. [392. Is Subsequence](https://leetcode.com/problems/is-subsequence/)

---

## 📌 Takeaway Points

- **Sliding Window** is a powerful technique for problems that deal with contiguous subarrays or substrings.
- **Frequency counting** inside the window allows you to track character occurrences efficiently.
- Always ensure that the window size (or the number of modifications) stays within the allowed limit (`k` in this case).
  
---
