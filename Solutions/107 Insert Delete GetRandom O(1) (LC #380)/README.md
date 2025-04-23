
---

# ➕ Problem: Insert Delete GetRandom O(1)

## 📘 Problem Statement

> Design a data structure that supports the following operations:
> - `insert(val)`: Inserts an item into the set. Returns `true` if the item was not already present.
> - `remove(val)`: Removes an item from the set. Returns `true` if the item was present.
> - `getRandom()`: Get a random element from the set. Each element must have the same probability of being returned.
> 
> Implement the `RandomizedSet` class:
> - `RandomizedSet()`: Initializes the `RandomizedSet` object.
> - `insert(val)`: Inserts `val` into the set, returns `true` if the item was not already present.
> - `remove(val)`: Removes `val` from the set, returns `true` if the item was present.
> - `getRandom()`: Returns a random element from the set.

**LeetCode Link:** [380. Insert Delete GetRandom O(1)](https://leetcode.com/problems/insert-delete-getrandom-o1/)

---

```
Example 1:
Input:
["RandomizedSet","insert","insert","getRandom","remove","insert","getRandom"]
[[],[1],[2],[],[1],[2],[]]
Output:
[null,true,true,1,true,false,2]
Explanation:
RandomizedSet randomizedSet = new RandomizedSet();
randomizedSet.insert(1); // Inserts 1 to the set. Returns true as 1 was inserted successfully.
randomizedSet.insert(2); // Inserts 2 to the set. Returns true as 2 was inserted successfully.
randomizedSet.getRandom(); // getRandom should return either 1 or 2 randomly.
randomizedSet.remove(1); // Removes 1 from the set. Returns true as 1 was present in the set.
randomizedSet.insert(2); // 2 was already in the set, so return false.
randomizedSet.getRandom(); // Since 2 is the only number in the set, getRandom always returns 2.
```

---

## ✅ Constraints

- `-2³¹ <= val <= 2³¹ - 1`
- At most `2 * 10⁵` operations will be called on `insert`, `remove`, and `getRandom`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple List-based Approach

**Approach:**  
Store the elements in a list, and map each element to its index in the list. In this case, `getRandom` can simply return a random index from the list. Insertion and removal are inefficient for large sets as they require shifting elements.

```python
# Time Complexity: O(1) for insert/remove, O(n) for getRandom
# Space Complexity: O(n)
import random

class RandomizedSet:

    def __init__(self):
        self.vals = []
        self.val_to_index = {}

    def insert(self, val: int) -> bool:
        if val in self.val_to_index:
            return False
        self.vals.append(val)
        self.val_to_index[val] = len(self.vals) - 1
        return True

    def remove(self, val: int) -> bool:
        if val not in self.val_to_index:
            return False
        # Swap the element to be removed with the last element in the list
        index = self.val_to_index[val]
        last_val = self.vals[-1]
        self.vals[index] = last_val
        self.val_to_index[last_val] = index
        self.vals.pop()
        del self.val_to_index[val]
        return True

    def getRandom(self) -> int:
        return random.choice(self.vals)
```

---

### ⚙️ Level 2: Optimized with List and HashMap

**Approach:**  
For efficient removal, we swap the element to be removed with the last element in the list. This ensures that the list remains contiguous without gaps, making it O(1) for both insertion and removal. `getRandom` is still O(1) by choosing a random index from the list.

```python
# Time Complexity: O(1) for insert/remove/getRandom
# Space Complexity: O(n)
import random

class RandomizedSet:

    def __init__(self):
        self.vals = []
        self.val_to_index = {}

    def insert(self, val: int) -> bool:
        if val in self.val_to_index:
            return False
        self.vals.append(val)
        self.val_to_index[val] = len(self.vals) - 1
        return True

    def remove(self, val: int) -> bool:
        if val not in self.val_to_index:
            return False
        # Swap the element to be removed with the last element in the list
        index = self.val_to_index[val]
        last_val = self.vals[-1]
        self.vals[index] = last_val
        self.val_to_index[last_val] = index
        self.vals.pop()
        del self.val_to_index[val]
        return True

    def getRandom(self) -> int:
        return random.choice(self.vals)
```

---

### 🚀 Level 3: Advanced Approach with Array and HashMap

**Approach:**  
This approach is very similar to Level 2 but optimized by managing the list and hash map together. Each operation is O(1), ensuring the structure can handle the large input limits efficiently.

```python
import random

class RandomizedSet:

    def __init__(self):
        self.vals = []
        self.val_to_index = {}

    def insert(self, val: int) -> bool:
        if val in self.val_to_index:
            return False
        self.vals.append(val)
        self.val_to_index[val] = len(self.vals) - 1
        return True

    def remove(self, val: int) -> bool:
        if val not in self.val_to_index:
            return False
        # Swap the element to be removed with the last element in the list
        index = self.val_to_index[val]
        last_val = self.vals[-1]
        self.vals[index] = last_val
        self.val_to_index[last_val] = index
        self.vals.pop()
        del self.val_to_index[val]
        return True

    def getRandom(self) -> int:
        return random.choice(self.vals)
```

---

## 🔗 Similar Problems

1. [381. Insert Delete GetRandom O(1) - Duplicates allowed](https://leetcode.com/problems/insert-delete-getrandom-o1-duplicates-allowed/)
2. [380. Insert Delete GetRandom O(1)](https://leetcode.com/problems/insert-delete-getrandom-o1/)
3. [295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity (insert / remove / getRandom) | Space Complexity |
|-------|------------------------------------|-----------------------------------------------|------------------|
| 1     | Simple List-based Approach         | O(1) / O(1) / O(n)                           | O(n)             |
| 2     | Optimized with List and HashMap    | O(1) / O(1) / O(1)                           | O(n)             |
| 3     | Advanced Approach with Array & HashMap | O(1) / O(1) / O(1)                           | O(n)             |

---

## 📌 Takeaway Points

- The approach with a list and hash map ensures that both insertion and removal are O(1), but `getRandom()` requires O(n) if the list isn't managed properly.
- The advanced approach using swaps for removals is very efficient, ensuring all operations are O(1).
- Random selection is always O(1) when a list is used, which is essential for this problem.

---
