
---

# ➕ Problem: LFU Cache

## 📘 Problem Statement

> Design and implement a data structure for a **Least Frequently Used (LFU) Cache**.
> 
> Implement the `LFUCache` class:
> 
> - **`LFUCache(int capacity)`**: Initialize the LFU cache with a positive integer `capacity`. If the capacity is non-positive, the cache will be empty.
> - **`get(int key)`**: Return the value of the key if the key exists, otherwise return `-1`.
> - **`put(int key, int value)`**: Insert or update the value of the key. When the cache reaches its `capacity`, it should invalidate the least frequently used key before inserting a new one.

> The functions **`get`** and **`put`** must each run in **O(1) average time complexity**.

**LeetCode Link:** [460. LFU Cache](https://leetcode.com/problems/lfu-cache/)

---

```
Example 1:
Input:
["LFUCache", "put", "put", "get", "put", "get", "put", "get", "get"]
[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3]]
Output:
[null, null, null, 1, null, 2, null, -1, 3]
Explanation:
LFUCache lfu = new LFUCache(2);
lfu.put(1, 1); // cache is {1=1}
lfu.put(2, 2); // cache is {1=1, 2=2}
lfu.get(1);     // return 1
lfu.put(3, 3);  // evicts key 2, cache is {1=1, 3=3}
lfu.get(2);     // returns -1 (not found)
lfu.put(4, 4);  // evicts key 1, cache is {4=4, 3=3}
lfu.get(1);     // returns -1 (not found)
lfu.get(3);     // returns 3
```

---

## ✅ Constraints

- `0 <= capacity <= 10⁴`
- `0 <= key <= 10⁶`
- `0 <= value <= 10⁶`
- **At most 10⁵** `get` and `put` calls will be made.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Basic Implementation Using Hash Map and Frequency Map

**Approach:**  
Use a dictionary to store the cache, and another dictionary to keep track of the frequency of each key.

```python
# Time Complexity: O(1) for get and put
# Space Complexity: O(n) where n is the number of keys in the cache
class LFUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}  # stores key-value pairs
        self.freq = {}   # stores key-frequency pairs
        self.min_freq = 0

    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1
        self.freq[key] += 1
        self.min_freq = min(self.min_freq, self.freq[key])
        return self.cache[key]

    def put(self, key: int, value: int) -> None:
        if self.capacity == 0:
            return
        if key in self.cache:
            self.cache[key] = value
            self.get(key)  # Increase frequency on put
        else:
            if len(self.cache) >= self.capacity:
                # Evict the least frequent key
                least_freq_key = min(self.freq, key=lambda k: self.freq[k])
                del self.cache[least_freq_key]
                del self.freq[least_freq_key]
            self.cache[key] = value
            self.freq[key] = 1
            self.min_freq = 1
```

---

### ⚙️ Level 2: Optimized with Doubly Linked List for Cache Ordering

**Approach:**  
Use a doubly linked list for cache ordering along with the frequency map for faster eviction of least frequently used keys.

```python
# Time Complexity: O(1) for get and put
# Space Complexity: O(n) where n is the number of keys in the cache
class LFUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}  # stores key-value pairs
        self.freq_map = {}  # stores frequency as the key and doubly linked list of keys as value
        self.min_freq = 0

    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1
        # Increase frequency
        value = self.cache[key]
        self._update_freq(key)
        return value

    def put(self, key: int, value: int) -> None:
        if self.capacity == 0:
            return
        if key in self.cache:
            self.cache[key] = value
            self._update_freq(key)
        else:
            if len(self.cache) >= self.capacity:
                # Evict least frequently used key
                self._evict()
            self.cache[key] = value
            self.freq_map[1] = self.freq_map.get(1, set()) | {key}
            self.min_freq = 1

    def _update_freq(self, key: int) -> None:
        freq = self.freq_map.get(key, 0)
        self.freq_map[freq].remove(key)
        if not self.freq_map[freq]:
            del self.freq_map[freq]
        self.freq_map[freq + 1] = self.freq_map.get(freq + 1, set()) | {key}
        self.min_freq = min(self.min_freq, freq + 1)

    def _evict(self) -> None:
        key_to_evict = next(iter(self.freq_map[self.min_freq]))
        del self.cache[key_to_evict]
        self.freq_map[self.min_freq].remove(key_to_evict)
        if not self.freq_map[self.min_freq]:
            del self.freq_map[self.min_freq]
```

---

### 🚀 Level 3: Fully Optimized with Doubly Linked List and HashMap for O(1) Operations

**Approach:**  
Use a doubly linked list to store keys grouped by frequency, a hashmap for storing key-value pairs, and another hashmap for key frequencies. This allows constant time complexity for both `get` and `put` operations.

```python
# Time Complexity: O(1) for get and put
# Space Complexity: O(n) where n is the number of keys in the cache
class LFUCache:

    class Node:
        def __init__(self, key, value):
            self.key = key
            self.value = value
            self.freq = 1
            self.prev = self.next = None

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}
        self.freq_map = {}
        self.min_freq = 0

    def get(self, key: int) -> int:
        if key not in self.cache:
            return -1
        node = self.cache[key]
        self._update(node)
        return node.value

    def put(self, key: int, value: int) -> None:
        if self.capacity == 0:
            return
        if key in self.cache:
            node = self.cache[key]
            node.value = value
            self._update(node)
        else:
            if len(self.cache) >= self.capacity:
                self._evict()
            node = self.Node(key, value)
            self.cache[key] = node
            self.min_freq = 1
            if self.min_freq not in self.freq_map:
                self.freq_map[self.min_freq] = []
            self.freq_map[self.min_freq].append(node)

    def _update(self, node):
        self.freq_map[node.freq].remove(node)
        if not self.freq_map[node.freq]:
            del self.freq_map[node.freq]
        node.freq += 1
        if node.freq not in self.freq_map:
            self.freq_map[node.freq] = []
        self.freq_map[node.freq].append(node)

    def _evict(self):
        node_to_evict = self.freq_map[self.min_freq].pop(0)
        del self.cache[node_to_evict.key]
        if not self.freq_map[self.min_freq]:
            del self.freq_map[self.min_freq]
```

---

## 🔗 Similar Problems

1. [146. LRU Cache](https://leetcode.com/problems/lru-cache/)
2. [146. Design a Least Recently Used (LRU) Cache](https://leetcode.com/problems/lru-cache/)
3. [1648. Sell Diminishing-Valued Colored Balls](https://leetcode.com/problems/sell-diminishing-valued-colored-balls/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                               | Time Complexity | Space Complexity |
|-------|----------------------------------------|-----------------|------------------|
| 1     | Basic Implementation Using Hash Map   | O(1)            | O(n)             |
| 2     | Optimized with Doubly Linked List      | O(1)            | O(n)             |
| 3     | Fully Optimized with Doubly Linked List and HashMap | O(1)  | O(n)             |

---

## 📌 Takeaway Points

- LFU Cache requires maintaining frequency counts for all keys.
- Efficient implementation using doubly linked lists and hashmaps ensures O(1) access and eviction.
- Eviction policies must be carefully handled to ensure the least frequently used key is evicted when the cache is full.

---
