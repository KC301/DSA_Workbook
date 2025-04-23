
---

# ➕ Problem: Remove Nth Node From End of List

## 📘 Problem Statement

> Given the head of a linked list, remove the `nth` node from the end of the list and return its head.  
> The list is guaranteed to have at least one node.

**LeetCode Link:** [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

---

```
Example 1:

Input: head = [1,2,3,4,5], n = 2  
Output: [1,2,3,5]  
Explanation: After removing the 2nd node from the end, the linked list becomes [1,2,3,5].

Example 2:

Input: head = [1], n = 1  
Output: []  
Explanation: The linked list is empty after removing the 1st node.

Example 3:

Input: head = [1,2], n = 1  
Output: [1]  
Explanation: After removing the 1st node from the end, the linked list becomes [1].
```

---

## ✅ Constraints

- The number of nodes in the list is in the range `[1, 30]`.
- `1 <= n <= length of list`
- `0 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Traverse the List to Find Length

**Approach:**  
First, find the length of the list. Then, calculate the position of the node to be removed (from the start of the list). Finally, traverse again and remove the node by adjusting the pointers.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def removeNthFromEnd(head: ListNode, n: int) -> ListNode:
    # Find the length of the list
    length = 0
    current = head
    while current:
        length += 1
        current = current.next
    
    # Find the (length - n + 1)-th node
    current = head
    for _ in range(length - n - 1):
        current = current.next
    
    # Remove the nth node
    if current and current.next:
        current.next = current.next.next
    
    return head if n != length else head.next
```

---

### ⚙️ Level 2: Two Pointer Approach (Optimal)

**Approach:**  
Use two pointers, both initially pointing to the head. Move the first pointer `n` steps ahead. Then move both pointers simultaneously until the first pointer reaches the end. The second pointer will now be just before the node to remove.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def removeNthFromEnd(head: ListNode, n: int) -> ListNode:
    dummy = ListNode(0)
    dummy.next = head
    first = dummy
    second = dummy
    
    # Move the first pointer to the nth node
    for _ in range(n + 1):
        first = first.next
    
    # Move both pointers until the first pointer reaches the end
    while first:
        first = first.next
        second = second.next
    
    # Remove the nth node
    second.next = second.next.next
    
    return dummy.next
```

---

### 🚀 Level 3: Optimized Space with Edge Case Handling

**Approach:**  
This approach builds upon Level 2, but explicitly handles edge cases (like when `n` equals the length of the list).

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def removeNthFromEnd(head: ListNode, n: int) -> ListNode:
    dummy = ListNode(0)
    dummy.next = head
    fast = slow = dummy
    
    # Move fast pointer n steps ahead
    for _ in range(n):
        fast = fast.next
    
    # Move both fast and slow pointers until fast reaches the end
    while fast.next:
        fast = fast.next
        slow = slow.next
    
    # Remove the nth node from the end
    slow.next = slow.next.next
    
    return dummy.next
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Traverse to find length          | O(n)            | O(1)             |
| 2     | Two Pointer Approach             | O(n)            | O(1)             |
| 3     | Optimized Space with Edge Cases  | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [2. Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)
2. [92. Reverse Linked List II](https://leetcode.com/problems/reverse-linked-list-ii/)
3. [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/)
4. [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)
5. [141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)

---

## 📌 Takeaway Points

- **Two-pointer approach** is optimal for problems like this as it reduces the need for multiple traversals of the list.
- **Dummy node** is often used to handle edge cases like removing the head node without additional checks.
- **Edge case handling** is crucial to avoid errors, especially when the node to be removed is at the head or the tail.

---
