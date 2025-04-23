
---

# ➕ Problem: Min Stack

## 📘 Problem Statement

> Design a stack that supports the following operations:
> 1. `push(x)` — Push the element `x` onto the stack.
> 2. `pop()` — Removes the element on the top of the stack.
> 3. `top()` — Get the top element.
> 4. `getMin()` — Retrieve the minimum element in the stack.

**LeetCode Link:** [155. Min Stack](https://leetcode.com/problems/min-stack/)

---

```
Example 1:

Input: 
["MinStack","push","push","push","getMin","pop","top","getMin"]
[[],[-2],[0],[-3],[],[],[],[]]
Output: 
[null,null,null,null,-3,null,0,-2]

Explanation:
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.getMin();   --> Returns -3.
minStack.pop();
minStack.top();      --> Returns 0.
minStack.getMin();   --> Returns -2.
```

---

## ✅ Constraints

- `pop`, `top`, and `getMin` operations will always be called on a non-empty stack.
- `1 <= x <= 10⁴`
- The stack will only contain integers.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Stack

**Approach:**  
Use a single stack to keep track of the elements. For the `getMin` operation, traverse the stack to find the minimum value. This is inefficient but simple to implement.

```python
# Time Complexity: O(n) for getMin() operation, where n is the number of elements in the stack
# Space Complexity: O(n), for the stack itself
class MinStack:

    def __init__(self):
        self.stack = []

    def push(self, x: int) -> None:
        self.stack.append(x)

    def pop(self) -> None:
        self.stack.pop()

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        return min(self.stack)
```

---

### ⚙️ Level 2: Stack with a Helper Stack for Minimum Values

**Approach:**  
Maintain a second stack to keep track of the minimum values. When a new element is pushed, also push the new minimum onto the second stack. When an element is popped, pop from both stacks. This ensures that `getMin` operates in constant time.

```python
# Time Complexity: O(1) for all operations
# Space Complexity: O(n), for the two stacks
class MinStack:

    def __init__(self):
        self.stack = []
        self.min_stack = []

    def push(self, x: int) -> None:
        self.stack.append(x)
        # If the min_stack is empty or the current element is smaller than the top of the min_stack, push it onto the min_stack
        if not self.min_stack or x <= self.min_stack[-1]:
            self.min_stack.append(x)

    def pop(self) -> None:
        popped_element = self.stack.pop()
        if popped_element == self.min_stack[-1]:
            self.min_stack.pop()

    def top(self) -> int:
        return self.stack[-1]

    def getMin(self) -> int:
        return self.min_stack[-1]
```

---

### 🚀 Level 3: Optimized Space Using Tuple (Single Stack)

**Approach:**  
Instead of using two separate stacks, store the minimum value along with the element itself as a tuple in the main stack. This reduces the space complexity while still allowing constant time operations for `push`, `pop`, and `getMin`.

```python
# Time Complexity: O(1) for all operations
# Space Complexity: O(n), for the stack
class MinStack:

    def __init__(self):
        self.stack = []

    def push(self, x: int) -> None:
        # If stack is empty, the min value is x; otherwise, the min value is the minimum of x and the last min value
        min_val = x if not self.stack else min(x, self.stack[-1][1])
        self.stack.append((x, min_val))

    def pop(self) -> None:
        self.stack.pop()

    def top(self) -> int:
        return self.stack[-1][0]

    def getMin(self) -> int:
        return self.stack[-1][1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                  | Time Complexity | Space Complexity |
|-------|-------------------------------------------|-----------------|------------------|
| 1     | Brute Force Stack                         | O(n)            | O(n)             |
| 2     | Stack with Helper Min Stack               | O(1)            | O(n)             |
| 3     | Optimized Single Stack with Tuple         | O(1)            | O(n)             |

---

## 🔗 Similar Problems

1. [155. Min Stack (Optimized)](https://leetcode.com/problems/min-stack/)
2. [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)
3. [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)
4. [71. Simplify Path](https://leetcode.com/problems/simplify-path/)
5. [394. Decode String](https://leetcode.com/problems/decode-string/)

---

## 📌 Takeaway Points

- **Two-stack approach** ensures that `getMin` runs in constant time (`O(1)`), making the solution efficient for large datasets.
- Storing a tuple with the current value and its corresponding minimum in the stack is an elegant solution that reduces the need for an additional stack.
- By avoiding traversal of the entire stack for each `getMin` call, you improve performance significantly in practice.

---
