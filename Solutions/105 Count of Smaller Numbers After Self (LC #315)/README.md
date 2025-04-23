
---

# ➕ Problem: Count of Smaller Numbers After Self

## 📘 Problem Statement

> Given an integer array `nums`, return an array `answer` such that `answer[i]` is the number of smaller elements to the right of `nums[i]`.

**LeetCode Link:** [315. Count of Smaller Numbers After Self](https://leetcode.com/problems/count-of-smaller-numbers-after-self/)

---

```
Example 1:
Input: nums = [5,2,6,1]
Output: [2,1,1,0]
Explanation: 
To the right of 5 there are 2 smaller elements (2 and 1).
To the right of 2 there is 1 smaller element (1).
To the right of 6 there is 1 smaller element (1).
To the right of 1 there is 0 smaller element.
```

---

## ✅ Constraints

- `1 <= nums.length <= 10⁵`
- `-10⁹ <= nums[i] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach

**Approach:**  
Use a nested loop to count the smaller numbers for each element in the array.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def countSmaller(nums):
    n = len(nums)
    result = []
    for i in range(n):
        count = 0
        for j in range(i + 1, n):
            if nums[j] < nums[i]:
                count += 1
        result.append(count)
    return result
```

---

### ⚙️ Level 2: Binary Search with Sorted List

**Approach:**  
Maintain a sorted list of elements that have been processed so far. Use binary search to find how many numbers are smaller than the current number.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
import bisect

def countSmaller(nums):
    result = []
    sorted_list = []
    for num in reversed(nums):
        idx = bisect.bisect_left(sorted_list, num)
        result.append(idx)
        bisect.insort_left(sorted_list, num)
    return result[::-1]
```

---

### 🚀 Level 3: Binary Indexed Tree (Fenwick Tree)

**Approach:**  
Use a Binary Indexed Tree (BIT) to efficiently count the number of smaller numbers after each element by updating and querying the counts.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
class FenwickTree:
    def __init__(self, n):
        self.n = n
        self.tree = [0] * (n + 1)
        
    def update(self, idx, val):
        while idx <= self.n:
            self.tree[idx] += val
            idx += idx & -idx
    
    def query(self, idx):
        count = 0
        while idx > 0:
            count += self.tree[idx]
            idx -= idx & -idx
        return count

def countSmaller(nums):
    offset = 10**4  # to handle negative numbers
    max_val = 2 * 10**4 + 1  # range of the BIT
    fenwick_tree = FenwickTree(max_val)
    result = []
    
    for num in reversed(nums):
        # Get the number of elements smaller than the current number
        result.append(fenwick_tree.query(num + offset - 1))
        # Update the BIT with the current number
        fenwick_tree.update(num + offset, 1)
    
    return result[::-1]
```

---

## 🔗 Similar Problems

1. [493. Reverse Pairs](https://leetcode.com/problems/reverse-pairs/)
2. [327. Count of Range Sum](https://leetcode.com/problems/count-of-range-sum/)
3. [775. Global and Local Inversions](https://leetcode.com/problems/global-and-local-inversions/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force                       | O(n^2)          | O(n)             |
| 2     | Binary Search with Sorted List    | O(n log n)      | O(n)             |
| 3     | Binary Indexed Tree (Fenwick Tree)| O(n log n)      | O(n)             |

---

## 📌 Takeaway Points

- The brute force solution is simple but inefficient for large inputs (O(n²)).
- Binary Search with a sorted list reduces the complexity significantly, but still uses a sorted list for each iteration.
- Fenwick Tree (Binary Indexed Tree) is ideal for this problem when performance is critical, offering O(log n) time complexity for both updates and queries.

---
