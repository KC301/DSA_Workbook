
---

# ➕ Problem: Diameter of Binary Tree

## 📘 Problem Statement

> Given the root of a binary tree, return the length of the diameter of the tree.  
> The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.  
> The length of a path between two nodes is represented by the number of edges between them.

**LeetCode Link:** [543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)

---

```
Example 1:

Input: root = [1,2,3,4,5]
Output: 3
Explanation: The diameter of the tree is the path [4,2,1,3] or [5,2,1,3], which has length 3.

Example 2:

Input: root = [1,2]
Output: 1
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[1, 10⁴]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Postorder Traversal)

**Approach:**  
Use a recursive function to calculate the height of each subtree while simultaneously tracking the diameter.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def diameterOfBinaryTree(root):
    diameter = 0

    def depth(node):
        nonlocal diameter
        if not node:
            return 0
        left_depth = depth(node.left)
        right_depth = depth(node.right)
        diameter = max(diameter, left_depth + right_depth)
        return 1 + max(left_depth, right_depth)

    depth(root)
    return diameter
```

---

### ⚙️ Level 2: Optimized Approach (Depth Calculation with Diameter)

**Approach:**  
Perform a postorder traversal and calculate both the depth of the tree and the diameter in a single pass.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def diameterOfBinaryTree(root):
    diameter = 0

    def dfs(node):
        nonlocal diameter
        if not node:
            return 0
        left_depth = dfs(node.left)
        right_depth = dfs(node.right)
        diameter = max(diameter, left_depth + right_depth)
        return 1 + max(left_depth, right_depth)

    dfs(root)
    return diameter
```

---

### 🚀 Level 3: Iterative DFS Approach (Using Stack)

**Approach:**  
Using a stack for a depth-first search (DFS) while maintaining the depth of nodes and the diameter as you go.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def diameterOfBinaryTree(root):
    if not root:
        return 0
    
    stack = [(root, 0)]  # (node, depth)
    diameter = 0
    node_depth = {}
    
    while stack:
        node, depth = stack.pop()
        if node:
            node_depth[node] = depth
            stack.append((node.left, depth + 1))
            stack.append((node.right, depth + 1))
    
    for node in node_depth:
        left_depth = node_depth.get(node.left, 0)
        right_depth = node_depth.get(node.right, 0)
        diameter = max(diameter, left_depth + right_depth)
    
    return diameter
```

---

## 🔗 Similar Problems

1. [110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)
2. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
3. [112. Path Sum](https://leetcode.com/problems/path-sum/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Recursive Postorder Traversal        | O(n)            | O(h)             |
| 2     | Optimized DFS with Depth Calculation | O(n)            | O(h)             |
| 3     | Iterative DFS with Stack             | O(n)            | O(h)             |

---

## 📌 Takeaway Points

- **Recursive approach** is efficient and straightforward, ensuring both the depth and diameter are calculated in a single traversal.
- **Optimized DFS** calculates the depth and diameter in one pass, which helps with efficiency.
- **Iterative DFS** using a stack can be useful when recursion depth is a concern.

---
