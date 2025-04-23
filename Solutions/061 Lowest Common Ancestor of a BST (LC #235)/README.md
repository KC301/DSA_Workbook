
---

# ➕ Problem: Lowest Common Ancestor of a Binary Search Tree

## 📘 Problem Statement

> Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the tree.  
> According to the definition of LCA on Wikipedia:  
> “The lowest common ancestor is defined between two nodes `p` and `q` as the lowest node in the tree that has both `p` and `q` as descendants (where we allow a node to be a descendant of itself).”

**LeetCode Link:** [235. Lowest Common Ancestor of a Binary Search Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)

---

```
Example 1:

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.

Example 2:

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
Output: 2
Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself.
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[2, 10⁵]`.
- `-10⁹ <= Node.val <= 10⁹`
- All `Node.val` are unique.
- `p != q`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Approach (Standard BST Property)

**Approach:**  
Leverage the properties of a BST: For any node `n`, all nodes in the left subtree are smaller, and all nodes in the right subtree are larger. Thus, we can find the LCA by checking the values relative to the current node.

```python
# Time Complexity: O(h), where h is the height of the tree
# Space Complexity: O(h), where h is the height of the tree
def lowestCommonAncestor(root, p, q):
    if not root:
        return None
    if p.val < root.val and q.val < root.val:
        return lowestCommonAncestor(root.left, p, q)
    if p.val > root.val and q.val > root.val:
        return lowestCommonAncestor(root.right, p, q)
    return root
```

---

### ⚙️ Level 2: Iterative Approach (Using BST Properties)

**Approach:**  
Instead of recursion, use an iterative approach to traverse the tree, applying the same BST properties to locate the LCA.

```python
# Time Complexity: O(h), where h is the height of the tree
# Space Complexity: O(1)
def lowestCommonAncestor(root, p, q):
    while root:
        if p.val < root.val and q.val < root.val:
            root = root.left
        elif p.val > root.val and q.val > root.val:
            root = root.right
        else:
            return root
    return None
```

---

### 🚀 Level 3: Optimized Recursive with Early Return

**Approach:**  
Optimize the recursion by returning as soon as the LCA is found. The recursive tree exploration stops once we identify the split point.

```python
# Time Complexity: O(h), where h is the height of the tree
# Space Complexity: O(h), where h is the height of the tree
def lowestCommonAncestor(root, p, q):
    if not root:
        return None
    if p.val < root.val and q.val < root.val:
        return lowestCommonAncestor(root.left, p, q)
    if p.val > root.val and q.val > root.val:
        return lowestCommonAncestor(root.right, p, q)
    return root
```

---

## 🔗 Similar Problems

1. [236. Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)
2. [1650. Lowest Common Ancestor of a Binary Tree III](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-iii/)
3. [1248. Count Number of Nice Subarrays](https://leetcode.com/problems/count-number-of-nice-subarrays/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                               | Time Complexity | Space Complexity |
|-------|----------------------------------------|-----------------|------------------|
| 1     | Recursive Approach (Standard BST)      | O(h)            | O(h)             |
| 2     | Iterative Approach (Using BST Properties) | O(h)            | O(1)             |
| 3     | Optimized Recursive Approach           | O(h)            | O(h)             |

---

## 📌 Takeaway Points

- **Recursive solutions** work well for this problem and are straightforward since they naturally follow the structure of the BST.
- **Iterative solutions** are useful when you want to avoid recursion and stack depth issues, especially in deep trees.
- The **optimized approach** stops early when the split point is found, making it more efficient in certain scenarios.

---
