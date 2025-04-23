
---

# ➕ Problem: Copy List with Random Pointer

## 📘 Problem Statement

> A linked list is given where each node contains a `val` and a random pointer, which may or may not point to a node in the list.  
> You need to return a deep copy of the list. The deep copy should consist of a new list where:
> - Each node in the original list has a corresponding node in the new list with the same `val`.
> - The `next` pointer and the `random` pointer of the new list should point to the corresponding nodes in the copied list.

> You must solve it **without using extra space** for a copy of the list (i.e., do not use `O(n)` extra space). The random pointer can point to any node in the list or `null`.

**LeetCode Link:** [138. Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer/)

---

```
Example 1:

Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]  
Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]

Example 2:

Input: head = [[1,1],[2,1]]  
Output: [[1,1],[2,1]]

Example 3:

Input: head = [[3,null],[3,0],[3,null]]  
Output: [[3,null],[3,0],[3,null]]
```

---

## ✅ Constraints

- `0 <= n <= 1000`  
- `-10⁴ <= Node.val <= 10⁴`  
- `Node.random` is `null` or points to a node in the linked list.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Naive Approach Using HashMap

**Approach:**  
1. Traverse the original list and create a deep copy of each node.
2. Store references to the copied nodes in a hash map.
3. After copying all nodes, update the `random` pointers of the copied nodes based on the hash map.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
class Node:
    def __init__(self, val=0, next=None, random=None):
        self.val = val
        self.next = next
        self.random = random

def copyRandomList(head: Node) -> Node:
    if not head:
        return None

    # Step 1: Create a hash map for the copied nodes
    old_to_new = {}
    current = head
    
    # Create a deep copy of each node
    while current:
        old_to_new[current] = Node(current.val)
        current = current.next
    
    # Step 2: Set the next and random pointers for the new nodes
    current = head
    while current:
        if current.next:
            old_to_new[current].next = old_to_new[current.next]
        if current.random:
            old_to_new[current].random = old_to_new[current.random]
        current = current.next
    
    return old_to_new[head]
```

---

### ⚙️ Level 2: Optimized Approach (No Extra Space for `next` Pointers)

**Approach:**  
1. We will interleave the original and copied nodes in the list.  
2. For each node, we create a copy right next to it.
3. Set the random pointers by referencing the interleaved nodes.
4. Separate the two lists after processing.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class Node:
    def __init__(self, val=0, next=None, random=None):
        self.val = val
        self.next = next
        self.random = random

def copyRandomList(head: Node) -> Node:
    if not head:
        return None

    # Step 1: Create the interleaved list
    current = head
    while current:
        new_node = Node(current.val)
        new_node.next = current.next
        current.next = new_node
        current = new_node.next

    # Step 2: Set random pointers for the copied nodes
    current = head
    while current:
        if current.random:
            current.next.random = current.random.next
        current = current.next.next

    # Step 3: Separate the two lists
    current = head
    copy_head = head.next
    while current:
        copy = current.next
        current.next = copy.next
        current = current.next
        if current:
            copy.next = current.next

    return copy_head
```

---

### 🚀 Level 3: Optimized Approach (All in Place with O(1) Extra Space)

**Approach:**  
This solution avoids any extra space by directly modifying the linked list in place. We use the `next` pointers to insert copies of the nodes and then separate the lists efficiently.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
class Node:
    def __init__(self, val=0, next=None, random=None):
        self.val = val
        self.next = next
        self.random = random

def copyRandomList(head: Node) -> Node:
    if not head:
        return None

    # Step 1: Insert the copied nodes in between original nodes
    current = head
    while current:
        new_node = Node(current.val)
        new_node.next = current.next
        current.next = new_node
        current = new_node.next

    # Step 2: Assign the random pointers for the new nodes
    current = head
    while current:
        if current.random:
            current.next.random = current.random.next
        current = current.next.next

    # Step 3: Separate the two lists
    current = head
    copy_head = head.next
    while current:
        copy = current.next
        current.next = copy.next
        current = current.next
        if current:
            copy.next = current.next

    return copy_head
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Naive HashMap Approach                | O(n)            | O(n)             |
| 2     | Optimized (Interleaved Nodes)         | O(n)            | O(1)             |
| 3     | Optimized (All in Place)              | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [138. Copy List with Random Pointer](https://leetcode.com/problems/copy-list-with-random-pointer/)
2. [141. Linked List Cycle](https://leetcode.com/problems/linked-list-cycle/)
3. [142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)
4. [24. Swap Nodes in Pairs](https://leetcode.com/problems/swap-nodes-in-pairs/)
5. [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

---

## 📌 Takeaway Points

- **Deep copy** of a linked list with random pointers is a common but tricky problem that requires careful handling of pointers.
- The **interleaving approach** offers a great way to avoid extra space for storing random pointers.
- **In-place modifications** provide an optimal solution by maintaining O(1) space complexity.

---
