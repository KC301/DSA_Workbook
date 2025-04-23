
---

# ➕ Problem: Next Greater Element I

## 📘 Problem Statement

> The **Next Greater Element** of some element `x` in an array is the first greater element that is to the right of `x` in the same array.  
> You are given two **distinct** integer arrays `nums1` and `nums2`, where `nums1` is a subset of `nums2`.  
> For each `num` in `nums1`, find the next greater element of that number in `nums2`.  
> If it does not exist, return `-1` for that number.

**LeetCode Link:** [496. Next Greater Element I](https://leetcode.com/problems/next-greater-element-i/)

---

```
Example 1:

Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]

Example 2:

Input: nums1 = [2,4], nums2 = [1,2,3,4]
Output: [3,-1]
```

---

## ✅ Constraints

- `1 <= nums1.length <= nums2.length <= 1000`
- `0 <= nums1[i], nums2[i] <= 10⁴`
- All integers in `nums1` and `nums2` are **unique**
- All the integers of `nums1` are in `nums2`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force

**Approach:**  
For each element in `nums1`, search for its index in `nums2` and linearly scan to the right to find the next greater element.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(1)
def nextGreaterElement(nums1, nums2):
    result = []
    for num in nums1:
        found = False
        for i in range(len(nums2)):
            if nums2[i] == num:
                for j in range(i+1, len(nums2)):
                    if nums2[j] > num:
                        result.append(nums2[j])
                        found = True
                        break
                if not found:
                    result.append(-1)
                break
    return result
```

---

### ⚙️ Level 2: Preprocessing with Hash Map

**Approach:**  
For each `nums1[i]`, store its index from `nums2` in a hash map, and then use linear scan from that index in `nums2`.

```python
# Time Complexity: O(m + n)
# Space Complexity: O(n)
def nextGreaterElement(nums1, nums2):
    idx_map = {num: i for i, num in enumerate(nums2)}
    result = []
    for num in nums1:
        i = idx_map[num]
        for j in range(i + 1, len(nums2)):
            if nums2[j] > num:
                result.append(nums2[j])
                break
        else:
            result.append(-1)
    return result
```

---

### 🚀 Level 3: Monotonic Stack + Hash Map

**Approach:**  
Use a stack to preprocess all "next greater elements" for `nums2`, and store in a map for `O(1)` lookup from `nums1`.

```python
# Time Complexity: O(n + m)
# Space Complexity: O(n)
def nextGreaterElement(nums1, nums2):
    stack = []
    next_greater = {}
    
    for num in nums2:
        while stack and num > stack[-1]:
            next_greater[stack.pop()] = num
        stack.append(num)

    return [next_greater.get(num, -1) for num in nums1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity | Space Complexity |
|-------|-------------------------------------|-----------------|------------------|
| 1     | Brute Force                         | O(m × n)        | O(1)             |
| 2     | Hash Map + Linear Scan              | O(m + n)        | O(n)             |
| 3     | Monotonic Stack + Hash Map          | O(m + n)        | O(n)             |

---

## 🔗 Similar Problems

1. [739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)
2. [503. Next Greater Element II](https://leetcode.com/problems/next-greater-element-ii/)
3. [316. Remove Duplicate Letters](https://leetcode.com/problems/remove-duplicate-letters/)

---

## 📌 Takeaway Points

- Monotonic stack is ideal for next-greater-style problems.
- Brute force is simple but not scalable.
- Preprocessing `nums2` with a stack allows fast lookup for any subset (`nums1`).

---

---

# ➕ Problem: Next Greater Element II

## 📘 Problem Statement

> Given a **circular** array `nums` (i.e., the next element of `nums[nums.length - 1]` is `nums[0]`), return the **next greater number** for every element in `nums`.  
> The **next greater number** of a number `x` is the first greater number to its traversing-order next in the array, which means you may need to **wrap around** to search.  
> If it doesn't exist, output `-1` for this number.

**LeetCode Link:** [503. Next Greater Element II](https://leetcode.com/problems/next-greater-element-ii/)

---

```
Example 1:

Input: nums = [1,2,1]
Output: [2,-1,2]

Example 2:

Input: nums = [1,2,3,4,3]
Output: [2,3,4,-1,4]
```

---

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁹ <= nums[i] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Double Loop)

**Approach:**  
For each index, loop forward in circular fashion to find the next greater element.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def nextGreaterElements(nums):
    n = len(nums)
    res = [-1] * n
    for i in range(n):
        for j in range(1, n):
            if nums[(i + j) % n] > nums[i]:
                res[i] = nums[(i + j) % n]
                break
    return res
```

---

### ⚙️ Level 2: Simulated Circular Stack (Two Pass)

**Approach:**  
Loop through the array twice to simulate circular behavior and use a stack to track next greater elements.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def nextGreaterElements(nums):
    n = len(nums)
    res = [-1] * n
    stack = []

    for i in range(2 * n - 1, -1, -1):
        while stack and stack[-1] <= nums[i % n]:
            stack.pop()
        if i < n:
            res[i] = stack[-1] if stack else -1
        stack.append(nums[i % n])
    
    return res
```

---

### 🚀 Level 3: Optimized Monotonic Stack with Modulo Access

**Approach:**  
Same as Level 2 but with cleaner and more concise logic using modular indexing and early exits.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def nextGreaterElements(nums):
    n = len(nums)
    res = [-1] * n
    stack = []

    for i in range(2 * n):
        while stack and nums[i % n] > nums[stack[-1]]:
            res[stack.pop()] = nums[i % n]
        if i < n:
            stack.append(i)
    
    return res
```

---

## 🔗 Similar Problems

1. [496. Next Greater Element I](https://leetcode.com/problems/next-greater-element-i/)
2. [739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures/)
3. [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                 | Time Complexity | Space Complexity |
|-------|------------------------------------------|-----------------|------------------|
| 1     | Brute Force                              | O(n²)           | O(n)             |
| 2     | Two-Pass Circular Stack                  | O(n)            | O(n)             |
| 3     | Optimized Monotonic Stack with Modulo    | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- Monotonic stacks are powerful for "next greater" problems, especially with circular arrays.
- Circular logic can be simulated by iterating the array twice.
- Brute force is intuitive but not scalable beyond small inputs.

---
