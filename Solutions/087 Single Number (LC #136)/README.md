
---

# ➕ Problem: Single Number

## 📘 Problem Statement

> Given a non-empty array of integers `nums`, every element appears twice except for one. Find that single one.  
> You must implement a solution with a linear runtime complexity and without using extra memory.

**LeetCode Link:** [136. Single Number](https://leetcode.com/problems/single-number/)

---

```
Example 1:

Input: nums = [2,2,1]
Output: 1

Example 2:

Input: nums = [4,1,2,1,2]
Output: 4

Example 3:

Input: nums = [1]
Output: 1

```

---

## ✅ Constraints

- `1 <= nums.length <= 3 * 10⁴`
- `-3 * 10⁴ <= nums[i] <= 3 * 10⁴`
- Each element in the array appears twice except for one element.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Using HashSet)

**Approach:**  
The brute-force approach uses a hash set to track all the seen elements. As we traverse the list, we check whether the element already exists in the set. If it does, we remove it; if it doesn't, we add it. By the end, the set will contain the single number.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def singleNumber(nums):
    seen = set()
    for num in nums:
        if num in seen:
            seen.remove(num)
        else:
            seen.add(num)
    return seen.pop()
```

---

### ⚙️ Level 2: XOR Approach (Optimal Solution)

**Approach:**  
We can leverage the properties of the XOR bitwise operator to solve this problem in linear time with constant space. XOR of two same numbers is 0, and XOR of any number with 0 is the number itself. By XORing all the elements in the array, the result will be the element that appears only once.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def singleNumber(nums):
    result = 0
    for num in nums:
        result ^= num
    return result
```

---

### 🚀 Level 3: Optimized XOR Approach (No Extra Variables)

**Approach:**  
This solution is essentially the same as the XOR approach but written with fewer variables for simplicity, maintaining the time complexity of **O(n)** and space complexity of **O(1)**.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def singleNumber(nums):
    return reduce(lambda x, y: x ^ y, nums)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                       | Time Complexity | Space Complexity |
|-------|--------------------------------|-----------------|------------------|
| 1     | Brute Force (HashSet)          | O(n)            | O(n)             |
| 2     | XOR Approach                   | O(n)            | O(1)             |
| 3     | Optimized XOR Approach         | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [137. Single Number II](https://leetcode.com/problems/single-number-ii/)
2. [260. Single Number III](https://leetcode.com/problems/single-number-iii/)
3. [318. Maximum Product of Word Lengths](https://leetcode.com/problems/maximum-product-of-word-lengths/)

---

## 📌 Takeaway Points

- The **brute-force approach** with a hash set works, but it is less efficient in terms of space complexity (**O(n)**).
- **XOR** is the optimal solution for this problem, providing both **O(n)** time complexity and **O(1)** space complexity.
- The XOR method is elegant and takes advantage of bitwise operations to solve the problem in a highly efficient manner.

---
