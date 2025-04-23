# 🌀 Problem: Find the Duplicate Number

## 📘 Problem Statement

> Given an array of integers `nums` containing `n + 1` integers where each integer is in the range `[1, n]` inclusive,  
> There is only one repeated number, return this duplicate number.  
> **You must not modify the array** and **use only constant extra space**.

**LeetCode Link:** [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/)

---

```

Example 1:

Input: nums = [1,3,4,2,2]
Output: 2
Example 2:

Input: nums = [3,1,3,4,2]
Output: 3
Example 3:

Input: nums = [3,3,3,3,3]
Output: 3

```

## ✅ Constraints

- `1 <= n <= 10⁵`
- `nums.length == n + 1`
- `1 <= nums[i] <= n`
- Only one repeated number, but it could be repeated more than once.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Nested Loops

**Approach:** Compare each element with every other element to find the duplicate.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def findDuplicate(nums):
    for i in range(len(nums)):
        for j in range(i + 1, len(nums)):
            if nums[i] == nums[j]:
                return nums[i]
```

---

### ⚙️ Level 2: HashSet for Seen Numbers

**Approach:** Use a set to track seen numbers. Return the first duplicate.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def findDuplicate(nums):
    seen = set()
    for num in nums:
        if num in seen:
            return num
        seen.add(num)
```

---

### 🚀 Level 3: Floyd’s Tortoise and Hare (Cycle Detection)

**Approach:** Treat the array as a linked list and use cycle detection to find the duplicate (cycle entry).

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def findDuplicate(nums):
    # Phase 1: Find the intersection point
    slow = fast = 0
    while True:
        slow = nums[slow]
        fast = nums[nums[fast]]
        if slow == fast:
            break

    # Phase 2: Find the entrance to the cycle
    slow = 0
    while slow != fast:
        slow = nums[slow]
        fast = nums[fast]
        
    return slow
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force                     | O(n²)           | O(1)             |
| 2     | HashSet                         | O(n)            | O(n)             |
| 3     | Floyd's Cycle Detection (Optimal)| O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [142. Linked List Cycle II](https://leetcode.com/problems/linked-list-cycle-ii/)
2. [Find the Duplicate in Unsorted Array](https://www.geeksforgeeks.org/find-duplicate-elements-array-size-n-1/)
3. [Find All Duplicates in an Array](https://leetcode.com/problems/find-all-duplicates-in-an-array/)

---

## 📌 Takeaway Points

- Floyd’s cycle detection is a powerful trick for problems involving arrays with references (like pointers).
- HashSet solution is straightforward but doesn’t meet the constant space requirement.
- Brute force is not acceptable in interviews unless explicitly allowed.

---
