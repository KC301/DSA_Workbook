
---

# ➕ Problem: Invert Binary Tree

## 📘 Problem Statement

> Given the root of a binary tree, invert the tree, and return its root.  
> That is, swap the left and right children of all nodes in the tree.

**LeetCode Link:** [226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)

---

```
Example 1:

Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]

Example 2:

Input: root = [2,1,3]
Output: [2,3,1]

Example 3:

Input: root = []
Output: []
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 100]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Preorder Traversal)

**Approach:**  
Use a recursive function to traverse the tree in preorder and invert each node's children.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def invertTree(root):
    if not root:
        return None
    # Swap the left and right children
    root.left, root.right = root.right, root.left
    # Recursively invert the left and right subtrees
    invertTree(root.left)
    invertTree(root.right)
    return root
```

---

### ⚙️ Level 2: Iterative Approach (Level Order Traversal)

**Approach:**  
Use a queue to perform level-order traversal (BFS), and at each node, swap its left and right children.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import deque

def invertTree(root):
    if not root:
        return None
    queue = deque([root])
    while queue:
        node = queue.popleft()
        node.left, node.right = node.right, node.left
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)
    return root
```

---

### 🚀 Level 3: Optimized Iterative Approach (DFS)

**Approach:**  
Use an explicit stack for a depth-first search (DFS) approach to invert the tree.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def invertTree(root):
    if not root:
        return None
    stack = [root]
    while stack:
        node = stack.pop()
        node.left, node.right = node.right, node.left
        if node.left:
            stack.append(node.left)
        if node.right:
            stack.append(node.right)
    return root
```

---

## 🔗 Similar Problems

1. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
2. [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)
3. [617. Merge Two Binary Trees](https://leetcode.com/problems/merge-two-binary-trees/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Recursive Preorder (DFS)        | O(n)            | O(h)             |
| 2     | Iterative Level Order (BFS)     | O(n)            | O(n)             |
| 3     | Iterative DFS                   | O(n)            | O(h)             |

---

## 📌 Takeaway Points

- **Recursive Approach** is simple and elegant but uses stack space equivalent to the height of the tree.
- **Iterative Approaches (BFS and DFS)** avoid recursion stack overhead and are better for deeper trees.
- **Swapping children** at each node during traversal is the key to solving this problem efficiently.

---
