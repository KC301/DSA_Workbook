
---

# ➕ Problem: Valid Palindrome

## 📘 Problem Statement

> Given a string `s`, return `true` if it is a **palindrome**, or `false` otherwise.  
> A **palindrome** is a word, phrase, number, or other sequence of characters that reads the same forward and backward (ignoring spaces, punctuation, and capitalization).

**LeetCode Link:** [125. Valid Palindrome](https://leetcode.com/problems/valid-palindrome/)

---

```
Example 1:

Input: s = "A man, a plan, a canal: Panama"  
Output: true  
Explanation: "A man, a plan, a canal: Panama" is a palindrome when ignoring case and non-alphanumeric characters.

Example 2:

Input: s = "race a car"  
Output: false  
Explanation: "race a car" is not a palindrome.

Example 3:

Input: s = " "  
Output: true  
Explanation: An empty string is a palindrome.
```

---

## ✅ Constraints

- `1 <= s.length <= 2 * 10⁵`
- `s` consists only of printable ASCII characters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check Palindrome via Reverse)

**Approach:**  
Remove non-alphanumeric characters and convert to lowercase, then check if the string is equal to its reverse.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def isPalindrome(s: str) -> bool:
    filtered_str = ''.join(c.lower() for c in s if c.isalnum())
    return filtered_str == filtered_str[::-1]
```

---

### ⚙️ Level 2: Two Pointer Approach

**Approach:**  
Use two pointers, one starting from the beginning and the other from the end. Compare characters and move inward while ignoring non-alphanumeric characters.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def isPalindrome(s: str) -> bool:
    left, right = 0, len(s) - 1

    while left < right:
        # Move left pointer to next alphanumeric character
        while left < right and not s[left].isalnum():
            left += 1
        # Move right pointer to next alphanumeric character
        while left < right and not s[right].isalnum():
            right -= 1
        
        if s[left].lower() != s[right].lower():
            return False
        
        left += 1
        right -= 1
    
    return True
```

---

### 🚀 Level 3: Optimized Two Pointer with Early Return

**Approach:**  
The same two-pointer approach but with early returns when possible, ensuring the solution is efficient.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def isPalindrome(s: str) -> bool:
    left, right = 0, len(s) - 1

    while left < right:
        if not s[left].isalnum():
            left += 1
        elif not s[right].isalnum():
            right -= 1
        elif s[left].lower() != s[right].lower():
            return False
        else:
            left += 1
            right -= 1
    
    return True
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Reverse String)     | O(n)            | O(n)             |
| 2     | Two Pointer Approach             | O(n)            | O(1)             |
| 3     | Optimized Two Pointer (Early Return) | O(n)         | O(1)             |

---

## 🔗 Similar Problems

1. [125. Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/)
2. [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
3. [9. Palindrome Number](https://leetcode.com/problems/palindrome-number/)
4. [344. Reverse String](https://leetcode.com/problems/reverse-string/)
5. [680. Valid Palindrome II](https://leetcode.com/problems/valid-palindrome-ii/)

---

## 📌 Takeaway Points

- **Two-pointer approach** is an optimal solution when dealing with problems where you need to compare characters from both ends.
- Always **filter out non-alphanumeric characters** before checking for palindromes.
- Efficient palindrome checks are done in O(n) time and O(1) space using the two-pointer technique.

---
