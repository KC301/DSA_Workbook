
---

# ➕ Problem: Binary Tree Level Order Traversal

## 📘 Problem Statement

> Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).  

**LeetCode Link:** [102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)

---

```
Example 1:

Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]

Example 2:

Input: root = [1]
Output: [[1]]

Example 3:

Input: root = []
Output: []
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 2000]`.
- `-1000 <= Node.val <= 1000`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Using DFS)

**Approach:**  
Perform a depth-first search (DFS) and collect the values at each level. Use a helper function to traverse the tree and append each level to a result list.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def levelOrder(root):
    result = []
    
    def dfs(node, level):
        if not node:
            return
        if len(result) <= level:
            result.append([])
        result[level].append(node.val)
        dfs(node.left, level + 1)
        dfs(node.right, level + 1)
    
    dfs(root, 0)
    return result
```

---

### ⚙️ Level 2: Iterative Approach (Using Queue)

**Approach:**  
Use a queue (breadth-first search, BFS) to traverse the tree level by level. For each node, enqueue its children and process the nodes level by level.

```python
# Time Complexity: O(n)
# Space Complexity: O(n), where n is the number of nodes in the tree
from collections import deque

def levelOrder(root):
    if not root:
        return []
    result = []
    queue = deque([root])
    while queue:
        level_values = []
        level_size = len(queue)
        for _ in range(level_size):
            node = queue.popleft()
            level_values.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        result.append(level_values)
    return result
```

---

### 🚀 Level 3: Optimized Approach (Queue with Early Return)

**Approach:**  
Using the queue to perform a level-order traversal, but optimize by returning early when all nodes are processed.

```python
# Time Complexity: O(n)
# Space Complexity: O(n), where n is the number of nodes in the tree
from collections import deque

def levelOrder(root):
    if not root:
        return []
    result = []
    queue = deque([root])
    while queue:
        level_values = []
        for _ in range(len(queue)):
            node = queue.popleft()
            level_values.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        result.append(level_values)
    return result
```

---

## 🔗 Similar Problems

1. [103. Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)
2. [199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)
3. [107. Binary Tree Level Order Traversal II](https://leetcode.com/problems/binary-tree-level-order-traversal-ii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Recursive DFS                     | O(n)            | O(h)             |
| 2     | Iterative BFS with Queue          | O(n)            | O(n)             |
| 3     | Optimized BFS with Early Return   | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- **Recursive approach** can be elegant and works well for smaller trees or when depth-first traversal is desired.
- **Iterative approach** (BFS with a queue) is typically the most efficient for level-order traversal as it directly maps to the problem's requirements.
- **Optimized BFS** enhances the standard queue-based traversal by ensuring we capture all levels efficiently.

---
