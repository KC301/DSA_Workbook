
---

# ➕ Problem: Merge k Sorted Lists

## 📘 Problem Statement

> You are given an array of `k` linked lists, each of which is sorted in ascending order.  
> Merge all the linked lists into one sorted linked list and return it.

**LeetCode Link:** [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

---

```
Example 1:

Input: lists = [[1,4,5],[1,3,4],[2,6]]  
Output: [1,1,2,3,4,4,5,6]  
Explanation: The merged list is [1,1,2,3,4,4,5,6].

Example 2:

Input: lists = []  
Output: []  
Explanation: There are no linked lists to merge.

Example 3:

Input: lists = [[-1,5,11],[6,10]]  
Output: [-1,5,6,10,11]  
Explanation: The merged list is [-1,5,6,10,11].
```

---

## ✅ Constraints

- `k == lists.length`
- `0 <= k <= 10⁴`
- `0 <= lists[i].length <= 500`
- `-10⁴ <= lists[i][j] <= 10⁴`
- Lists are sorted in **ascending order**.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach (Flatten and Sort)

**Approach:**  
Flatten all the linked lists into one single list and then sort it. Finally, build a new sorted linked list from the sorted list.

```python
# Time Complexity: O(N log N), where N is the total number of elements across all lists
# Space Complexity: O(N), where N is the total number of elements across all lists
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def mergeKLists(lists):
    nodes = []
    
    # Step 1: Flatten all lists into one list
    for head in lists:
        while head:
            nodes.append(head.val)
            head = head.next
    
    # Step 2: Sort the list
    nodes.sort()

    # Step 3: Rebuild the sorted linked list
    dummy = ListNode()
    current = dummy
    for val in nodes:
        current.next = ListNode(val)
        current = current.next
    
    return dummy.next
```

---

### ⚙️ Level 2: Using a Min-Heap (Priority Queue)

**Approach:**  
Use a min-heap to extract the smallest element among the k lists. For each extracted element, push the next element from the corresponding list into the heap.

```python
# Time Complexity: O(N log k), where N is the total number of elements across all lists, and k is the number of lists
# Space Complexity: O(k), where k is the number of lists
import heapq

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
    
    def __lt__(self, other):
        return self.val < other.val

def mergeKLists(lists):
    min_heap = []
    
    # Step 1: Push the first node of each list into the heap
    for head in lists:
        if head:
            heapq.heappush(min_heap, head)

    # Step 2: Extract the smallest node from the heap and push its next node into the heap
    dummy = ListNode()
    current = dummy
    while min_heap:
        node = heapq.heappop(min_heap)
        current.next = node
        current = current.next
        if node.next:
            heapq.heappush(min_heap, node.next)

    return dummy.next
```

---

### 🚀 Level 3: Optimized Merge Using Divide and Conquer

**Approach:**  
Use a divide-and-conquer approach to merge the k lists. Merge lists pair by pair in a recursive manner to reduce the time complexity.

```python
# Time Complexity: O(N log k), where N is the total number of elements across all lists, and k is the number of lists
# Space Complexity: O(1), since we are merging in place
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def mergeTwoLists(l1, l2):
    dummy = ListNode()
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

def mergeKLists(lists):
    if not lists:
        return None
    
    # Step 1: Recursively merge lists in pairs
    while len(lists) > 1:
        merged = []
        for i in range(0, len(lists), 2):
            l1 = lists[i]
            l2 = lists[i + 1] if i + 1 < len(lists) else None
            merged.append(mergeTwoLists(l1, l2))
        lists = merged
    
    return lists[0]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (Flatten and Sort)     | O(N log N)      | O(N)             |
| 2     | Min-Heap (Priority Queue)          | O(N log k)      | O(k)             |
| 3     | Divide and Conquer (Optimized)     | O(N log k)      | O(1)             |

---

## 🔗 Similar Problems

1. [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)
2. [148. Sort List](https://leetcode.com/problems/sort-list/)
3. [101. Symmetric Tree](https://leetcode.com/problems/symmetric-tree/)
4. [25. Reverse Nodes in k-Group](https://leetcode.com/problems/reverse-nodes-in-k-group/)
5. [240. Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/)

---

## 📌 Takeaway Points

- **Min-heap** is a great way to solve the problem in `O(N log k)` time where `k` is the number of lists.
- The **divide and conquer** approach is efficient for merging lists pair by pair with `O(N log k)` time complexity and constant space.
- Sorting all elements at once (Brute Force) is not the most efficient way for merging multiple sorted lists.

---
