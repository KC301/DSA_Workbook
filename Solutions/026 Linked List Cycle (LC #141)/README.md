
---

# ➕ Problem: Linked List Cycle

## 📘 Problem Statement

> Given a linked list, determine if it has a cycle in it.  
> There is a cycle in a linked list if and only if there is some node `c` such that `slow` and `fast` meet at `c`.  
> Return `true` if there is a cycle in the linked list, otherwise return `false`.

**LeetCode Link:** [141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)

---

```
Example 1:

Input: head = [3,2,0,-4], pos = 1  
Output: true  
Explanation: There is a cycle in the list, where the tail connects to the second node.

Example 2:

Input: head = [1,2], pos = 0  
Output: true  
Explanation: There is a cycle in the list, where the tail connects to the first node.

Example 3:

Input: head = [1], pos = -1  
Output: false  
Explanation: There is no cycle in the list.

```

---

## ✅ Constraints

- The number of nodes in the list is in the range `[0, 10⁴]`.
- `-10⁵ <= Node.val <= 10⁵`
- `pos` is `-1` or a valid index in the linked list.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Set (HashSet)

**Approach:**  
Traverse the linked list and use a set to store the visited nodes. If a node is encountered that is already in the set, a cycle is detected.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def hasCycle(head: ListNode) -> bool:
    visited = set()
    while head:
        if head in visited:
            return True
        visited.add(head)
        head = head.next
    return False
```

---

### ⚙️ Level 2: Floyd’s Tortoise and Hare (Two Pointers)

**Approach:**  
Use two pointers, one slow and one fast. The slow pointer moves one step at a time, and the fast pointer moves two steps at a time. If there is a cycle, the fast pointer will eventually meet the slow pointer inside the cycle. This is a well-known algorithm called **Floyd’s Tortoise and Hare**.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def hasCycle(head: ListNode) -> bool:
    slow, fast = head, head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            return True
    return False
```

---

### 🚀 Level 3: Optimized Space with Constant Space Complexity

**Approach:**  
This is essentially the same approach as Level 2 but explicitly clarifies that no additional space (other than two pointers) is used. It’s an optimal approach in both time and space.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def hasCycle(head: ListNode) -> bool:
    slow, fast = head, head
    while fast and fast.next:
        slow = slow.next
        fast = fast.next.next
        if slow == fast:
            return True
    return False
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force with Set (HashSet)   | O(n)            | O(n)             |
| 2     | Floyd’s Tortoise and Hare (Two Pointers) | O(n)            | O(1)             |
| 3     | Optimized Floyd’s Tortoise and Hare | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)
2. [160. Intersection of Two Linked Lists](https://leetcode.com/problems/intersection-of-two-linked-lists/)
3. [328. Odd Even Linked List](https://leetcode.com/problems/odd-even-linked-list/)
4. [206. Reverse Linked List](https://leetcode.com/problems/reverse-linked-list/)
5. [61. Rotate List](https://leetcode.com/problems/rotate-list/)

---

## 📌 Takeaway Points

- **Floyd’s Tortoise and Hare** is a very efficient approach for cycle detection in linked lists. It only uses two pointers and operates in constant space.
- **Brute Force with Set** is simple and easy to implement, but it uses extra space for storing visited nodes.
- **Cycle Detection** is often a key problem in understanding linked list manipulation and is widely applicable in graph traversal algorithms.

---
