
---

# ➕ Problem: Validate Binary Search Tree

## 📘 Problem Statement

> Given the root of a binary tree, determine if it is a valid binary search tree (BST).  
> A valid BST is defined as follows:
> - The left subtree of a node contains only nodes with keys **less than** the node’s key.
> - The right subtree of a node contains only nodes with keys **greater than** the node’s key.
> - Both the left and right subtrees must also be binary search trees.

**LeetCode Link:** [98. Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)

---

```
Example 1:

Input: root = [2,1,3]
Output: true

Example 2:

Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[1, 10⁴]`.
- `-2³¹ <= Node.val <= 2³¹ - 1`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Inorder Traversal)

**Approach:**  
Use a recursive approach with an inorder traversal of the tree. For a valid BST, the values of the nodes must appear in **sorted order**.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isValidBST(root):
    def inorder(node):
        if not node:
            return []
        return inorder(node.left) + [node.val] + inorder(node.right)

    inorder_values = inorder(root)
    return all(inorder_values[i] < inorder_values[i + 1] for i in range(len(inorder_values) - 1))
```

---

### ⚙️ Level 2: Recursive Approach (Min/Max Range)

**Approach:**  
Use recursion and validate whether each node's value lies within a valid range. The range is updated as we traverse down the tree.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isValidBST(root):
    def helper(node, low, high):
        if not node:
            return True
        if not (low < node.val < high):
            return False
        return helper(node.left, low, node.val) and helper(node.right, node.val, high)

    return helper(root, -float('inf'), float('inf'))
```

---

### 🚀 Level 3: Iterative Approach (Using Stack)

**Approach:**  
Use an explicit stack to simulate the recursive behavior. Push nodes onto the stack with their valid ranges and process them iteratively.

```python
# Time Complexity: O(n)
# Space Complexity: O(h), where h is the height of the tree
def isValidBST(root):
    stack = [(root, -float('inf'), float('inf'))]
    while stack:
        node, low, high = stack.pop()
        if not node:
            continue
        if not (low < node.val < high):
            return False
        stack.append((node.left, low, node.val))
        stack.append((node.right, node.val, high))
    return True
```

---

## 🔗 Similar Problems

1. [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)
2. [98. Validate Binary Search Tree (Follow-up with recursive validation)](https://leetcode.com/problems/validate-binary-search-tree/)
3. [107. Binary Tree Level Order Traversal II](https://leetcode.com/problems/binary-tree-level-order-traversal-ii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Inorder Traversal                    | O(n)            | O(h)             |
| 2     | Recursive Min/Max Range Validation   | O(n)            | O(h)             |
| 3     | Iterative with Stack                 | O(n)            | O(h)             |

---

## 📌 Takeaway Points

- **Inorder traversal** naturally gives the nodes in sorted order for a valid BST, but it may not be efficient for large trees due to memory constraints.
- **Min/Max range validation** is a more efficient recursive solution that checks the validity of the tree at each step by maintaining the allowed value range.
- **Iterative stack approach** eliminates the need for recursion depth, which may be helpful for avoiding stack overflow in very deep trees.

---
