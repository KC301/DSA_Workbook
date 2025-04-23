
---

# ➕ Problem: Design Hit Counter

## 📘 Problem Statement

> Design a hit counter that counts the number of hits received in the past 5 minutes. Each function should be implemented in constant time.
> 
> Implement the `HitCounter` class:
> - `HitCounter()` Initializes the counter object.
> - `hit(timestamp)` Records a hit at the given timestamp.
> - `getHits(timestamp)` Returns the number of hits in the past 5 minutes (including the current minute).

**LeetCode Link:** [362. Design Hit Counter](https://leetcode.com/problems/design-hit-counter/)

---

```
Example 1:
Input:
["HitCounter", "hit", "hit", "getHits", "hit", "getHits", "getHits"]
[[], [1], [2], [3], [300], [300], [301]]
Output:
[null, null, null, 2, null, 3, 3]
Explanation:
HitCounter counter = new HitCounter();
counter.hit(1); // records a hit at timestamp 1.
counter.hit(2); // records a hit at timestamp 2.
counter.getHits(3); // getHits(3) should return 2 as hits at timestamps 1 and 2 are within 5 minutes.
counter.hit(300); // records a hit at timestamp 300.
counter.getHits(300); // getHits(300) should return 3 as hits at timestamps 1, 2, and 300 are within 5 minutes.
counter.getHits(301); // getHits(301) should return 3 as hits at timestamps 1, 2, and 300 are within 5 minutes.
```

---

## ✅ Constraints

- `1 <= timestamp <= 2 * 10⁴`
- Each timestamp is strictly increasing.
- At most `300` calls will be made to `hit` and `getHits`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple List-based Approach

**Approach:**  
Maintain a list of timestamps for each hit. For each `getHits` query, filter the list to include only hits within the last 5 minutes. This approach, however, has a time complexity of O(n) for `getHits` because it has to check all hits within the last 5 minutes.

```python
# Time Complexity: O(n) for getHits, O(1) for hit
# Space Complexity: O(n)
class HitCounter:

    def __init__(self):
        self.hits = []

    def hit(self, timestamp: int) -> None:
        self.hits.append(timestamp)

    def getHits(self, timestamp: int) -> int:
        # Filter hits that occurred within the last 5 minutes
        return len([hit for hit in self.hits if hit > timestamp - 300])
```

---

### ⚙️ Level 2: Optimized with Queue (Using Deque)

**Approach:**  
We use a deque (double-ended queue) to store the hits, ensuring that only hits within the last 5 minutes are kept. When `getHits` is called, we remove hits that are older than 5 minutes (i.e., older than `timestamp - 300`), ensuring an O(1) time complexity for both `hit` and `getHits` operations.

```python
# Time Complexity: O(1) for both hit and getHits
# Space Complexity: O(k), where k is the number of hits within the last 5 minutes
from collections import deque

class HitCounter:

    def __init__(self):
        self.hits = deque()

    def hit(self, timestamp: int) -> None:
        self.hits.append(timestamp)

    def getHits(self, timestamp: int) -> int:
        # Remove hits that are older than the last 5 minutes
        while self.hits and self.hits[0] <= timestamp - 300:
            self.hits.popleft()
        return len(self.hits)
```

---

### 🚀 Level 3: Fully Optimized with Fixed Size Deque

**Approach:**  
The same as the Level 2 approach, but we optimize the memory by limiting the number of elements stored in the deque to at most 300, which is the maximum number of hits within any 5-minute window. This ensures both `hit` and `getHits` are O(1), with minimal space usage.

```python
# Time Complexity: O(1) for both hit and getHits
# Space Complexity: O(k), where k is the number of hits within the last 5 minutes
from collections import deque

class HitCounter:

    def __init__(self):
        self.hits = deque()

    def hit(self, timestamp: int) -> None:
        self.hits.append(timestamp)

    def getHits(self, timestamp: int) -> int:
        # Remove hits that are older than the last 5 minutes
        while self.hits and self.hits[0] <= timestamp - 300:
            self.hits.popleft()
        return len(self.hits)
```

---

## 🔗 Similar Problems

1. [295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/)
2. [348. Design Tic-Tac-Toe](https://leetcode.com/problems/design-tic-tac-toe/)
3. [304. Range Sum Query 2D - Immutable](https://leetcode.com/problems/range-sum-query-2d-immutable/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity (hit / getHits) | Space Complexity |
|-------|--------------------------------------|--------------------------------|------------------|
| 1     | Simple List-based Approach           | O(1) / O(n)                    | O(n)             |
| 2     | Optimized with Queue (Deque)         | O(1) / O(1)                    | O(k)             |
| 3     | Fully Optimized with Fixed Size Deque| O(1) / O(1)                    | O(k)             |

---

## 📌 Takeaway Points

- A simple list-based approach works, but its `getHits` operation becomes slow as the list grows, especially for larger inputs.
- The optimized approach using a deque allows us to keep track of hits efficiently within the 5-minute window.
- The fixed-size deque ensures memory is not wasted and operations remain efficient for a large number of hits.

---
