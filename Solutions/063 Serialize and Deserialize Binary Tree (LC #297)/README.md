
---

# ➕ Problem: Serialize and Deserialize Binary Tree

## 📘 Problem Statement

> Design an algorithm to serialize and deserialize a binary tree.  
> Serialization is the process of converting a binary tree into a string so that it can be stored in a file or transmitted over the network.  
> Deserialization is the process of converting the string back to a binary tree.

> Implement the `Codec` class:
> - `Codec.serialize(root)` Serializes a tree to a string.
> - `Codec.deserialize(data)` Deserializes a string to a tree.

**LeetCode Link:** [297. Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)

---

```
Example 1:

Input: root = [1,2,3,null,null,4,5]
Output: [1,2,3,null,null,4,5]

Example 2:

Input: root = []
Output: []
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 10⁴]`.
- `-1000 <= Node.val <= 1000`
- Do not use `eval` to solve this problem.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Basic Recursive Approach (Pre-order Traversal)

**Approach:**  
Serialize the tree using a pre-order traversal (root, left, right) where `None` nodes are represented by a special marker (e.g., `"#"`).  
Deserialize by reconstructing the tree from the serialized string.

```python
# Time Complexity: O(n), where n is the number of nodes
# Space Complexity: O(n), for storing the serialized string
class Codec:

    def serialize(self, root):
        def dfs(node):
            if not node:
                return "#"
            return str(node.val) + "," + dfs(node.left) + "," + dfs(node.right)
        return dfs(root)
    
    def deserialize(self, data):
        def dfs():
            val = next(vals)
            if val == "#":
                return None
            node = TreeNode(int(val))
            node.left = dfs()
            node.right = dfs()
            return node
        
        vals = iter(data.split(","))
        return dfs()
```

---

### ⚙️ Level 2: Optimized Recursive Approach (Using Pre-order Traversal with Marker)

**Approach:**  
Serialize the tree using a pre-order traversal and `#` as a marker for `None` nodes.  
Deserialization reconstructs the tree by reading the serialized string and creating nodes.

```python
# Time Complexity: O(n)
# Space Complexity: O(n), where n is the number of nodes
class Codec:

    def serialize(self, root):
        result = []
        def dfs(node):
            if not node:
                result.append("#")
                return
            result.append(str(node.val))
            dfs(node.left)
            dfs(node.right)
        
        dfs(root)
        return ",".join(result)
    
    def deserialize(self, data):
        def dfs():
            val = next(vals)
            if val == "#":
                return None
            node = TreeNode(int(val))
            node.left = dfs()
            node.right = dfs()
            return node
        
        vals = iter(data.split(","))
        return dfs()
```

---

### 🚀 Level 3: Iterative Approach (Using Queue and Level-order)

**Approach:**  
Serialize the tree using level-order traversal (BFS). Use a queue to process each node.  
For `None` nodes, store a special marker (`#`).  
Deserialize by processing the serialized string and reconstructing the tree level by level.

```python
# Time Complexity: O(n)
# Space Complexity: O(n), where n is the number of nodes
from collections import deque

class Codec:

    def serialize(self, root):
        if not root:
            return ""
        result = []
        queue = deque([root])
        while queue:
            node = queue.popleft()
            if node:
                result.append(str(node.val))
                queue.append(node.left)
                queue.append(node.right)
            else:
                result.append("#")
        return ",".join(result)
    
    def deserialize(self, data):
        if not data:
            return None
        values = iter(data.split(","))
        root = TreeNode(int(next(values)))
        queue = deque([root])
        while queue:
            node = queue.popleft()
            left_val = next(values)
            right_val = next(values)
            
            if left_val != "#":
                node.left = TreeNode(int(left_val))
                queue.append(node.left)
            if right_val != "#":
                node.right = TreeNode(int(right_val))
                queue.append(node.right)
        return root
```

---

## 🔗 Similar Problems

1. [449. Serialize and Deserialize BST](https://leetcode.com/problems/serialize-and-deserialize-bst/)
2. [652. Find Duplicate Subtrees](https://leetcode.com/problems/find-duplicate-subtrees/)
3. [606. Construct String from Binary Tree](https://leetcode.com/problems/construct-string-from-binary-tree/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Basic Recursive (Pre-order Traversal) | O(n)            | O(n)             |
| 2     | Optimized Recursive (Pre-order)      | O(n)            | O(n)             |
| 3     | Iterative (Level-order with Queue)    | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- **Serialization and Deserialization** of binary trees can be done using pre-order or level-order traversal techniques.
- **Pre-order traversal** is simple but requires careful handling of null nodes with markers (`#`).
- **Level-order traversal** (BFS) can be more memory efficient when working with larger trees, as it processes nodes level by level.

---
