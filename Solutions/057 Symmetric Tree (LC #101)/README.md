
---

# ➕ Problem: Symmetric Tree

## 📘 Problem Statement

> Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).  
> A tree is symmetric if it is **structurally identical** and the left and right subtrees are **mirror images** of each other.

**LeetCode Link:** [101. Symmetric Tree](https://leetcode.com/problems/symmetric-tree/)

---

```
Example 1:

Input: root = [1,2,2,3,4,4,3]
Output: true

Example 2:

Input: root = [1,2,2,null,3,null,3]
Output: false
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[1, 1000]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Mirror Check)

**Approach:**  
Use a recursive function to check if two trees are mirrors of each other. At each level, we compare the left and right subtrees.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isSymmetric(root):
    def isMirror(t1, t2):
        if not t1 and not t2:
            return True
        if not t1 or not t2:
            return False
        return t1.val == t2.val and isMirror(t1.left, t2.right) and isMirror(t1.right, t2.left)

    if not root:
        return True
    return isMirror(root.left, root.right)
```

---

### ⚙️ Level 2: Iterative Approach (Level Order Traversal)

**Approach:**  
Use a queue to perform level-order traversal (BFS) and compare nodes at each level to check if they are mirror images.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import deque

def isSymmetric(root):
    if not root:
        return True
    queue = deque([root.left, root.right])
    while queue:
        t1, t2 = queue.popleft(), queue.popleft()
        if not t1 and not t2:
            continue
        if not t1 or not t2 or t1.val != t2.val:
            return False
        queue.append(t1.left)
        queue.append(t2.right)
        queue.append(t1.right)
        queue.append(t2.left)
    return True
```

---

### 🚀 Level 3: Optimized Iterative Approach (DFS with Stack)

**Approach:**  
Instead of BFS, use DFS with an explicit stack to check the mirror condition, which can improve performance in some cases.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isSymmetric(root):
    if not root:
        return True
    stack = [(root.left, root.right)]
    while stack:
        t1, t2 = stack.pop()
        if not t1 and not t2:
            continue
        if not t1 or not t2 or t1.val != t2.val:
            return False
        stack.append((t1.left, t2.right))
        stack.append((t1.right, t2.left))
    return True
```

---

## 🔗 Similar Problems

1. [100. Same Tree](https://leetcode.com/problems/same-tree/)
2. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
3. [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Recursive Mirror Check           | O(n)            | O(h)             |
| 2     | Iterative Level Order (BFS)      | O(n)            | O(n)             |
| 3     | Optimized Iterative DFS (Stack)  | O(n)            | O(h)             |

---

## 📌 Takeaway Points

- **Recursive approach** is the most straightforward way to check for symmetry, as it uses a simple mirror check at each level.
- **Iterative BFS** (Level Order Traversal) is useful for avoiding deep recursion and managing large trees.
- **Optimized DFS with stack** reduces the overhead of recursion by explicitly managing the traversal stack.

---
