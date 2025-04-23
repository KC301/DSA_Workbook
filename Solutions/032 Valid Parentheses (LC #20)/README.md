
---

# ➕ Problem: Valid Parentheses

## 📘 Problem Statement

> Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['`, and `']'`, determine if the input string is valid.  
> An input string is valid if:
> 1. Open brackets must be closed by the same type of brackets.
> 2. Open brackets must be closed in the correct order.

**LeetCode Link:** [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)

---

```
Example 1:

Input: s = "()"
Output: true

Example 2:

Input: s = "()[]{}"
Output: true

Example 3:

Input: s = "(]"
Output: false
```

---

## ✅ Constraints

- `1 <= s.length <= 10⁴`
- `s[i]` is one of `'(', ')', '{', '}', '[', ']'`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Stack)

**Approach:**  
Use a stack to track the opening brackets. For each closing bracket, check if it matches the most recent opening bracket in the stack. If it does, pop it from the stack. At the end, if the stack is empty, the string is valid.

```python
# Time Complexity: O(n), where n is the length of the string
# Space Complexity: O(n), due to the stack used
def isValid(s: str) -> bool:
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for char in s:
        if char in mapping:
            top_element = stack.pop() if stack else '#'
            if mapping[char] != top_element:
                return False
        else:
            stack.append(char)
    
    return not stack
```

---

### ⚙️ Level 2: Optimized Stack with Early Exit

**Approach:**  
This solution is essentially the same as Level 1 but with some tweaks for early exit when we encounter an invalid case. The stack is checked after every pop to immediately return `False` when needed.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def isValid(s: str) -> bool:
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for char in s:
        if char in mapping:
            if stack and stack[-1] == mapping[char]:
                stack.pop()
            else:
                return False
        else:
            stack.append(char)
    
    return not stack
```

---

### 🚀 Level 3: Single Pass with Optimized Stack

**Approach:**  
This is the same approach as the previous but using some minor optimizations to ensure the code performs efficiently, particularly in handling the condition where the stack is empty early on.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def isValid(s: str) -> bool:
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for char in s:
        if char in mapping:
            if stack and stack[-1] == mapping[char]:
                stack.pop()
            else:
                return False
        else:
            stack.append(char)
    
    return not stack
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity | Space Complexity |
|-------|-------------------------------------|-----------------|------------------|
| 1     | Brute Force (Stack)                | O(n)            | O(n)             |
| 2     | Optimized Stack with Early Exit    | O(n)            | O(n)             |
| 3     | Single Pass with Optimized Stack   | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [1047. Remove All Adjacent Duplicates In String](https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/)
2. [32. Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses/)
3. [678. Valid Parenthesis String](https://leetcode.com/problems/valid-parenthesis-string/)
4. [921. Minimum Add to Make Parentheses Valid](https://leetcode.com/problems/minimum-add-to-make-parentheses-valid/)

---

## 📌 Takeaway Points

- A stack is a fundamental data structure to solve problems related to parentheses matching.
- **Early exit** in the loop can improve efficiency when invalid situations are detected immediately.
- The stack will be empty if all parentheses are properly matched by the end of the traversal.

---
