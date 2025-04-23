
---

# ➕ Problem: Reverse Linked List

## 📘 Problem Statement

> Given the head of a singly linked list, reverse the list and return its head.

**LeetCode Link:** [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/)

---

```
Example 1:

Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]

Example 2:

Input: head = [1,2]
Output: [2,1]

Example 3:

Input: head = []
Output: []
```

---

## ✅ Constraints

- The number of nodes in the list is in the range `[0, 5000]`.
- `-5000 <= Node.val <= 5000`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Iterative Approach

**Approach:**  
Use three pointers to reverse the linked list iteratively. Start with `prev` as `None`, `curr` as `head`, and `next_node` as `None`. Traverse the list and reverse the pointers at each step.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reverseList(head: ListNode) -> ListNode:
    prev = None
    curr = head
    while curr:
        next_node = curr.next
        curr.next = prev
        prev = curr
        curr = next_node
    return prev
```

---

### ⚙️ Level 2: Recursive Approach

**Approach:**  
Recursively reverse the rest of the list and then update the next pointer of the current node to point to itself. The base case is when the list is empty or has only one element.

```python
# Time Complexity: O(n)
# Space Complexity: O(n) (due to recursion stack)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reverseList(head: ListNode) -> ListNode:
    if not head or not head.next:
        return head
    reversed_list = reverseList(head.next)
    head.next.next = head
    head.next = None
    return reversed_list
```

---

### 🚀 Level 3: Optimized Iterative Approach with Tail Pointer

**Approach:**  
The iterative approach can be slightly optimized by using a `tail` pointer to minimize unnecessary variable changes.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reverseList(head: ListNode) -> ListNode:
    prev = None
    tail = head
    while tail:
        tail = tail.next
    return reverseListIterative(head, prev)
    
def reverseListIterative(head, prev):
    while head:
        next_node = head.next
        head.next = prev
        prev = head
        head = next_node
    return prev
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Iterative Approach               | O(n)            | O(1)             |
| 2     | Recursive Approach               | O(n)            | O(n)             |
| 3     | Optimized Iterative Approach     | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)
2. [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)
3. [143. Reorder List](https://leetcode.com/problems/reorder-list/)
4. [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/)
5. [61. Rotate List](https://leetcode.com/problems/rotate-list/)

---

## 📌 Takeaway Points

- **Iterative approach** is often more space-efficient as it avoids recursion stack overhead.
- **Recursion** can be elegant for problems like this, but keep an eye on stack depth for large inputs.
- **Pointer manipulation** is key to reversing a linked list without additional memory usage.

---
