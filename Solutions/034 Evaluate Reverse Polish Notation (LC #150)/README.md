
---

# ➕ Problem: Evaluate Reverse Polish Notation

## 📘 Problem Statement

> Evaluate the value of an arithmetic expression in Reverse Polish Notation (RPN).  
> Valid operators are `+`, `-`, `*`, and `/`. Each operand may be an integer or another expression.  
> For example:
> - `"2"` is an operand.
> - `"+"` is an operator.
>  
> Example 1:
> ```
> Input: tokens = ["2", "1", "+", "3", "*"]
> Output: 9
> Explanation: ((2 + 1) * 3) = 9
> ```
> Example 2:
> ```
> Input: tokens = ["4", "13", "5", "/", "+"]
> Output: 6
> Explanation: (4 + (13 / 5)) = 6
> ```

**LeetCode Link:** [150. Evaluate Reverse Polish Notation](https://leetcode.com/problems/evaluate-reverse-polish-notation/)

---

```
Example 1:

Input: tokens = ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9

Example 2:

Input: tokens = ["4", "13", "5", "/", "+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
```

---

## ✅ Constraints

- `1 <= tokens.length <= 10⁴`
- `tokens[i]` is either an integer or one of the four operators (`+`, `-`, `*`, `/`).

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Stack with Operator Handling (Brute Force)

**Approach:**  
Use a stack to evaluate the expression. Traverse each token. For numbers, push them onto the stack. For operators, pop the top two numbers, apply the operator, and push the result back onto the stack.

```python
# Time Complexity: O(n), where n is the number of tokens
# Space Complexity: O(n), for the stack used to hold operands
def evalRPN(tokens: list) -> int:
    stack = []
    operators = {"+", "-", "*", "/"}
    
    for token in tokens:
        if token in operators:
            b = stack.pop()
            a = stack.pop()
            if token == "+":
                stack.append(a + b)
            elif token == "-":
                stack.append(a - b)
            elif token == "*":
                stack.append(a * b)
            else:
                stack.append(int(a / b))  # Use int() for floor division
        else:
            stack.append(int(token))
    
    return stack[0]
```

---

### ⚙️ Level 2: Optimized with Integer Division Handling

**Approach:**  
Same approach as Level 1, but with more efficient integer division handling for both positive and negative results. Python’s division operator returns float, so the result must be converted to an integer to simulate integer division.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def evalRPN(tokens: list) -> int:
    stack = []
    operators = {"+", "-", "*", "/"}
    
    for token in tokens:
        if token in operators:
            b = stack.pop()
            a = stack.pop()
            if token == "+":
                stack.append(a + b)
            elif token == "-":
                stack.append(a - b)
            elif token == "*":
                stack.append(a * b)
            else:
                stack.append(int(a / b))  # Ensure proper flooring of division
        else:
            stack.append(int(token))
    
    return stack[0]
```

---

### 🚀 Level 3: Single-Pass with Optimized Division Handling

**Approach:**  
This version is more focused on efficient implementation. The same stack-based approach is used, but we are extra cautious with handling the division operation to match the requirements of integer division in reverse polish notation.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def evalRPN(tokens: list) -> int:
    stack = []
    for token in tokens:
        if token in ["+", "-", "*", "/"]:
            b = stack.pop()
            a = stack.pop()
            if token == "+":
                stack.append(a + b)
            elif token == "-":
                stack.append(a - b)
            elif token == "*":
                stack.append(a * b)
            elif token == "/":
                # Using int() to simulate floor division as per problem requirements
                stack.append(int(a / b))
        else:
            stack.append(int(token))
    
    return stack[0]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity | Space Complexity |
|-------|-------------------------------------|-----------------|------------------|
| 1     | Stack with Operator Handling (Brute Force) | O(n)            | O(n)             |
| 2     | Optimized with Integer Division     | O(n)            | O(n)             |
| 3     | Single-Pass with Optimized Division | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)
2. [682. Baseball Game](https://leetcode.com/problems/baseball-game/)
3. [224. Basic Calculator](https://leetcode.com/problems/basic-calculator/)

---

## 📌 Takeaway Points

- **Stack-based approach** is fundamental for evaluating Reverse Polish Notation.
- Handle division carefully to ensure **integer flooring** in both positive and negative numbers.
- Efficient handling of both operators and numbers is key to optimizing this problem for larger input sizes.

---
