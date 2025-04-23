
---

# ➕ Problem: Kth Smallest Element in a BST

## 📘 Problem Statement

> Given a binary search tree, write a function to find the `kth` smallest element in it.  
> Note that the BST is a binary search tree, where for every node, the left subtree’s values are smaller, and the right subtree’s values are greater.

**LeetCode Link:** [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)

---

```
Example 1:

Input: root = [3,1,4,null,2], k = 1
Output: 1

Example 2:

Input: root = [5,3,6,2,4,null,null,1], k = 3
Output: 3
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[1, 10⁴]`.
- `1 <= Node.val <= 10⁴`
- `1 <= k <= The total number of nodes in the tree`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: In-order Traversal (Brute Force)

**Approach:**  
Perform an in-order traversal of the BST. Since in-order traversal of a BST gives the elements in sorted order, simply visit the nodes in order and return the `k`th element.

```python
# Time Complexity: O(n), where n is the number of nodes in the tree
# Space Complexity: O(n) for the recursion stack (or O(h) for the iterative approach)
def kthSmallest(root, k):
    def inorder(node):
        if not node:
            return []
        return inorder(node.left) + [node.val] + inorder(node.right)
    
    return inorder(root)[k - 1]
```

---

### ⚙️ Level 2: In-order Traversal with Early Termination

**Approach:**  
Same as Level 1, but we terminate early when we've visited `k` elements, avoiding unnecessary work.

```python
# Time Complexity: O(n), where n is the number of nodes in the tree
# Space Complexity: O(h) for recursion stack
def kthSmallest(root, k):
    stack = []
    while True:
        while root:
            stack.append(root)
            root = root.left
        root = stack.pop()
        k -= 1
        if k == 0:
            return root.val
        root = root.right
```

---

### 🚀 Level 3: Optimized Approach with Iterative In-order Traversal

**Approach:**  
Use an iterative in-order traversal to minimize space usage. Only push nodes to the stack until we find the `k`th smallest element.

```python
# Time Complexity: O(h + k), where h is the height of the tree, and k is the number of nodes visited
# Space Complexity: O(h), for the recursion stack or iterative stack
def kthSmallest(root, k):
    stack = []
    while root or stack:
        while root:
            stack.append(root)
            root = root.left
        root = stack.pop()
        k -= 1
        if k == 0:
            return root.val
        root = root.right
```

---

## 🔗 Similar Problems

1. [98. Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)
2. [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)
3. [173. Binary Search Tree Iterator](https://leetcode.com/problems/binary-search-tree-iterator/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                   | Time Complexity | Space Complexity |
|-------|--------------------------------------------|-----------------|------------------|
| 1     | In-order Traversal (Brute Force)           | O(n)            | O(n)             |
| 2     | In-order Traversal with Early Termination  | O(n)            | O(h)             |
| 3     | Optimized Iterative In-order Traversal     | O(h + k)        | O(h)             |

---

## 📌 Takeaway Points

- **In-order traversal** of a BST gives elements in sorted order.
- Early termination in traversal can improve efficiency when finding the `k`th element.
- **Iterative approach** minimizes space usage by avoiding recursion when possible.

---
