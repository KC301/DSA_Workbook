
🍏 Apple – 20 DSA Questions

1. [Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)
2. [Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)
3. [Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
4. [Rotate Image](https://leetcode.com/problems/rotate-image/)
5. [Subsets](https://leetcode.com/problems/subsets/)
6. [Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)
7. [Lowest Common Ancestor of a BST](https://leetcode.com/problems/lowest-common-ancestor-of-a-bst/)
8. [Unique Paths](https://leetcode.com/problems/unique-paths/)
9. [Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
10. [Find Peak Element](https://leetcode.com/problems/find-peak-element/)
11. [N-Queens](https://leetcode.com/problems/n-queens/)
12. [Combination Sum](https://leetcode.com/problems/combination-sum/)
13. [3Sum](https://leetcode.com/problems/3sum/)
14. [Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)
15. [Implement strStr()](https://leetcode.com/problems/implement-strstr/)
16. [Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)
17. [Reverse Words in a String](https://leetcode.com/problems/reverse-words-in-a-string/)
18. [Construct Binary Tree from Preorder and Inorder](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)
19. [Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/)
20. [Wildcard Matching](https://leetcode.com/problems/wildcard-matching/)

------------------------------------------------------------------------------------------------------------
1. Merge Two Sorted Lists

---

# ➕ Problem: Merge Two Sorted Lists

## 📘 Problem Statement

> Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.  
> You must solve it without using extra space (except for the output list).

**LeetCode Link:** [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)

---

```
Example 1:
Input: l1 = [1,2,4], l2 = [1,3,4]
Output: [1,1,2,3,4,4]

Example 2:
Input: l1 = [], l2 = [0]
Output: [0]

Example 3:
Input: l1 = [], l2 = []
Output: []

```

## ✅ Constraints

- The number of nodes in each list is in the range [0, 50].
- `-100 <= Node.val <= 100`
- Both `l1` and `l2` are sorted in non-decreasing order.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach (Iterative)

**Approach:**  
We can iterate through both lists and insert the smaller node into the resulting list.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(1)
def mergeTwoLists(l1, l2):
    dummy = ListNode(0)
    current = dummy
    
    while l1 and l2:
        if l1.val < l2.val:
            current.next = l1
            l1 = l1.next
        else:
            current.next = l2
            l2 = l2.next
        current = current.next
        
    current.next = l1 if l1 else l2
    
    return dummy.next
```

---

### ⚙️ Level 2: Optimized Approach (Using Recursion)

**Approach:**  
Use recursion to merge the two lists by comparing the heads of each list and recursively merging the rest.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(n + m) (due to recursion stack)
def mergeTwoLists(l1, l2):
    if not l1:
        return l2
    if not l2:
        return l1
    
    if l1.val < l2.val:
        l1.next = mergeTwoLists(l1.next, l2)
        return l1
    else:
        l2.next = mergeTwoLists(l1, l2.next)
        return l2
```

---

### 🚀 Level 3: Optimized Approach with Tail Pointer

**Approach:**  
We can use a "tail pointer" to iterate through both lists and build the result list iteratively.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(1)
def mergeTwoLists(l1, l2):
    dummy = ListNode(0)
    tail = dummy

    while l1 and l2:
        if l1.val < l2.val:
            tail.next = l1
            l1 = l1.next
        else:
            tail.next = l2
            l2 = l2.next
        tail = tail.next

    tail.next = l1 if l1 else l2
    
    return dummy.next
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Iterative (Brute Force)          | O(n + m)        | O(1)             |
| 2     | Recursive                         | O(n + m)        | O(n + m)         |
| 3     | Iterative (Optimized with Tail)  | O(n + m)        | O(1)             |

---

## 🔗 Similar Problems

1. [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)
2. [148. Sort List](https://leetcode.com/problems/sort-list/)
3. [21. Merge Two Sorted Lists (Follow-up with multiple lists)](https://leetcode.com/problems/merge-two-sorted-lists/)

---

## 📌 Takeaway Points

- The brute force approach uses iteration to manually merge two lists.
- The recursive approach simplifies the logic but comes at the cost of higher space complexity due to recursion stack.
- The optimized iterative solution with a tail pointer allows us to merge in-place without using extra space, providing optimal performance.

---

2. Binary Tree Right Side View


---

# 🌳 Problem: Binary Tree Right Side View

## 📘 Problem Statement

> Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
> 
> You need to return the right side view of the binary tree.

**LeetCode Link:** [199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

---

```
Example 1:
Input: root = [1,2,3,null,5,null,4]
Output: [1,3,4]

Example 2:
Input: root = [1,2]
Output: [1,2]

Example 3:
Input: root = []
Output: []
```

## ✅ Constraints

- The number of nodes in the tree is in the range [0, 100].
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach (Level-Order Traversal)

**Approach:**  
Use a breadth-first search (BFS) or level-order traversal to visit each level of the tree and collect the rightmost element from each level.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import deque

def rightSideView(root):
    if not root:
        return []
    
    result = []
    queue = deque([root])
    
    while queue:
        level_size = len(queue)
        for i in range(level_size):
            node = queue.popleft()
            if i == level_size - 1:  # the rightmost element at each level
                result.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
    
    return result
```

---

### ⚙️ Level 2: Optimized Approach (DFS with Depth Tracking)

**Approach:**  
A depth-first search (DFS) approach where we keep track of the depth of each node. For each depth, we record the first encountered node since it is the rightmost one for that level.

```python
# Time Complexity: O(n)
# Space Complexity: O(h) (height of the tree)
def rightSideView(root):
    def dfs(node, depth):
        if not node:
            return
        
        if depth == len(result):  # we are at a new level
            result.append(node.val)
        
        # Traverse right first to ensure right side view is seen first
        dfs(node.right, depth + 1)
        dfs(node.left, depth + 1)

    result = []
    dfs(root, 0)
    return result
```

---

### 🚀 Level 3: Optimized Approach (Iterative DFS)

**Approach:**  
An iterative approach that mimics the depth-first search but using an explicit stack. The key here is to always explore the right child before the left child to ensure the rightmost node is processed first.

```python
# Time Complexity: O(n)
# Space Complexity: O(h) (height of the tree)
def rightSideView(root):
    if not root:
        return []
    
    result = []
    stack = [(root, 0)]  # node with its depth
    
    while stack:
        node, depth = stack.pop()
        
        if depth == len(result):  # we are at a new level
            result.append(node.val)
        
        # Push right child first, so we encounter it first
        if node.right:
            stack.append((node.right, depth + 1))
        if node.left:
            stack.append((node.left, depth + 1))
    
    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | BFS (Level-Order Traversal)      | O(n)            | O(n)             |
| 2     | DFS (Recursive)                  | O(n)            | O(h)             |
| 3     | DFS (Iterative)                  | O(n)            | O(h)             |

---

## 🔗 Similar Problems

1. [102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)
2. [199. Binary Tree Right Side View (Alternative Approaches)](https://leetcode.com/problems/binary-tree-right-side-view/)
3. [513. Find Bottom Left Tree Value](https://leetcode.com/problems/find-bottom-left-tree-value/)

---

## 📌 Takeaway Points

- The brute force approach uses a queue for level-order traversal, keeping track of the rightmost node at each level.
- The DFS approach uses depth tracking, making it more elegant and space-efficient compared to the BFS approach.
- The iterative DFS approach is an alternative to the recursive DFS method, using a stack to explicitly handle depth traversal.

---

3. Longest Palindromic Substring

---

# 🌟 Problem: Longest Palindromic Substring

## 📘 Problem Statement

> Given a string `s`, return the longest palindromic substring in `s`.
>
> A string is a palindrome if it reads the same forward and backward.

**LeetCode Link:** [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

---

```
Example 1:
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Example 2:
Input: s = "cbbd"
Output: "bb"
```

## ✅ Constraints

- `1 <= s.length <= 1000`
- `s` consist of only digits and English letters (lowercase and uppercase).

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check All Substrings)

**Approach:**  
Generate all substrings of the input string and check if they are palindromes, then track the longest palindrome.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(1)
def longestPalindrome(s: str) -> str:
    def is_palindrome(sub: str) -> bool:
        return sub == sub[::-1]

    longest = ""
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            substring = s[i:j]
            if is_palindrome(substring) and len(substring) > len(longest):
                longest = substring

    return longest
```

---

### ⚙️ Level 2: Expand Around Center (Optimized)

**Approach:**  
For each character (and each pair of consecutive characters), expand outward and check for the longest palindrome centered at that position.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def longestPalindrome(s: str) -> str:
    def expand_around_center(left: int, right: int) -> str:
        while left >= 0 and right < len(s) and s[left] == s[right]:
            left -= 1
            right += 1
        return s[left+1:right]

    result = ""
    for i in range(len(s)):
        # Check odd-length palindromes
        odd_palindrome = expand_around_center(i, i)
        # Check even-length palindromes
        even_palindrome = expand_around_center(i, i + 1)
        
        # Update the result with the longest palindrome found
        if len(odd_palindrome) > len(result):
            result = odd_palindrome
        if len(even_palindrome) > len(result):
            result = even_palindrome

    return result
```

---

### 🚀 Level 3: Dynamic Programming (More Efficient)

**Approach:**  
Use dynamic programming (DP) to track palindromes. Use a table `dp` where `dp[i][j]` is `True` if the substring `s[i:j+1]` is a palindrome.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n^2)
def longestPalindrome(s: str) -> str:
    n = len(s)
    dp = [[False] * n for _ in range(n)]
    result = ""

    for length in range(1, n + 1):  # check substrings of increasing lengths
        for i in range(n - length + 1):
            j = i + length - 1
            if length == 1:  # single character is always a palindrome
                dp[i][j] = True
            elif length == 2:  # two characters are palindrome if they are equal
                dp[i][j] = (s[i] == s[j])
            else:  # for longer substrings, check the first and last characters and the inner substring
                dp[i][j] = (s[i] == s[j]) and dp[i + 1][j - 1]
            
            if dp[i][j] and length > len(result):
                result = s[i:j + 1]

    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force                          | O(n^3)          | O(1)             |
| 2     | Expand Around Center                | O(n^2)          | O(1)             |
| 3     | Dynamic Programming                  | O(n^2)          | O(n^2)           |

---

## 🔗 Similar Problems

1. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)
2. [647. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)
3. [10. Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/)

---

## 📌 Takeaway Points

- The brute force approach generates all substrings and checks each one, but it is inefficient for large strings.
- The expand-around-center approach is more efficient (O(n^2) time complexity) and avoids the overhead of checking all substrings.
- Dynamic programming provides a more structured solution but uses extra space for the DP table.

---

4. Rotate Image


---

# 🌟 Problem: Rotate Image

## 📘 Problem Statement

> You are given an `n x n` 2D matrix representing an image. Rotate the image by 90 degrees (clockwise).
>
> You have to rotate the image in-place, meaning you need to modify the input 2D matrix directly. Do not use any additional space.

**LeetCode Link:** [48. Rotate Image](https://leetcode.com/problems/rotate-image/)

---

### Example 1:
```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [[7,4,1],[8,5,2],[9,6,3]]
```

### Example 2:
```
Input: matrix = [[5,1,9,11],[2,4,8,10],[3,6,7,12],[13,14,15,16]]
Output: [[13,2,3,5],[14,4,6,1],[15,8,7,9],[16,10,12,11]]
```

---

## ✅ Constraints

- `n == matrix.length == matrix[i].length`
- `1 <= n <= 20`
- `-1000 <= matrix[i][j] <= 1000`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Transpose and Reverse Rows)

**Approach:**  
1. First, transpose the matrix (swap rows with columns).
2. Then reverse each row.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def rotate(matrix: list[list[int]]) -> None:
    # Transpose the matrix
    for i in range(len(matrix)):
        for j in range(i + 1, len(matrix)):
            matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    
    # Reverse each row
    for row in matrix:
        row.reverse()
```

---

### ⚙️ Level 2: Optimized (In-place Rotation with Layers)

**Approach:**  
Instead of performing a transpose and row reversal, we can rotate the elements layer by layer in-place. For each layer, we rotate the four elements of that layer.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def rotate(matrix: list[list[int]]) -> None:
    n = len(matrix)
    
    # Rotate each layer (starting from the outermost layer)
    for layer in range(n // 2):
        first = layer
        last = n - layer - 1
        for i in range(first, last):
            offset = i - first
            top = matrix[first][i]  # save top
            
            # left -> top
            matrix[first][i] = matrix[last - offset][first]
            
            # bottom -> left
            matrix[last - offset][first] = matrix[last][last - offset]
            
            # right -> bottom
            matrix[last][last - offset] = matrix[i][last]
            
            # top -> right
            matrix[i][last] = top
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                   | Time Complexity | Space Complexity |
|-------|--------------------------------------------|-----------------|------------------|
| 1     | Transpose and Reverse Rows                | O(n^2)          | O(1)             |
| 2     | In-place Layer-wise Rotation               | O(n^2)          | O(1)             |

---

## 🔗 Similar Problems

1. [73. Set Matrix Zeroes](https://leetcode.com/problems/set-matrix-zeroes/)
2. [79. Word Search](https://leetcode.com/problems/word-search/)
3. [48. Rotate Image](https://leetcode.com/problems/rotate-image/)

---

## 📌 Takeaway Points

- **Transpose and reverse:** A simple yet effective solution that uses the properties of matrix rotation. It is easy to implement and optimal in terms of time and space complexity.
- **Layer-wise in-place rotation:** This solution optimizes further by performing the rotation directly, layer by layer. This is a more visual and structured way to handle matrix rotations without needing extra space.

---

5. Subsets

---

# 🌟 Problem: Subsets

## 📘 Problem Statement

> Given an integer array `nums` of unique elements, return all possible subsets (the power set).
>
> The solution set must not contain duplicate subsets. Return the solution in **any order**.

**LeetCode Link:** [78. Subsets](https://leetcode.com/problems/subsets/)

---

### Example 1:
```
Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
```

### Example 2:
```
Input: nums = [0]
Output: [[],[0]]
```

---

## ✅ Constraints

- `1 <= nums.length <= 10`
- `-10 <= nums[i] <= 10`
- All elements of `nums` are unique.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Generate All Subsets Using Iteration)

**Approach:**  
Generate subsets using iteration. Start with the empty set and for each number in `nums`, add it to all existing subsets.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(2^n)
def subsets(nums: list[int]) -> list[list[int]]:
    result = [[]]
    for num in nums:
        result += [curr + [num] for curr in result]
    return result
```

---

### ⚙️ Level 2: Backtracking

**Approach:**  
Use backtracking to explore all possible subsets by including or excluding each element. This ensures we generate all possible subsets without duplicates.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def subsets(nums: list[int]) -> list[list[int]]:
    def backtrack(start, path):
        result.append(path)
        for i in range(start, len(nums)):
            backtrack(i + 1, path + [nums[i]])
    
    result = []
    backtrack(0, [])
    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                    | Time Complexity | Space Complexity |
|-------|-----------------------------|-----------------|------------------|
| 1     | Iterative method             | O(2^n)          | O(2^n)           |
| 2     | Backtracking method          | O(2^n)          | O(n)             |

---

## 🔗 Similar Problems

1. [90. Subsets II](https://leetcode.com/problems/subsets-ii/)
2. [46. Permutations](https://leetcode.com/problems/permutations/)
3. [77. Combinations](https://leetcode.com/problems/combinations/)

---

## 📌 Takeaway Points

- **Iterative approach:** A simple and direct way to generate subsets, leveraging the fact that each new element can be added to all existing subsets.
- **Backtracking approach:** Offers a more structured way to generate subsets, where each subset is built incrementally, exploring all possibilities by deciding to either include or exclude each element.

---

6. Serialize and Deserialize Binary Tree


---

# 🌟 Problem: Serialize and Deserialize Binary Tree

## 📘 Problem Statement

> Design an algorithm to serialize and deserialize a binary tree. Serialization is the process of converting a binary tree into a string representation, and deserialization is the process of reconstructing the binary tree from the string representation.

**LeetCode Link:** [297. Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)

---

### Example 1:
```
Input:
    root = [1,2,3,null,null,4,5]
Output:
    Codec.deserialize(Codec.serialize(root)) == root
```

### Example 2:
```
Input:
    root = []
Output:
    Codec.deserialize(Codec.serialize(root)) == root
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 10^4]`.
- `-1000 <= Node.val <= 1000`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Simple Recursive DFS for Serialization)

**Approach:**  
For serialization, perform a DFS traversal of the tree, and record the node values as a string. For deserialization, reverse the process by reconstructing the tree from the string.

```python
# Time Complexity: O(n) where n is the number of nodes in the tree
# Space Complexity: O(n) for the recursive call stack and storing serialized data
class Codec:
    def serialize(self, root: TreeNode) -> str:
        def dfs(node):
            if not node:
                return 'null'
            return str(node.val) + ',' + dfs(node.left) + ',' + dfs(node.right)

        return dfs(root)
    
    def deserialize(self, data: str) -> TreeNode:
        def dfs(data_list):
            val = data_list.pop(0)
            if val == 'null':
                return None
            node = TreeNode(int(val))
            node.left = dfs(data_list)
            node.right = dfs(data_list)
            return node
        
        data_list = data.split(',')
        return dfs(data_list)
```

---

### ⚙️ Level 2: Optimized (Using BFS)

**Approach:**  
Serialize the tree level by level using BFS, which ensures that null nodes are captured properly. Deserialization involves reading the serialized data and building the tree level by level.

```python
# Time Complexity: O(n) where n is the number of nodes in the tree
# Space Complexity: O(n) for the serialized string and the queue used in BFS
from collections import deque

class Codec:
    def serialize(self, root: TreeNode) -> str:
        if not root:
            return 'null'
        queue = deque([root])
        result = []
        while queue:
            node = queue.popleft()
            if node:
                result.append(str(node.val))
                queue.append(node.left)
                queue.append(node.right)
            else:
                result.append('null')
        return ','.join(result)

    def deserialize(self, data: str) -> TreeNode:
        if data == 'null':
            return None
        data_list = data.split(',')
        root = TreeNode(int(data_list[0]))
        queue = deque([root])
        index = 1
        while queue:
            node = queue.popleft()
            if data_list[index] != 'null':
                node.left = TreeNode(int(data_list[index]))
                queue.append(node.left)
            index += 1
            if data_list[index] != 'null':
                node.right = TreeNode(int(data_list[index]))
                queue.append(node.right)
            index += 1
        return root
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                    | Time Complexity | Space Complexity |
|-------|-----------------------------|-----------------|------------------|
| 1     | DFS Recursive method         | O(n)            | O(n)             |
| 2     | BFS Iterative method         | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [297. Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)
2. [449. Serialize and Deserialize BST](https://leetcode.com/problems/serialize-and-deserialize-bst/)
3. [114. Flatten Binary Tree to Linked List](https://leetcode.com/problems/flatten-binary-tree-to-linked-list/)

---

## 📌 Takeaway Points

- **Serialization:** Can be done using either DFS or BFS. DFS is simple but requires recursion, while BFS explicitly handles level-wise traversal, which may be easier for some edge cases.
- **Deserialization:** In both methods, deserialization is about rebuilding the tree from the serialized string, and careful handling of `null` values is crucial for accuracy.

---

7. Lowest Common Ancestor of a BST


---

# 🌟 Problem: Lowest Common Ancestor of a BST

## 📘 Problem Statement

> Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the tree. According to the definition of LCA in a binary search tree, the lowest common ancestor is the node with the largest value that is less than or equal to both nodes.

**LeetCode Link:** [235. Lowest Common Ancestor of a Binary Search Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)

---

### Example 1:
```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
```

### Example 2:
```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
Output: 2
Explanation: The LCA of nodes 2 and 4 is 2.
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[2, 10^5]`.
- `-10^9 <= Node.val <= 10^9`
- All Node.val values are unique.
- `p != q`
- `p` and `q` will exist in the BST.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive Search with LCA Property)

**Approach:**  
In a BST, the LCA of two nodes `p` and `q` lies in the range defined by the values of `p` and `q`. We can take advantage of this by recursively traversing the tree.

- If both `p` and `q` are greater than the current node's value, we continue searching in the right subtree.
- If both `p` and `q` are smaller, we continue searching in the left subtree.
- If one of `p` or `q` is smaller and the other is larger, the current node is their LCA.

```python
# Time Complexity: O(h) where h is the height of the tree (O(log n) in balanced BST)
# Space Complexity: O(1) for the space used by the recursive calls
class Solution:
    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        if not root:
            return None
        if p.val < root.val and q.val < root.val:
            return self.lowestCommonAncestor(root.left, p, q)
        elif p.val > root.val and q.val > root.val:
            return self.lowestCommonAncestor(root.right, p, q)
        else:
            return root
```

---

### ⚙️ Level 2: Optimized (Iterative Approach)

**Approach:**  
An iterative solution can also be used to traverse the tree. We continue to move down the tree by checking whether both `p` and `q` are smaller or greater than the current node’s value. When we find the point where they diverge, we return that node as the LCA.

```python
# Time Complexity: O(h) where h is the height of the tree (O(log n) in balanced BST)
# Space Complexity: O(1) for the space used by the iterative approach
class Solution:
    def lowestCommonAncestor(self, root: TreeNode, p: TreeNode, q: TreeNode) -> TreeNode:
        while root:
            if p.val < root.val and q.val < root.val:
                root = root.left
            elif p.val > root.val and q.val > root.val:
                root = root.right
            else:
                return root
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                    | Time Complexity | Space Complexity |
|-------|-----------------------------|-----------------|------------------|
| 1     | Recursive Search (DFS)       | O(h)            | O(1)             |
| 2     | Iterative Search             | O(h)            | O(1)             |

---

## 🔗 Similar Problems

1. [236. Lowest Common Ancestor of a Binary Tree](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/)
2. [1644. Lowest Common Ancestor of a Binary Tree II](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree-ii/)
3. [106. Construct Binary Tree from Inorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)

---

## 📌 Takeaway Points

- **Binary Search Tree Property:** The key property of the BST is used to narrow down the search space for finding the LCA, which gives us a much faster search than a generic binary tree.
- **Recursive vs Iterative:** Both recursive and iterative approaches work well for this problem, but the iterative approach avoids the extra space required for recursion.

---

8. Unique Paths


---

# 🌟 Problem: Unique Paths

## 📘 Problem Statement

> A robot is located at the top-left corner of a `m x n` grid. The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid. How many possible unique paths are there?

**LeetCode Link:** [62. Unique Paths](https://leetcode.com/problems/unique-paths/)

---

### Example 1:
```
Input: m = 3, n = 7
Output: 28
Explanation: From the top-left corner, there are a total of 28 unique paths to the bottom-right corner.
```

### Example 2:
```
Input: m = 3, n = 2
Output: 3
Explanation: From the top-left corner, there are a total of 3 unique paths to the bottom-right corner.
```

---

## ✅ Constraints

- `1 <= m, n <= 100`
- The answer is guaranteed to be less than or equal to `2 * 10^9`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursion with Memoization)

**Approach:**  
This approach will use a recursive function to explore every possible path. It will start from the top-left corner and move towards the destination (bottom-right), choosing either to move down or right at each step.

We will use memoization to store the results of subproblems to avoid redundant calculations.

```python
# Time Complexity: O(m * n) for memoizing the results of subproblems
# Space Complexity: O(m * n) for storing the results in the memo table
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        memo = {}

        def dfs(i, j):
            if i == m - 1 or j == n - 1:
                return 1
            if (i, j) in memo:
                return memo[(i, j)]
            memo[(i, j)] = dfs(i + 1, j) + dfs(i, j + 1)
            return memo[(i, j)]

        return dfs(0, 0)
```

---

### ⚙️ Level 2: Optimized (Dynamic Programming)

**Approach:**  
This approach uses dynamic programming to calculate the number of unique paths to each grid cell, building the result from the base case (bottom-right corner). Each cell in the grid stores the number of unique paths to reach that cell.

- The robot can only move down or right, so for each cell `(i, j)`, the number of unique paths is the sum of the unique paths to `(i+1, j)` and `(i, j+1)`.

```python
# Time Complexity: O(m * n) because we are iterating through every cell in the grid
# Space Complexity: O(m * n) for storing the DP table
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        dp = [[1] * n for _ in range(m)]
        
        for i in range(1, m):
            for j in range(1, n):
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        
        return dp[m - 1][n - 1]
```

---

### ⚡ Level 3: Space Optimization (Dynamic Programming with Reduced Space)

**Approach:**  
We can reduce the space complexity by using a single array, as we only need the current row and the previous row at any time.

```python
# Time Complexity: O(m * n) because we are still iterating through every cell in the grid
# Space Complexity: O(n) for using only one row of the DP table
class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        dp = [1] * n
        
        for i in range(1, m):
            for j in range(1, n):
                dp[j] += dp[j - 1]
        
        return dp[n - 1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Recursion with Memoization        | O(m * n)        | O(m * n)         |
| 2     | Dynamic Programming (2D Table)    | O(m * n)        | O(m * n)         |
| 3     | Dynamic Programming (Optimized)   | O(m * n)        | O(n)             |

---

## 🔗 Similar Problems

1. [63. Unique Paths II](https://leetcode.com/problems/unique-paths-ii/)
2. [64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)
3. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

## 📌 Takeaway Points

- **Dynamic Programming:** This problem can be solved efficiently using dynamic programming, where you break down the problem into smaller subproblems and use previously computed values.
- **Space Optimization:** The space complexity can be reduced from O(m * n) to O(n) by only storing the current and previous row of the DP table.
- **Combinatorial Insight:** Alternatively, the problem can be viewed as a combinatorial problem, where you need to find how many ways you can move down `m-1` times and right `n-1` times in a total of `m + n - 2` moves. This can be solved using combinations, but dynamic programming is often simpler and more intuitive.

---

9. Best Time to Buy and Sell Stock

---

# 🌟 Problem: Best Time to Buy and Sell Stock

## 📘 Problem Statement

> You are given an array `prices` where `prices[i]` is the price of a given stock on the `i`th day.
> 
> You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
> 
> Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return `0`.

**LeetCode Link:** [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

### Example 1:
```
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6 - 1 = 5.
```

### Example 2:
```
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
```

---

## ✅ Constraints

- `1 <= prices.length <= 10^5`
- `0 <= prices[i] <= 10^4`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check All Pair Combinations)

**Approach:**  
In this approach, we loop over all possible pairs of days and check the difference in prices. If the difference is positive, we calculate the profit and keep track of the maximum profit.

```python
# Time Complexity: O(n^2), as we are checking all pairs
# Space Complexity: O(1), only a few variables for tracking maximum profit
class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        max_profit = 0
        for i in range(len(prices)):
            for j in range(i + 1, len(prices)):
                profit = prices[j] - prices[i]
                if profit > max_profit:
                    max_profit = profit
        return max_profit
```

---

### ⚙️ Level 2: Optimized (Single Pass with Minimum Price Tracking)

**Approach:**  
We can optimize the solution by keeping track of the minimum price seen so far. At each day, we calculate the potential profit by subtracting the current price from the minimum price. We then update the maximum profit accordingly.

```python
# Time Complexity: O(n), as we are iterating through the list once
# Space Complexity: O(1), only a few variables for tracking the minimum price and maximum profit
class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        min_price = float('inf')
        max_profit = 0
        
        for price in prices:
            min_price = min(min_price, price)
            max_profit = max(max_profit, price - min_price)
        
        return max_profit
```

---

### ⚡ Level 3: Single Pass with Constant Space

**Approach:**  
This approach is the same as the optimized one but with slightly more emphasis on clarity. We track the minimum price and maximum profit in a single pass, using only two variables. This is the most space-efficient way.

```python
# Time Complexity: O(n), as we only iterate through the list once
# Space Complexity: O(1), as we only use two variables for tracking min price and max profit
class Solution:
    def maxProfit(self, prices: list[int]) -> int:
        min_price, max_profit = float('inf'), 0
        for price in prices:
            min_price = min(min_price, price)  # Track the lowest price
            max_profit = max(max_profit, price - min_price)  # Max profit at each step
        return max_profit
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                    | Time Complexity | Space Complexity |
|-------|---------------------------------------------|-----------------|------------------|
| 1     | Brute Force (All Pair Combinations)         | O(n^2)          | O(1)             |
| 2     | Single Pass with Minimum Price Tracking    | O(n)            | O(1)             |
| 3     | Single Pass with Constant Space (Optimized)| O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [122. Best Time to Buy and Sell Stock II](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/)
2. [123. Best Time to Buy and Sell Stock III](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/)
3. [188. Best Time to Buy and Sell Stock IV](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iv/)

---

## 📌 Takeaway Points

- **Brute Force:** The brute force approach checks all pairs of days, which leads to a time complexity of O(n²). This is feasible for small input sizes but inefficient for larger arrays.
- **Optimized Approach:** By tracking the minimum price seen so far and calculating the maximum profit in a single pass, we achieve O(n) time complexity and O(1) space complexity.
- **Greedy Insight:** This problem can be approached using a greedy strategy. At each day, we make the best decision (selling at the highest price seen so far after buying at the lowest price).

---

10. Find Peak Element


---

# 🌟 Problem: Find Peak Element

## 📘 Problem Statement

> A peak element in an array is an element that is strictly greater than its neighbors.
> 
> Given an integer array `nums`, find a peak element, and return its index.
> 
> If the array contains multiple peaks, return the index of any of the peaks.
> 
> You may imagine that `nums[-1] = -∞` and `nums[n] = -∞` where `n` is the length of the array.
> 
> **LeetCode Link:** [162. Find Peak Element](https://leetcode.com/problems/find-peak-element/)

---

### Example 1:
```
Input: nums = [1,2,3,1]
Output: 2
Explanation: 3 is a peak element and your function should return the index number 2.
```

### Example 2:
```
Input: nums = [1,2,1,3,5,6,4]
Output: 5
Explanation: Your function can return either index 1 where the peak element is 2, or index 5 where the peak element is 6.
```

---

## ✅ Constraints

- `1 <= nums.length <= 1000`
- `-2³¹ <= nums[i] <= 2³¹ - 1`
- `nums[i] != nums[i + 1]` for all valid `i`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Linear Search)

**Approach:**  
The simplest approach is to check each element and see if it's greater than its neighbors. If it is, return that index.

```python
# Time Complexity: O(n), where n is the length of the array
# Space Complexity: O(1), as we're only using a constant amount of extra space
class Solution:
    def findPeakElement(self, nums: list[int]) -> int:
        for i in range(1, len(nums) - 1):
            if nums[i] > nums[i - 1] and nums[i] > nums[i + 1]:
                return i
        return 0 if nums[0] > nums[1] else len(nums) - 1
```

---

### ⚙️ Level 2: Binary Search (Optimized)

**Approach:**  
Since the array is not guaranteed to be sorted, we can use a binary search to find a peak element. At each step, compare the middle element with its neighbors. If the middle element is smaller than its right neighbor, a peak element lies on the right side, and vice versa.

```python
# Time Complexity: O(log n), as we're dividing the search space by half on each iteration
# Space Complexity: O(1), as we're only using a constant amount of extra space
class Solution:
    def findPeakElement(self, nums: list[int]) -> int:
        left, right = 0, len(nums) - 1
        while left < right:
            mid = left + (right - left) // 2
            if nums[mid] > nums[mid + 1]:
                right = mid
            else:
                left = mid + 1
        return left
```

---

### ⚡ Level 3: Optimized Binary Search (With More Insight)

**Approach:**  
This is the most efficient solution, leveraging binary search to quickly identify the peak. The idea is to always check the middle element and determine if the peak lies to the left or right.

```python
# Time Complexity: O(log n), as we're using binary search to reduce the search space
# Space Complexity: O(1), as we're only using a constant amount of extra space
class Solution:
    def findPeakElement(self, nums: list[int]) -> int:
        left, right = 0, len(nums) - 1
        while left < right:
            mid = (left + right) // 2
            if nums[mid] > nums[mid + 1]:
                right = mid  # Peak is to the left or at mid
            else:
                left = mid + 1  # Peak is to the right of mid
        return left
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force (Linear Search)       | O(n)            | O(1)             |
| 2     | Binary Search                     | O(log n)        | O(1)             |
| 3     | Optimized Binary Search           | O(log n)        | O(1)             |

---

## 🔗 Similar Problems

1. [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)
2. [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)
3. [154. Find Minimum in Rotated Sorted Array II](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/)

---

## 📌 Takeaway Points

- **Brute Force:** While the brute force approach works, it is inefficient with O(n) time complexity. It's easy to understand but not optimal for large inputs.
- **Binary Search:** The binary search solution significantly reduces the search space to O(log n), making it much faster for large input sizes.
- **Peak Element Insight:** The problem can be solved by exploiting the properties of a peak, i.e., an element larger than its neighbors. This allows for the use of binary search to efficiently find a peak.

---

11. N-Queens


---

# 🌟 Problem: N-Queens

## 📘 Problem Statement

> The N-Queens puzzle is the problem of placing `N` chess queens on an `N x N` chessboard so that no two queens threaten each other.  
> 
> A queen can attack another queen if they are in the same row, column, or diagonal.
> 
> Given an integer `n`, return all distinct solutions to the `n-queens` puzzle.  
> Each solution contains a distinct board configuration of the queens' placements, where `'Q'` and `'.'` both indicate a queen and an empty space, respectively.
> 
> **LeetCode Link:** [51. N-Queens](https://leetcode.com/problems/n-queens/)

---

### Example 1:
```
Input: n = 4
Output: [[".Q..","...Q","Q...","..Q."]]
Explanation: There are 2 distinct solutions to the 4-queens puzzle:
[
 [".Q..", "...Q", "Q...", "..Q."],
 ["..Q.", "Q...", "...Q", ".Q.."]
]
```

### Example 2:
```
Input: n = 1
Output: [["Q"]]
```

---

## ✅ Constraints

- `1 <= n <= 9`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking)

**Approach:**  
We can solve this problem using backtracking. We try to place queens row by row and column by column while ensuring that no two queens threaten each other. If a valid configuration is found, we add it to the result.

```python
# Time Complexity: O(N!), where N is the size of the board
# Space Complexity: O(N), due to the recursive call stack and the solution list
class Solution:
    def solveNQueens(self, n: int):
        def backtrack(row, diagonals1, diagonals2, columns, board):
            if row == n:
                result.append(["".join(row) for row in board])
                return
            for col in range(n):
                if col in columns or (row - col) in diagonals1 or (row + col) in diagonals2:
                    continue
                board[row][col] = 'Q'
                backtrack(row + 1, diagonals1 | {row - col}, diagonals2 | {row + col}, columns | {col}, board)
                board[row][col] = '.'  # Backtrack

        result = []
        backtrack(0, set(), set(), set(), [['.' for _ in range(n)] for _ in range(n)])
        return result
```

---

### ⚙️ Level 2: Optimized Backtracking (Using Sets for Columns and Diagonals)

**Approach:**  
The optimized backtracking solution makes use of sets to track which columns and diagonals are already attacked by another queen. This allows for constant-time checks during the backtracking process.

```python
# Time Complexity: O(N!), where N is the size of the board
# Space Complexity: O(N), due to the recursive call stack and solution list
class Solution:
    def solveNQueens(self, n: int):
        def backtrack(row, cols, diag1, diag2, board):
            if row == n:
                result.append(["".join(row) for row in board])
                return
            for col in range(n):
                if col in cols or (row - col) in diag1 or (row + col) in diag2:
                    continue
                board[row][col] = 'Q'
                backtrack(row + 1, cols | {col}, diag1 | {row - col}, diag2 | {row + col}, board)
                board[row][col] = '.'  # Backtrack

        result = []
        backtrack(0, set(), set(), set(), [['.' for _ in range(n)] for _ in range(n)])
        return result
```

---

### ⚡ Level 3: Advanced Backtracking with Pruning

**Approach:**  
In this solution, the key difference lies in how efficiently we prune the search tree using sets for columns and diagonals to reduce redundant computations.

```python
# Time Complexity: O(N!), where N is the size of the board
# Space Complexity: O(N), due to the recursive call stack and solution list
class Solution:
    def solveNQueens(self, n: int):
        def backtrack(row, cols, diag1, diag2, board):
            if row == n:
                result.append(["".join(row) for row in board])
                return
            for col in range(n):
                if col in cols or (row - col) in diag1 or (row + col) in diag2:
                    continue
                board[row][col] = 'Q'
                backtrack(row + 1, cols | {col}, diag1 | {row - col}, diag2 | {row + col}, board)
                board[row][col] = '.'  # Backtrack

        result = []
        backtrack(0, set(), set(), set(), [['.' for _ in range(n)] for _ in range(n)])
        return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)        | O(N!)           | O(N)             |
| 2     | Optimized Backtracking            | O(N!)           | O(N)             |
| 3     | Advanced Backtracking with Pruning| O(N!)           | O(N)             |

---

## 🔗 Similar Problems

1. [52. N-Queens II](https://leetcode.com/problems/n-queens-ii/)
2. [37. Sudoku Solver](https://leetcode.com/problems/sudoku-solver/)
3. [46. Permutations](https://leetcode.com/problems/permutations/)

---

## 📌 Takeaway Points

- **Backtracking:** This problem is typically solved using backtracking, as it requires exploring all possible board configurations and pruning invalid solutions as we go.
- **Optimizations:** Using sets for columns and diagonals allows us to make constant-time checks during backtracking, making the solution more efficient.
- **Recursive Solution:** The problem naturally lends itself to recursion since we can view it as a problem of recursively placing queens on the board row by row.

---

12. Combination Sum

---

# 🌟 Problem: Combination Sum

## 📘 Problem Statement

> Given an array of **candidates** and a target number **target**, return all unique combinations of **candidates** where the sum of the combination is equal to **target**.  
> 
> Each number in **candidates** may be used an **unlimited number of times** in the combination.
> 
> **LeetCode Link:** [39. Combination Sum](https://leetcode.com/problems/combination-sum/)

---

### Example 1:
```
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3], [7]]
Explanation: 
- 2 + 2 + 3 = 7
- 7 = 7
```

### Example 2:
```
Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2], [2,3,3], [3,5]]
```

---

## ✅ Constraints

- `1 <= candidates.length <= 30`
- `2 <= candidates[i] <= 40`
- `1 <= target <= 500`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking)

**Approach:**  
We use backtracking to explore all possible combinations by recursively adding numbers from the `candidates` list to the current combination. If the sum exceeds the target, we backtrack.

```python
# Time Complexity: O(2^N), where N is the size of candidates
# Space Complexity: O(N), due to the recursion stack
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        def backtrack(start, target, path):
            if target == 0:
                result.append(path)
                return
            if target < 0:
                return
            for i in range(start, len(candidates)):
                backtrack(i, target - candidates[i], path + [candidates[i]])

        result = []
        backtrack(0, target, [])
        return result
```

---

### ⚙️ Level 2: Optimized Backtracking (Pruning)

**Approach:**  
This solution improves the backtracking approach by skipping unnecessary numbers to avoid redundant calculations. If a number exceeds the target, we prune the search early.

```python
# Time Complexity: O(2^N), where N is the size of candidates
# Space Complexity: O(N), due to the recursion stack
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        def backtrack(start, target, path):
            if target == 0:
                result.append(path)
                return
            for i in range(start, len(candidates)):
                if candidates[i] > target:
                    continue  # Skip unnecessary numbers
                backtrack(i, target - candidates[i], path + [candidates[i]])

        result = []
        backtrack(0, target, [])
        return result
```

---

### ⚡ Level 3: Advanced Backtracking with Early Stopping

**Approach:**  
In this solution, we apply early stopping in the recursion to avoid exploring paths that cannot possibly form a valid solution. This solution also benefits from pruning by skipping over numbers that exceed the current target.

```python
# Time Complexity: O(2^N), where N is the size of candidates
# Space Complexity: O(N), due to the recursion stack
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        def backtrack(start, target, path):
            if target == 0:
                result.append(path)
                return
            for i in range(start, len(candidates)):
                if candidates[i] > target:
                    break  # Stop the search as all further numbers are greater
                backtrack(i, target - candidates[i], path + [candidates[i]])

        result = []
        candidates.sort()  # Sort to enable early stopping
        backtrack(0, target, [])
        return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)         | O(2^N)          | O(N)             |
| 2     | Optimized Backtracking (Pruning)   | O(2^N)          | O(N)             |
| 3     | Advanced Backtracking with Early Stopping | O(2^N)     | O(N)             |

---

## 🔗 Similar Problems

1. [40. Combination Sum II](https://leetcode.com/problems/combination-sum-ii/)
2. [46. Permutations](https://leetcode.com/problems/permutations/)
3. [77. Combinations](https://leetcode.com/problems/combinations/)

---

## 📌 Takeaway Points

- **Backtracking:** This problem is a classic example of using backtracking to explore all possible combinations.
- **Pruning:** Pruning unnecessary branches early (by skipping numbers that exceed the target) makes the solution more efficient.
- **Early Stopping:** Sorting the candidates and applying early stopping helps avoid unnecessary exploration of invalid paths, improving performance.

---

13. 3Sum

---

# 🌟 Problem: 3Sum

## 📘 Problem Statement

> Given an integer array `nums`, return all unique triplets `[nums[i], nums[j], nums[k]]` such that:
> 
> - `i != j`, `i != k`, and `j != k`
> - `nums[i] + nums[j] + nums[k] == 0`
> 
> Notice that the solution set must not contain duplicate triplets.

**LeetCode Link:** [15. 3Sum](https://leetcode.com/problems/3sum/)

---

### Example 1:
```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
```

### Example 2:
```
Input: nums = []
Output: []
```

---

## ✅ Constraints

- `0 <= nums.length <= 3000`
- `-10^5 <= nums[i] <= 10^5`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:**  
We check all possible triplets using three nested loops. This solution is simple but inefficient, having a time complexity of O(n^3).

```python
# Time Complexity: O(n^3)
# Space Complexity: O(1)
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        result = []
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                for k in range(j+1, len(nums)):
                    if nums[i] + nums[j] + nums[k] == 0:
                        triplet = sorted([nums[i], nums[j], nums[k]])
                        if triplet not in result:
                            result.append(triplet)
        return result
```

---

### ⚙️ Level 2: Two-pointer Optimized Approach

**Approach:**  
We first sort the array. Then, for each element, we use two pointers to find pairs that sum to the negative of the current element. This significantly reduces the time complexity to O(n^2).

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        result = []
        for i in range(len(nums) - 2):
            if i > 0 and nums[i] == nums[i - 1]:
                continue  # Skip duplicate values to avoid duplicate triplets
            left, right = i + 1, len(nums) - 1
            while left < right:
                total = nums[i] + nums[left] + nums[right]
                if total == 0:
                    result.append([nums[i], nums[left], nums[right]])
                    while left < right and nums[left] == nums[left + 1]:
                        left += 1  # Skip duplicates
                    while left < right and nums[right] == nums[right - 1]:
                        right -= 1  # Skip duplicates
                    left += 1
                    right -= 1
                elif total < 0:
                    left += 1
                else:
                    right -= 1
        return result
```

---

### ⚡ Level 3: Advanced Two-pointer (Optimized Handling of Duplicates)

**Approach:**  
We further optimize the approach by handling duplicates more efficiently. Sorting the array helps in ensuring that we skip duplicate triplets. The time complexity is O(n^2), and we handle the duplicates in O(1) time.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        result = []
        for i in range(len(nums) - 2):
            if i > 0 and nums[i] == nums[i - 1]:
                continue  # Skip duplicates for the first element
            left, right = i + 1, len(nums) - 1
            while left < right:
                total = nums[i] + nums[left] + nums[right]
                if total == 0:
                    result.append([nums[i], nums[left], nums[right]])
                    left += 1
                    right -= 1
                    # Skip duplicates for the second and third elements
                    while left < right and nums[left] == nums[left - 1]:
                        left += 1
                    while left < right and nums[right] == nums[right + 1]:
                        right -= 1
                elif total < 0:
                    left += 1
                else:
                    right -= 1
        return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (3 nested loops)       | O(n^3)          | O(1)             |
| 2     | Two-pointer Optimized Approach     | O(n^2)          | O(1)             |
| 3     | Advanced Two-pointer (Efficient Duplicates Handling) | O(n^2) | O(1) |

---

## 🔗 Similar Problems

1. [18. 4Sum](https://leetcode.com/problems/4sum/)
2. [16. 3Sum Closest](https://leetcode.com/problems/3sum-closest/)
3. [15. Three Sum Smaller](https://leetcode.com/problems/three-sum-smaller/)

---

## 📌 Takeaway Points

- **Sorting and Two-pointer technique:** Sorting the array simplifies the problem and enables the efficient two-pointer approach.
- **Duplicate handling:** Careful handling of duplicate values is key to ensuring unique triplets are found.
- **Time Complexity Optimization:** The two-pointer method reduces the complexity from O(n^3) to O(n^2), making the solution much faster for larger input sizes.

---

14. Validate Binary Search Tree

---

# 🌟 Problem: Validate Binary Search Tree

## 📘 Problem Statement

> Given the root of a binary tree, determine if it is a valid binary search tree (BST).
> 
> A **valid BST** is defined as follows:
> 
> - The left subtree of a node contains only nodes with keys **less than** the node’s key.
> - The right subtree of a node contains only nodes with keys **greater than** the node’s key.
> - Both the left and right subtrees must also be binary search trees.

**LeetCode Link:** [98. Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)

---

### Example 1:
```
Input: root = [2,1,3]
Output: true
```

### Example 2:
```
Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
```

### Example 3:
```
Input: root = [5,4,6,null,null,3,7]
Output: false
Explanation: The root node's value is 5 but its right child's value is 6, which is greater than 5.
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range [1, 10^4].
- `-2^31 <= Node.val <= 2^31 - 1`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: In-order Traversal (Brute Force)

**Approach:**  
We perform an in-order traversal of the tree. In a valid BST, the in-order traversal should return values in a strictly increasing order. We can use recursion or an explicit stack to traverse the tree and check if the sequence is strictly increasing.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) for recursion stack
class Solution:
    def isValidBST(self, root: TreeNode) -> bool:
        def inorder(node):
            if not node:
                return []
            return inorder(node.left) + [node.val] + inorder(node.right)
        
        inorder_vals = inorder(root)
        for i in range(1, len(inorder_vals)):
            if inorder_vals[i] <= inorder_vals[i-1]:
                return False
        return True
```

---

### ⚙️ Level 2: Recursion with Boundaries

**Approach:**  
This solution eliminates the need for an in-order traversal. We use a recursive approach where we check whether the current node's value is within a valid range. We pass updated bounds as we recurse down the tree.

```python
# Time Complexity: O(n)
# Space Complexity: O(h) where h is the height of the tree (for recursion stack)
class Solution:
    def isValidBST(self, root: TreeNode) -> bool:
        def helper(node, low, high):
            if not node:
                return True
            if not (low < node.val < high):
                return False
            return helper(node.left, low, node.val) and helper(node.right, node.val, high)
        
        return helper(root, float('-inf'), float('inf'))
```

---

### ⚡ Level 3: Iterative Approach with Stack

**Approach:**  
This solution uses an iterative in-order traversal with a stack. It also checks whether the values encountered during traversal are in strictly increasing order.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) for stack
class Solution:
    def isValidBST(self, root: TreeNode) -> bool:
        stack = []
        inorder_val = float('-inf')
        
        while stack or root:
            while root:
                stack.append(root)
                root = root.left
            root = stack.pop()
            if root.val <= inorder_val:
                return False
            inorder_val = root.val
            root = root.right
        
        return True
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | In-order Traversal (Brute Force)   | O(n)            | O(n)             |
| 2     | Recursion with Boundaries          | O(n)            | O(h)             |
| 3     | Iterative Approach with Stack      | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [98. Validate Binary Search Tree](https://leetcode.com/problems/validate-binary-search-tree/)
2. [230. Kth Smallest Element in a BST](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)
3. [108. Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)

---

## 📌 Takeaway Points

- **In-order Traversal:** Provides a simple and clear way to check the validity of a BST by ensuring values are strictly increasing.
- **Recursive with Boundaries:** A more efficient solution that avoids the full traversal of the tree. It directly checks if the current node value is within valid bounds.
- **Iterative Approach:** Useful when recursion depth may be a concern, but it is similar to the recursive approach in terms of time and space complexity.

---

15. Implement strStr()

---

# 🌟 Problem: Implement strStr()

## 📘 Problem Statement

> Implement the `strStr()` function.
> 
> Given two strings `haystack` and `needle`, return the index of the first occurrence of `needle` in `haystack`, or `-1` if `needle` is not part of `haystack`.
> 
> **Note:** When `needle` is an empty string, we should return `0`.

**LeetCode Link:** [28. Implement strStr()](https://leetcode.com/problems/implement-strstr/)

---

### Example 1:
```
Input: haystack = "hello", needle = "ll"
Output: 2
```

### Example 2:
```
Input: haystack = "aaaaa", needle = "bba"
Output: -1
```

### Example 3:
```
Input: haystack = "", needle = ""
Output: 0
```

---

## ✅ Constraints

- `1 <= haystack.length, needle.length <= 10^4`
- `haystack` and `needle consist of only lowercase English characters.`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:**  
This solution simply checks all substrings of length equal to `needle` and compares them to `needle`. It has a time complexity of O(n * m) where n is the length of `haystack` and m is the length of `needle`.

```python
# Time Complexity: O(n * m)
# Space Complexity: O(1)
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if not needle:
            return 0
        for i in range(len(haystack) - len(needle) + 1):
            if haystack[i:i+len(needle)] == needle:
                return i
        return -1
```

---

### ⚙️ Level 2: KMP (Knuth-Morris-Pratt) Algorithm

**Approach:**  
The KMP algorithm reduces the time complexity to O(n + m) by preprocessing the `needle` and using this information to avoid redundant comparisons. It uses a failure function to skip unnecessary re-evaluations.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(m)
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if not needle:
            return 0
        
        # Build the LPS (Longest Prefix Suffix) array for the needle
        lps = [0] * len(needle)
        j = 0  # Length of the previous longest prefix suffix
        
        # Preprocess the pattern (needle)
        for i in range(1, len(needle)):
            while j > 0 and needle[i] != needle[j]:
                j = lps[j - 1]
            if needle[i] == needle[j]:
                j += 1
                lps[i] = j
        
        # Match the haystack with the needle using the LPS array
        j = 0  # Pointer for needle
        for i in range(len(haystack)):
            while j > 0 and haystack[i] != needle[j]:
                j = lps[j - 1]
            if haystack[i] == needle[j]:
                j += 1
            if j == len(needle):
                return i - j + 1
        return -1
```

---

### ⚡ Level 3: Python Built-in Functions (Efficient)

**Approach:**  
Leverage Python's built-in `find()` method for an optimal and easy-to-understand solution.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        return haystack.find(needle)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (Substring Matching)   | O(n * m)        | O(1)             |
| 2     | KMP Algorithm                      | O(n + m)        | O(m)             |
| 3     | Python Built-in `find()`           | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [28. Implement strStr()](https://leetcode.com/problems/implement-strstr/)
2. [541. Reverse String II](https://leetcode.com/problems/reverse-string-ii/)
3. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

---

## 📌 Takeaway Points

- **Brute Force Approach:** Simple to implement but inefficient for large strings. It can be optimized with more sophisticated algorithms like KMP.
- **KMP Algorithm:** Reduces time complexity by preprocessing the needle and skipping unnecessary comparisons.
- **Built-in Functions:** The `find()` method in Python provides an optimized and easy-to-use solution in most cases.

---

16. Invert Binary Tree

---

# 🌟 Problem: Invert Binary Tree

## 📘 Problem Statement

> Given the root of a binary tree, invert the tree, and return its root.

**LeetCode Link:** [226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)

---

### Example 1:
```
Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```

### Example 2:
```
Input: root = [2,1,3]
Output: [2,3,1]
```

### Example 3:
```
Input: root = []
Output: []
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range [0, 100].
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Recursive Solution

**Approach:**  
The most intuitive approach to invert a binary tree is to perform a depth-first search (DFS) and recursively swap the left and right children of each node. We swap the children at each node until we reach the leaves of the tree.

```python
# Time Complexity: O(n)
# Space Complexity: O(h) where h is the height of the tree (for recursion stack)
class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        if root:
            # Swap the left and right children
            root.left, root.right = root.right, root.left
            # Recursively invert the subtrees
            self.invertTree(root.left)
            self.invertTree(root.right)
        return root
```

---

### ⚙️ Level 2: Iterative Solution with Queue

**Approach:**  
This iterative solution uses a queue to perform a breadth-first search (BFS). We process nodes level by level, swapping the left and right children of each node as we go. This avoids the recursion overhead.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) for the queue
from collections import deque

class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        if not root:
            return None
        
        queue = deque([root])
        
        while queue:
            node = queue.popleft()
            node.left, node.right = node.right, node.left  # Swap children
            
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        
        return root
```

---

### ⚡ Level 3: Using a Stack (DFS Iterative)

**Approach:**  
This approach is similar to the BFS version, but instead of using a queue, we use a stack. It simulates the recursion stack to perform depth-first traversal and invert the tree.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) for the stack
class Solution:
    def invertTree(self, root: TreeNode) -> TreeNode:
        if not root:
            return None
        
        stack = [root]
        
        while stack:
            node = stack.pop()
            node.left, node.right = node.right, node.left  # Swap children
            
            if node.left:
                stack.append(node.left)
            if node.right:
                stack.append(node.right)
        
        return root
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Recursive DFS                      | O(n)            | O(h)             |
| 2     | Iterative BFS with Queue           | O(n)            | O(n)             |
| 3     | Iterative DFS with Stack           | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
2. [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)
3. [110. Balanced Binary Tree](https://leetcode.com/problems/balanced-binary-tree/)

---

## 📌 Takeaway Points

- **Recursive Solution:** Simple and elegant, but could lead to stack overflow in the case of deep trees.
- **Iterative Solutions (BFS/DFS):** Avoid recursion stack limits and offer similar time and space complexities.
- **Symmetry:** This problem highlights the symmetry of the binary tree structure and demonstrates how to traverse it using DFS/BFS to modify the structure.

---

17. Reverse Words in a String

Here’s the solution for **Reverse Words in a String** in Python, following the structure you prefer:

---

# 🌟 Problem: Reverse Words in a String

## 📘 Problem Statement

> Given an input string, reverse the string word by word.  
> **Note:** A word is defined as a sequence of non-space characters. The input string does not contain leading or trailing spaces, and the words are separated by exactly one space.

**LeetCode Link:** [151. Reverse Words in a String](https://leetcode.com/problems/reverse-words-in-a-string/)

---

### Example 1:
```
Input: s = "the sky is blue"
Output: "blue is sky the"
```

### Example 2:
```
Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
```

### Example 3:
```
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reverse the word order, but the extra spaces between words should be removed.
```

---

## ✅ Constraints

- 1 <= s.length <= 10^4
- s consists of English letters (upper-case and lower-case), digits, and spaces `' '`.
- There is at least one word in s.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Approach Using Python's Built-in Functions

**Approach:**  
We can split the string into words using Python's `split()` method, which automatically handles multiple spaces and trims leading/trailing spaces. After splitting, we simply reverse the list of words and join them back together using `join()`.

```python
# Time Complexity: O(n), where n is the length of the string
# Space Complexity: O(n), for the space needed to store words
class Solution:
    def reverseWords(self, s: str) -> str:
        words = s.split()  # Split the string by whitespace
        return ' '.join(reversed(words))  # Reverse the list and join them back
```

---

### ⚙️ Level 2: Manual String Processing (No Built-in Functions)

**Approach:**  
We manually iterate through the string to handle splitting by spaces, then reverse the words using a custom approach.

```python
# Time Complexity: O(n), where n is the length of the string
# Space Complexity: O(n), for storing the result
class Solution:
    def reverseWords(self, s: str) -> str:
        word = ''
        result = []
        
        # Process characters one by one and accumulate words
        for char in s:
            if char != ' ':
                word += char  # Accumulate the current word
            else:
                if word:  # Avoid adding empty words
                    result.append(word)
                    word = ''  # Reset for next word
        
        if word:  # Add the last word if there is one
            result.append(word)
        
        # Join the words in reverse order
        return ' '.join(result[::-1])
```

---

### ⚡ Level 3: In-place Solution (For Practice)

**Approach:**  
An in-place approach can be used by reversing the entire string first and then reversing each word in the string.

```python
# Time Complexity: O(n), where n is the length of the string
# Space Complexity: O(1), in-place reversal
class Solution:
    def reverseWords(self, s: str) -> str:
        s = list(s)  # Convert string to a list for in-place modifications
        self.reverse(s, 0, len(s) - 1)  # Reverse the entire string
        
        start = 0
        for i in range(len(s) + 1):
            if i == len(s) or s[i] == ' ':
                self.reverse(s, start, i - 1)  # Reverse each word
                start = i + 1
        
        return ''.join(s).strip()  # Convert list back to string and strip extra spaces
    
    # Helper function to reverse part of the list in-place
    def reverse(self, s, start, end):
        while start < end:
            s[start], s[end] = s[end], s[start]
            start += 1
            end -= 1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Using Python's `split()` & `reversed()` | O(n)            | O(n)             |
| 2     | Manual String Processing           | O(n)            | O(n)             |
| 3     | In-place Reversal                  | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [344. Reverse String](https://leetcode.com/problems/reverse-string/)
2. [557. Reverse Words in a String III](https://leetcode.com/problems/reverse-words-in-a-string-iii/)
3. [28. Implement strStr()](https://leetcode.com/problems/implement-strstr/)

---

## 📌 Takeaway Points

- **String Splitting:** Python's `split()` method is powerful and handles multiple spaces automatically, making it very useful for this problem.
- **In-place Solutions:** The in-place approach is more memory efficient, but requires more complex logic to handle the reversal of the string and words.
- **Practical Use:** This problem is a good exercise for practicing string manipulation and understanding common operations like reversing, splitting, and joining strings.

---

18. Construct Binary Tree from Preorder and Inorder


---

# 🌟 Problem: Construct Binary Tree from Preorder and Inorder Traversal

## 📘 Problem Statement

> Given two integer arrays `preorder` and `inorder` where:
> - `preorder` is the preorder traversal of a binary tree.
> - `inorder` is the inorder traversal of the same tree.
>
> Construct and return the binary tree.

**LeetCode Link:** [105. Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

---

### Example 1:
```
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]
```

### Example 2:
```
Input: preorder = [-1], inorder = [-1]
Output: [-1]
```

---

## ✅ Constraints

- 1 <= preorder.length <= 3000
- inorder.length == preorder.length
- -3000 <= preorder[i], inorder[i] <= 3000
- preorder and inorder consist of unique values.
- Each value of inorder is distinct.
- The given inorder is guaranteed to be a valid inorder traversal of a binary tree.
- The given preorder is guaranteed to be a valid preorder traversal of a binary tree.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Recursive Solution

**Approach:**  
We can recursively construct the binary tree by taking the first element from the `preorder` array (which will always be the root of the tree/subtree), and finding that element's position in the `inorder` array (which helps split the tree into left and right subtrees).

```python
# Time Complexity: O(n), where n is the number of nodes
# Space Complexity: O(n), due to the recursion stack
class Solution:
    def buildTree(self, preorder: list[int], inorder: list[int]) -> TreeNode:
        # Hash map to store the index of each element in inorder for faster lookup
        inorder_index_map = {value: idx for idx, value in enumerate(inorder)}
        
        def helper(pre_left, pre_right, in_left, in_right):
            if pre_left > pre_right:
                return None
            
            # The root is the first element in preorder
            root_val = preorder[pre_left]
            root = TreeNode(root_val)
            
            # Find the root index in inorder
            root_index_in_inorder = inorder_index_map[root_val]
            
            # Elements left of root in inorder are in the left subtree
            left_subtree_size = root_index_in_inorder - in_left
            
            # Recursively build the left and right subtrees
            root.left = helper(pre_left + 1, pre_left + left_subtree_size, in_left, root_index_in_inorder - 1)
            root.right = helper(pre_left + left_subtree_size + 1, pre_right, root_index_in_inorder + 1, in_right)
            
            return root
        
        return helper(0, len(preorder) - 1, 0, len(inorder) - 1)
```

---

### ⚙️ Level 2: Optimized Approach with Memoization

**Approach:**  
The above solution can be further optimized by avoiding multiple recursive calls to `inorder_index_map` by storing the index of each element of `inorder` in a hash map (as we did above). This reduces the time spent searching for elements in the `inorder` array.

```python
# Time Complexity: O(n), where n is the number of nodes
# Space Complexity: O(n), due to the recursion stack and hashmap
class Solution:
    def buildTree(self, preorder: list[int], inorder: list[int]) -> TreeNode:
        # Hash map to store index of inorder elements
        inorder_index_map = {value: idx for idx, value in enumerate(inorder)}
        
        self.pre_index = 0  # A pointer to track the current index in preorder
        
        def helper(in_left, in_right):
            if in_left > in_right:
                return None
            
            root_val = preorder[self.pre_index]
            self.pre_index += 1
            root = TreeNode(root_val)
            
            # Split inorder into left and right subtrees
            root.left = helper(in_left, inorder_index_map[root_val] - 1)
            root.right = helper(inorder_index_map[root_val] + 1, in_right)
            
            return root
        
        return helper(0, len(inorder) - 1)
```

---

### ⚡ Level 3: In-place Solution (Manual Construction)

**Approach:**  
This solution uses a manual recursive approach but avoids any extra storage for hashmap. It constructs the tree by relying directly on the `preorder` and `inorder` traversal arrays.

```python
# Time Complexity: O(n), where n is the number of nodes
# Space Complexity: O(n), due to recursion stack
class Solution:
    def buildTree(self, preorder: list[int], inorder: list[int]) -> TreeNode:
        def buildTreeHelper(pre_start, pre_end, in_start, in_end):
            if pre_start > pre_end:
                return None
            
            root_value = preorder[pre_start]
            root = TreeNode(root_value)
            root_inorder_index = inorder.index(root_value)
            
            left_tree_size = root_inorder_index - in_start
            
            root.left = buildTreeHelper(pre_start + 1, pre_start + left_tree_size, in_start, root_inorder_index - 1)
            root.right = buildTreeHelper(pre_start + left_tree_size + 1, pre_end, root_inorder_index + 1, in_end)
            
            return root
        
        return buildTreeHelper(0, len(preorder) - 1, 0, len(inorder) - 1)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Using Recursive Approach with HashMap | O(n)            | O(n)             |
| 2     | Optimized Recursive Approach with Memoization | O(n)            | O(n)             |
| 3     | In-place Construction             | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [106. Construct Binary Tree from Inorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)
2. [105. Construct Binary Tree from Preorder and Inorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)
3. [108. Convert Sorted Array to Binary Search Tree](https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/)

---

## 📌 Takeaway Points

- **Efficient Lookups:** Using a hashmap to store the indices of the inorder traversal helps avoid redundant lookups and ensures O(n) time complexity.
- **Recursive Approach:** The problem lends itself well to a recursive approach, where each recursive call builds the tree in a depth-first manner, focusing on left and right subtrees separately.
- **Space Complexity:** In all approaches, we use recursion, which makes the space complexity O(n) due to the recursion stack.

---

19. Longest Increasing Subsequence

---

# 🌟 Problem: Longest Increasing Subsequence

## 📘 Problem Statement

> Given an integer array `nums`, return the length of the longest strictly increasing subsequence.

**LeetCode Link:** [300. Longest Increasing Subsequence](https://leetcode.com/problems/longest-increasing-subsequence/)

---

### Example 1:
```
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
```

### Example 2:
```
Input: nums = [0,1,0,3,2,3]
Output: 4
```

---

## ✅ Constraints

- 1 <= nums.length <= 2500
- -10^4 <= nums[i] <= 10^4

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Dynamic Programming (Brute Force)

**Approach:**  
We use a dynamic programming array `dp` where `dp[i]` represents the length of the longest increasing subsequence ending at index `i`. For each element in the array, we check all previous elements to see if a valid subsequence can be formed.

```python
# Time Complexity: O(n^2), where n is the number of elements in nums
# Space Complexity: O(n), due to the dp array
class Solution:
    def lengthOfLIS(self, nums: list[int]) -> int:
        if not nums:
            return 0
        
        n = len(nums)
        dp = [1] * n  # Each element is an increasing subsequence of length 1 by itself
        
        for i in range(1, n):
            for j in range(i):
                if nums[i] > nums[j]:
                    dp[i] = max(dp[i], dp[j] + 1)
        
        return max(dp)  # The longest subsequence will be the maximum value in dp
```

---

### ⚙️ Level 2: Binary Search + Dynamic Programming

**Approach:**  
We can optimize the previous approach using binary search. Instead of maintaining the `dp` array where each element stores the length of the subsequence, we use a list to store the smallest possible last element of an increasing subsequence of each length. Using binary search, we find the correct position in the list where the current element can be placed to extend a subsequence.

```python
# Time Complexity: O(n log n), where n is the number of elements in nums
# Space Complexity: O(n), due to the dp array
import bisect

class Solution:
    def lengthOfLIS(self, nums: list[int]) -> int:
        subseq = []  # This will store the smallest tail element of subsequences
        
        for num in nums:
            # Find the index of the first element greater than or equal to num
            idx = bisect.bisect_left(subseq, num)
            
            # If num is larger than any element in subseq, append it
            if idx == len(subseq):
                subseq.append(num)
            else:
                subseq[idx] = num  # Replace the element to maintain the smallest possible value
        
        return len(subseq)  # The length of the subseq list will give us the longest increasing subsequence
```

---

### ⚡ Level 3: Space Optimized DP Solution

**Approach:**  
In this approach, we use the same dynamic programming concept as the first approach, but optimize the space complexity. Instead of storing the entire `dp` array, we can store only the required values using binary search, which reduces the space complexity.

```python
# Time Complexity: O(n log n), where n is the number of elements in nums
# Space Complexity: O(n), for storing the subsequence list
import bisect

class Solution:
    def lengthOfLIS(self, nums: list[int]) -> int:
        subseq = []  # Store the subsequence tail values
        
        for num in nums:
            # Use binary search to find the insertion point for num
            pos = bisect.bisect_left(subseq, num)
            
            if pos == len(subseq):
                subseq.append(num)
            else:
                subseq[pos] = num
        
        return len(subseq)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Dynamic Programming (Brute Force) | O(n^2)          | O(n)             |
| 2     | Binary Search + Dynamic Programming | O(n log n)      | O(n)             |
| 3     | Space Optimized DP               | O(n log n)      | O(n)             |

---

## 🔗 Similar Problems

1. [354. Russian Doll Envelopes](https://leetcode.com/problems/russian-doll-envelopes/)
2. [673. Number of Longest Increasing Subsequence](https://leetcode.com/problems/number-of-longest-increasing-subsequence/)
3. [646. Maximum Length of Pair Chain](https://leetcode.com/problems/maximum-length-of-pair-chain/)

---

## 📌 Takeaway Points

- **Dynamic Programming Approach:** The brute force DP approach has O(n^2) time complexity. It’s simple and works for small input sizes.
- **Binary Search Optimization:** Using binary search to find the correct position for each element improves the time complexity to O(n log n). This makes it more efficient for large inputs.
- **Space Complexity Optimization:** The space complexity can be minimized by storing just the tail values of subsequences, which is useful when handling very large input sizes.

---

20. Wildcard Matching

---

# 🌟 Problem: Wildcard Matching

## 📘 Problem Statement

> Given an input string (`s`) and a pattern (`p`), implement wildcard pattern matching with support for `?` and `*` where:
>
> - `?` matches any single character.
> - `*` matches any sequence of characters (including the empty sequence).
>
> The matching should cover the entire input string (not partial).

**LeetCode Link:** [44. Wildcard Matching](https://leetcode.com/problems/wildcard-matching/)

---

### Example 1:
```
Input: s = "aa", p = "a*"
Output: true
Explanation: '*' matches any sequence of characters, so it matches "aa".
```

### Example 2:
```
Input: s = "mississippi", p = "mis*is*p*."
Output: false
```

---

## ✅ Constraints

- 0 <= s.length, p.length <= 2000
- s and p consist of only lowercase English letters and `*` and `?`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive)

**Approach:**  
We attempt to match the pattern with the string using recursion. The main challenge is handling the `*` and `?` characters properly.

```python
# Time Complexity: O(2^n), worst case where every '*' generates multiple recursive calls.
# Space Complexity: O(n), for the recursion stack
class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        # Base case
        if not p:
            return not s
        
        # First character match or '?' match
        first_match = bool(s) and (p[0] == s[0] or p[0] == '?')
        
        # If the pattern starts with '*', we have two options:
        # 1. Ignore '*' and move to the next pattern character
        # 2. Use '*' to match one character in s and check the rest
        if p[0] == '*':
            return (self.isMatch(s, p[1:]) or (bool(s) and self.isMatch(s[1:], p)))
        
        # If the first character matches, move to the next character in both strings
        return first_match and self.isMatch(s[1:], p[1:])
```

---

### ⚙️ Level 2: Dynamic Programming (Bottom-Up)

**Approach:**  
We use dynamic programming to store whether substrings of `s` and `p` match at each step. We create a 2D table `dp` where `dp[i][j]` represents whether `s[0..i-1]` matches `p[0..j-1]`.

```python
# Time Complexity: O(m * n), where m and n are the lengths of s and p respectively.
# Space Complexity: O(m * n), due to the dp table
class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        m, n = len(s), len(p)
        dp = [[False] * (n + 1) for _ in range(m + 1)]
        
        # Base case: empty string matches empty pattern
        dp[0][0] = True
        
        # If pattern starts with '*', it can match an empty string
        for j in range(1, n + 1):
            if p[j - 1] == '*':
                dp[0][j] = dp[0][j - 1]
        
        # Fill the DP table
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if p[j - 1] == s[i - 1] or p[j - 1] == '?':
                    dp[i][j] = dp[i - 1][j - 1]
                elif p[j - 1] == '*':
                    dp[i][j] = dp[i - 1][j] or dp[i][j - 1]
        
        return dp[m][n]
```

---

### ⚡ Level 3: Space Optimized DP

**Approach:**  
We can reduce the space complexity by only keeping track of the current and previous rows of the DP table, as each row depends only on the previous row.

```python
# Time Complexity: O(m * n), where m and n are the lengths of s and p respectively.
# Space Complexity: O(n), space is reduced by using a single row
class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        m, n = len(s), len(p)
        dp = [False] * (n + 1)
        dp[0] = True
        
        # Handle cases where the pattern starts with '*' and matches an empty string
        for j in range(1, n + 1):
            if p[j - 1] == '*':
                dp[j] = dp[j - 1]
        
        for i in range(1, m + 1):
            prev = dp[0]  # Save the previous row's first element
            dp[0] = False  # Empty string doesn't match any non-empty pattern
            for j in range(1, n + 1):
                temp = dp[j]  # Store the current value before overwriting
                if p[j - 1] == s[i - 1] or p[j - 1] == '?':
                    dp[j] = prev
                elif p[j - 1] == '*':
                    dp[j] = dp[j - 1] or dp[j]
                prev = temp  # Move to the next element in the previous row
        
        return dp[n]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Brute Force (Recursive)              | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Bottom-Up)      | O(m * n)        | O(m * n)         |
| 3     | Space Optimized DP                   | O(m * n)        | O(n)             |

---

## 🔗 Similar Problems

1. [10. Regular Expression Matching](https://leetcode.com/problems/regular-expression-matching/)
2. [71. Simplify Path](https://leetcode.com/problems/simplify-path/)
3. [392. Is Subsequence](https://leetcode.com/problems/is-subsequence/)

---

## 📌 Takeaway Points

- **Wildcard `*` and `?` Matching:** The pattern matching problem is common and can be approached using recursion, dynamic programming, or greedy algorithms.
- **Dynamic Programming:** The bottom-up DP approach is efficient, allowing us to break down the problem into manageable parts.
- **Space Optimization:** The space complexity can be optimized by only maintaining the current and previous row in the DP table.

---
