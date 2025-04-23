
---

# ➕ Problem: Range Sum Query - Mutable

## 📘 Problem Statement

> Given an integer array `nums`, handle multiple queries of the following types:  
> - Update the value of an element in `nums`.  
> - Calculate the sum of elements between indices `left` and `right` inclusive.  
> Implement the `NumArray` class:  
> - `NumArray(int[] nums)` Initializes the object with the integer array `nums`.  
> - `void update(int index, int val)` Updates the value of `nums[index]` to `val`.  
> - `int sumRange(int left, int right)` Returns the sum of the elements of `nums` between indices `left` and `right` inclusive.

**LeetCode Link:** [307. Range Sum Query - Mutable](https://leetcode.com/problems/range-sum-query-mutable/)

---

```
Example 1:
Input
["NumArray", "sumRange", "update", "sumRange"]
[[[1, 3, 5]], [0, 2], [1, 2], [0, 2]]

Output
[null, 9, null, 8]

Explanation
NumArray numArray = new NumArray([1, 3, 5]);
numArray.sumRange(0, 2); // return 9
numArray.update(1, 2);
numArray.sumRange(0, 2); // return 8
```

---

## ✅ Constraints

- `1 <= nums.length <= 3 * 10⁴`
- `-100 <= nums[i] <= 100`
- `0 <= index < nums.length`
- `-100 <= val <= 100`
- `0 <= left <= right < nums.length`
- At most `3 * 10⁴` calls will be made to `update` and `sumRange`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Direct Update and Sum

**Approach:**  
Directly update the array and recompute the sum during each query.

```python
# Time Complexity: update O(1), sumRange O(n)
# Space Complexity: O(n)
class NumArray:
    def __init__(self, nums):
        self.nums = nums

    def update(self, index, val):
        self.nums[index] = val

    def sumRange(self, left, right):
        return sum(self.nums[left:right+1])
```

---

### ⚙️ Level 2: Prefix Sum Array (Rebuild on Update)

**Approach:**  
Maintain a prefix sum array that is rebuilt on each update.

```python
# Time Complexity: update O(n), sumRange O(1)
# Space Complexity: O(n)
class NumArray:
    def __init__(self, nums):
        self.nums = nums
        self.prefix = self.build_prefix(nums)

    def build_prefix(self, nums):
        prefix = [0] * (len(nums) + 1)
        for i in range(len(nums)):
            prefix[i+1] = prefix[i] + nums[i]
        return prefix

    def update(self, index, val):
        self.nums[index] = val
        self.prefix = self.build_prefix(self.nums)

    def sumRange(self, left, right):
        return self.prefix[right + 1] - self.prefix[left]
```

---

### 🚀 Level 3: Segment Tree for Efficient Updates and Queries

**Approach:**  
Use a segment tree to enable both updates and range queries in log time.

```python
# Time Complexity: update O(log n), sumRange O(log n)
# Space Complexity: O(n)
class SegmentTree:
    def __init__(self, nums):
        self.n = len(nums)
        self.tree = [0] * (2 * self.n)
        for i in range(self.n):
            self.tree[i + self.n] = nums[i]
        for i in range(self.n - 1, 0, -1):
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]

    def update(self, index, val):
        i = index + self.n
        self.tree[i] = val
        while i > 1:
            i //= 2
            self.tree[i] = self.tree[2 * i] + self.tree[2 * i + 1]

    def query(self, left, right):
        left += self.n
        right += self.n + 1
        res = 0
        while left < right:
            if left % 2 == 1:
                res += self.tree[left]
                left += 1
            if right % 2 == 1:
                right -= 1
                res += self.tree[right]
            left //= 2
            right //= 2
        return res

class NumArray:
    def __init__(self, nums):
        self.tree = SegmentTree(nums)

    def update(self, index, val):
        self.tree.update(index, val)

    def sumRange(self, left, right):
        return self.tree.query(left, right)
```

---

## 🔗 Similar Problems

1. [303. Range Sum Query - Immutable](https://leetcode.com/problems/range-sum-query-immutable/)
2. [308. Range Sum Query 2D - Mutable](https://leetcode.com/problems/range-sum-query-2d-mutable/)
3. [304. Range Sum Query 2D - Immutable](https://leetcode.com/problems/range-sum-query-2d-immutable/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                      | Time Complexity (update / sumRange) | Space Complexity |
|-------|-------------------------------|-------------------------------------|------------------|
| 1     | Brute Force                   | O(1) / O(n)                         | O(n)             |
| 2     | Prefix Sum (Rebuild on Update)| O(n) / O(1)                         | O(n)             |
| 3     | Segment Tree                  | O(log n) / O(log n)                 | O(n)             |

---

## 📌 Takeaway Points

- Segment trees are ideal for range queries with frequent updates.
- Prefix sums allow fast queries but are costly to update.
- Choose your approach based on the frequency of updates vs. queries.

---
