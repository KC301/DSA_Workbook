
---

# ➕ Problem: Implement Queue using Stacks

## 📘 Problem Statement

> Implement a first in first out (FIFO) queue using only two stacks.  
> The implemented queue should support all the functions of a normal queue (`push`, `peek`, `pop`, and `empty`).  
> You must use only standard stack operations — that is, only `push to top`, `peek/pop from top`, `size`, and `is empty`.

**LeetCode Link:** [232. Implement Queue using Stacks](https://leetcode.com/problems/implement-queue-using-stacks/)

---

```
Example 1:

Input:
["MyQueue", "push", "push", "peek", "pop", "empty"]
[[], [1], [2], [], [], []]
Output:
[null, null, null, 1, 1, false]
```

---

## ✅ Constraints

- `1 <= x <= 9`
- At most `100` calls will be made to `push`, `pop`, `peek`, and `empty`.
- All the calls to `pop` and `peek` are valid.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Using Two Stacks — Transfer on Each Operation

**Approach:**  
For every `pop` or `peek`, transfer all elements to a second stack to reverse order. Very inefficient for frequent operations.

```python
# Time Complexity:
# Push: O(1), Pop/Peek: O(n)
# Space Complexity: O(n)
class MyQueue:
    def __init__(self):
        self.stack = []

    def push(self, x: int) -> None:
        self.stack.append(x)

    def pop(self) -> int:
        temp = []
        while self.stack:
            temp.append(self.stack.pop())
        res = temp.pop()
        while temp:
            self.stack.append(temp.pop())
        return res

    def peek(self) -> int:
        temp = []
        while self.stack:
            temp.append(self.stack.pop())
        res = temp[-1]
        while temp:
            self.stack.append(temp.pop())
        return res

    def empty(self) -> bool:
        return not self.stack
```

---

### ⚙️ Level 2: Two Stacks with Lazy Transfer

**Approach:**  
Use two stacks (`input` for push, `output` for pop/peek). Only transfer when `output` is empty. More efficient.

```python
# Time Complexity:
# Push: O(1), Pop/Peek: Amortized O(1)
# Space Complexity: O(n)
class MyQueue:
    def __init__(self):
        self.input = []
        self.output = []

    def push(self, x: int) -> None:
        self.input.append(x)

    def pop(self) -> int:
        if not self.output:
            while self.input:
                self.output.append(self.input.pop())
        return self.output.pop()

    def peek(self) -> int:
        if not self.output:
            while self.input:
                self.output.append(self.input.pop())
        return self.output[-1]

    def empty(self) -> bool:
        return not self.input and not self.output
```

---

### 🚀 Level 3: Optimized Two Stacks with Clear Separation

**Approach:**  
Same as Level 2 but clean separation of logic and early exits. This version is easier to maintain and debug.

```python
# Time Complexity:
# Push: O(1), Pop/Peek: Amortized O(1)
# Space Complexity: O(n)
class MyQueue:
    def __init__(self):
        self.in_stack = []
        self.out_stack = []

    def push(self, x: int) -> None:
        self.in_stack.append(x)

    def pop(self) -> int:
        self.move()
        return self.out_stack.pop()

    def peek(self) -> int:
        self.move()
        return self.out_stack[-1]

    def empty(self) -> bool:
        return not self.in_stack and not self.out_stack

    def move(self):
        if not self.out_stack:
            while self.in_stack:
                self.out_stack.append(self.in_stack.pop())
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity (Push / Pop / Peek) | Space Complexity |
|-------|--------------------------------------|-------------------------------------|------------------|
| 1     | Transfer all on each operation       | O(1) / O(n) / O(n)                  | O(n)             |
| 2     | Lazy Transfer with Two Stacks        | O(1) / Amortized O(1)               | O(n)             |
| 3     | Optimized Lazy Transfer (Cleaner)    | O(1) / Amortized O(1)               | O(n)             |

---

## 🔗 Similar Problems

1. [225. Implement Stack using Queues](https://leetcode.com/problems/implement-stack-using-queues/)
2. [346. Moving Average from Data Stream](https://leetcode.com/problems/moving-average-from-data-stream/)
3. [155. Min Stack](https://leetcode.com/problems/min-stack/)

---

## 📌 Takeaway Points

- Use **two stacks** to simulate a queue — one for pushing, one for popping.
- Transfer elements **only when necessary** to achieve amortized `O(1)` performance.
- Clean design with helper methods improves readability and maintainability.

---
