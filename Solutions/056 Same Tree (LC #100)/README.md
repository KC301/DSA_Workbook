
---

# ➕ Problem: Same Tree

## 📘 Problem Statement

> Given the roots of two binary trees `p` and `q`, write a function to check if they are the same or not.  
> Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

**LeetCode Link:** [100. Same Tree](https://leetcode.com/problems/same-tree/)

---

```
Example 1:

Input: p = [1,2,3], q = [1,2,3]
Output: true

Example 2:

Input: p = [1,2], q = [1,null,2]
Output: false

Example 3:

Input: p = [1,2,1], q = [1,1,2]
Output: false
```

---

## ✅ Constraints

- The number of nodes in both trees is in the range `[0, 100]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Preorder Traversal)

**Approach:**  
Use a recursive function to check if the nodes in the trees are equal, both in value and structure.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isSameTree(p, q):
    if not p and not q:
        return True
    if not p or not q:
        return False
    return p.val == q.val and isSameTree(p.left, q.left) and isSameTree(p.right, q.right)
```

---

### ⚙️ Level 2: Iterative Approach (Level Order Traversal)

**Approach:**  
Use a queue to perform level-order traversal and compare the nodes of the trees at each level.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import deque

def isSameTree(p, q):
    if not p and not q:
        return True
    if not p or not q:
        return False

    queue = deque([(p, q)])
    while queue:
        node1, node2 = queue.popleft()
        if not node1 and not node2:
            continue
        if not node1 or not node2:
            return False
        if node1.val != node2.val:
            return False
        queue.append((node1.left, node2.left))
        queue.append((node1.right, node2.right))

    return True
```

---

### 🚀 Level 3: Optimized DFS Approach

**Approach:**  
Use a DFS approach with an explicit stack, reducing space complexity from the recursive approach.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isSameTree(p, q):
    stack = [(p, q)]
    while stack:
        node1, node2 = stack.pop()
        if not node1 and not node2:
            continue
        if not node1 or not node2:
            return False
        if node1.val != node2.val:
            return False
        stack.append((node1.left, node2.left))
        stack.append((node1.right, node2.right))

    return True
```

---

## 🔗 Similar Problems

1. [101. Symmetric Tree](https://leetcode.com/problems/symmetric-tree/)
2. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
3. [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Recursive Preorder (DFS)        | O(n)            | O(h)             |
| 2     | Iterative Level Order (BFS)     | O(n)            | O(n)             |
| 3     | Optimized DFS                   | O(n)            | O(h)             |

---

## 📌 Takeaway Points

- **Recursive DFS** is the most intuitive approach, checking node values and structure at each level.
- **Iterative BFS** avoids recursion and provides a non-recursive alternative for tree traversal.
- **Optimized DFS** using an explicit stack helps reduce the recursion depth and manages space more efficiently.

---
