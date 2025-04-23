
---

# ➕ Problem: Maximum Depth of Binary Tree

## 📘 Problem Statement

> Given the root of a binary tree, return its maximum depth.  
> A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

**LeetCode Link:** [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

---

```
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: 3

Example 2:

Input: root = [1,null,2]
Output: 2
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 1000]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Postorder Traversal)

**Approach:**  
Use a recursive function to traverse the tree and calculate the depth of each subtree.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def maxDepth(root):
    if not root:
        return 0
    left_depth = maxDepth(root.left)
    right_depth = maxDepth(root.right)
    return 1 + max(left_depth, right_depth)
```

---

### ⚙️ Level 2: Iterative Approach (Level Order Traversal)

**Approach:**  
Use a queue to perform level-order traversal (BFS), counting the levels as we go.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import deque

def maxDepth(root):
    if not root:
        return 0
    queue = deque([root])
    depth = 0
    while queue:
        level_size = len(queue)
        for _ in range(level_size):
            node = queue.popleft()
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        depth += 1
    return depth
```

---

### 🚀 Level 3: Optimized DFS (Using Stack)

**Approach:**  
Use a stack for a depth-first search (DFS) to compute the depth by visiting nodes and checking the depth at each level.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def maxDepth(root):
    if not root:
        return 0
    stack = [(root, 1)]  # node and its depth
    max_depth = 0
    while stack:
        node, depth = stack.pop()
        if node:
            max_depth = max(max_depth, depth)
            stack.append((node.left, depth + 1))
            stack.append((node.right, depth + 1))
    return max_depth
```

---

## 🔗 Similar Problems

1. [110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)
2. [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)
3. [104. Maximum Depth of N-ary Tree](https://leetcode.com/problems/maximum-depth-of-n-ary-tree/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Recursive Postorder Traversal   | O(n)            | O(h)             |
| 2     | Iterative Level Order (BFS)     | O(n)            | O(n)             |
| 3     | Optimized DFS (Using Stack)     | O(n)            | O(h)             |

---

## 📌 Takeaway Points

- **Recursive approach** is simple and elegant, but it uses stack space proportional to the tree height.
- **Iterative BFS** is efficient for trees that are too deep to handle recursion, as it avoids recursion overhead.
- **Optimized DFS** using an explicit stack gives the advantage of avoiding the recursive function call stack.

---
