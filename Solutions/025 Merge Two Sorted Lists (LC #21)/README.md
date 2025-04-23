
---

# ➕ Problem: Merge Two Sorted Lists

## 📘 Problem Statement

> You are given the heads of two sorted linked lists `list1` and `list2`.  
> Merge the two lists into a new sorted list.  
> The new list should be made by splicing together the nodes of the first two lists.

**LeetCode Link:** [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)

---

```
Example 1:

Input: list1 = [1,2,4], list2 = [1,3,4]  
Output: [1,1,2,3,4,4]

Example 2:

Input: list1 = [], list2 = [0]  
Output: [0]

Example 3:

Input: list1 = [5], list2 = [1,2,4]  
Output: [1,2,4,5]
```

---

## ✅ Constraints

- The number of nodes in both lists is in the range `[0, 50]`.
- `-100 <= Node.val <= 100`
- Both `list1` and `list2` are sorted in non-decreasing order.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Iterative Approach

**Approach:**  
Merge the two lists by comparing the current nodes of each list. Add the smaller node to the result list, then move the pointer in the corresponding list.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def mergeTwoLists(list1: ListNode, list2: ListNode) -> ListNode:
    dummy = ListNode()
    current = dummy
    
    while list1 and list2:
        if list1.val < list2.val:
            current.next = list1
            list1 = list1.next
        else:
            current.next = list2
            list2 = list2.next
        current = current.next
    
    # Attach the remaining elements
    if list1:
        current.next = list1
    if list2:
        current.next = list2
    
    return dummy.next
```

---

### ⚙️ Level 2: Recursive Approach

**Approach:**  
Recursively merge the two lists. At each step, choose the node with the smaller value and recursively merge the rest of the lists.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(n + m) (due to recursion stack)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def mergeTwoLists(list1: ListNode, list2: ListNode) -> ListNode:
    if not list1:
        return list2
    if not list2:
        return list1
    
    if list1.val < list2.val:
        list1.next = mergeTwoLists(list1.next, list2)
        return list1
    else:
        list2.next = mergeTwoLists(list1, list2.next)
        return list2
```

---

### 🚀 Level 3: Optimized Iterative Approach

**Approach:**  
This is similar to Level 1, but written in a more compact manner and with reduced variable usage.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def mergeTwoLists(list1: ListNode, list2: ListNode) -> ListNode:
    if not list1 or not list2:
        return list1 or list2
    
    if list1.val < list2.val:
        list1.next = mergeTwoLists(list1.next, list2)
        return list1
    else:
        list2.next = mergeTwoLists(list1, list2.next)
        return list2
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Iterative Approach               | O(n + m)        | O(1)             |
| 2     | Recursive Approach               | O(n + m)        | O(n + m)         |
| 3     | Optimized Iterative Approach     | O(n + m)        | O(1)             |

---

## 🔗 Similar Problems

1. [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)
2. [86. Partition List](https://leetcode.com/problems/partition-list/)
3. [203. Remove Linked List Elements](https://leetcode.com/problems/remove-linked-list-elements/)
4. [61. Rotate List](https://leetcode.com/problems/rotate-list/)
5. [148. Sort List](https://leetcode.com/problems/sort-list/)

---

## 📌 Takeaway Points

- **Iterative** approach is space efficient, especially for linked list problems, since it doesn't require additional space for recursion stacks.
- **Recursion** can make the code cleaner, but it has a higher space complexity due to the recursion stack.
- Merging two sorted lists is often a basic problem that builds understanding of manipulating linked lists and handling edge cases like empty lists.

---
