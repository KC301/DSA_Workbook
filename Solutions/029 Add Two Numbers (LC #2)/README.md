
---

# ➕ Problem: Add Two Numbers

## 📘 Problem Statement

> You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contains a single digit. Add the two numbers and return it as a linked list.

> You may assume the two numbers do not have leading zeros, except the number 0 itself.

**LeetCode Link:** [2. Add Two Numbers](https://leetcode.com/problems/add-two-numbers/)

---

```
Example 1:

Input: l1 = [2,4,3], l2 = [5,6,4]  
Output: [7,0,8]  
Explanation: 342 + 465 = 807.

Example 2:

Input: l1 = [0], l2 = [0]  
Output: [0]

Example 3:

Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]  
Output: [8,9,9,9,0,0,0,1]  
Explanation: 9999999 + 9999 = 10009998.
```

---

## ✅ Constraints

- The number of nodes in each linked list is in the range `[1, 100]`.
- `0 <= Node.val <= 9`
- It is guaranteed that the list represents a number without leading zeros.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Iteration with Carry

**Approach:**  
Iterate over both linked lists, adding the corresponding digits along with any carry. If the sum is greater than 9, we carry the value over to the next position.

```python
# Time Complexity: O(max(m, n))
# Space Complexity: O(max(m, n))
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def addTwoNumbers(l1: ListNode, l2: ListNode) -> ListNode:
    dummy_head = ListNode(0)
    current = dummy_head
    carry = 0

    while l1 or l2 or carry:
        val1 = l1.val if l1 else 0
        val2 = l2.val if l2 else 0
        total = val1 + val2 + carry
        carry = total // 10
        current.next = ListNode(total % 10)
        current = current.next
        
        if l1: l1 = l1.next
        if l2: l2 = l2.next

    return dummy_head.next
```

---

### ⚙️ Level 2: Optimized Iteration with Early Exit

**Approach:**  
This solution is essentially the same as Level 1, but we try to minimize extra checks by directly using the values of `l1` and `l2` and ensuring we exit early if both lists and the carry are all exhausted.

```python
# Time Complexity: O(max(m, n))
# Space Complexity: O(max(m, n))
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def addTwoNumbers(l1: ListNode, l2: ListNode) -> ListNode:
    dummy_head = ListNode(0)
    current = dummy_head
    carry = 0

    while l1 or l2 or carry:
        val1 = l1.val if l1 else 0
        val2 = l2.val if l2 else 0
        total = val1 + val2 + carry
        carry = total // 10
        current.next = ListNode(total % 10)
        current = current.next
        
        # Move to the next nodes if available
        l1 = l1.next if l1 else None
        l2 = l2.next if l2 else None

    return dummy_head.next
```

---

### 🚀 Level 3: Optimized and Concise Approach

**Approach:**  
This solution is almost identical to Level 2, with minor optimizations to the flow and concise usage of the pointers.

```python
# Time Complexity: O(max(m, n))
# Space Complexity: O(max(m, n))
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def addTwoNumbers(l1: ListNode, l2: ListNode) -> ListNode:
    dummy_head = ListNode(0)
    current = dummy_head
    carry = 0

    while l1 or l2 or carry:
        total = carry
        if l1:
            total += l1.val
            l1 = l1.next
        if l2:
            total += l2.val
            l2 = l2.next
        carry, value = divmod(total, 10)
        current.next = ListNode(value)
        current = current.next

    return dummy_head.next
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Simple Iteration with Carry      | O(max(m, n))    | O(max(m, n))     |
| 2     | Optimized Iteration with Early Exit | O(max(m, n))    | O(max(m, n))     |
| 3     | Optimized and Concise Approach   | O(max(m, n))    | O(max(m, n))     |

---

## 🔗 Similar Problems

1. [445. Add Two Numbers II](https://leetcode.com/problems/add-two-numbers-ii/)
2. [24. Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs/)
3. [19. Remove Nth Node From End of List](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)
4. [160. Intersection of Two Linked Lists](https://leetcode.com/problems/intersection-of-two-linked-lists/)
5. [61. Rotate List](https://leetcode.com/problems/rotate-list/)

---

## 📌 Takeaway Points

- Use a **dummy node** to simplify handling the head of the result list.
- Remember to account for **carry** when summing the digits.
- Make sure to handle the **cases where one list is longer** than the other.

---
