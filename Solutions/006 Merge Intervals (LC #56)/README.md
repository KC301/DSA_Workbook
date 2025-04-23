# 🧩 Problem: Merge Intervals

## 📘 Problem Statement

> Given an array of intervals where `intervals[i] = [start_i, end_i]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

**LeetCode Link:** [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

---

```

Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.

```


## ✅ Constraints

- `1 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= start_i <= end_i <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with Nested Loops

**Approach:** Check all pairs and merge overlapping intervals manually by comparing each one with every other.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def merge(intervals):
    merged = []
    used = [False] * len(intervals)
    
    for i in range(len(intervals)):
        if used[i]:
            continue
        a, b = intervals[i]
        for j in range(i+1, len(intervals)):
            if used[j]:
                continue
            c, d = intervals[j]
            if b >= c and d >= a:  # overlap
                a = min(a, c)
                b = max(b, d)
                used[j] = True
        merged.append([a, b])
    
    return merged
```

---

### ⚙️ Level 2: Sort + Merge Pass

**Approach:** Sort intervals by start time, then merge overlapping intervals in a single pass.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def merge(intervals):
    intervals.sort(key=lambda x: x[0])
    merged = [intervals[0]]
    
    for current in intervals[1:]:
        last = merged[-1]
        if current[0] <= last[1]:
            last[1] = max(last[1], current[1])
        else:
            merged.append(current)
    
    return merged
```

---

### 🚀 Level 3: In-place Optimized Merge

**Approach:** Same sorting strategy as Level 2, but with in-place merging to minimize space usage.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(1) (ignoring input sort space)
def merge(intervals):
    intervals.sort(key=lambda x: x[0])
    idx = 0
    
    for i in range(1, len(intervals)):
        if intervals[i][0] <= intervals[idx][1]:
            intervals[idx][1] = max(intervals[idx][1], intervals[i][1])
        else:
            idx += 1
            intervals[idx] = intervals[i]
    
    return intervals[:idx+1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                 | Time Complexity | Space Complexity |
|-------|--------------------------|-----------------|------------------|
| 1     | Brute Force              | O(n²)           | O(n)             |
| 2     | Sort + Merge             | O(n log n)      | O(n)             |
| 3     | In-place Optimized Merge| O(n log n)      | O(1)*            |

> *Level 3 uses constant extra space for merging, though sorting still uses O(log n) stack space internally.

---

## 🔗 Similar Problems

1. [57. Insert Interval](https://leetcode.com/problems/insert-interval/)
2. [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)
3. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

---

## 📌 Takeaway Points

- Sorting intervals by start time simplifies the merging logic significantly.
- Overlapping intervals always appear consecutively after sorting.
- In-place merging can reduce memory footprint without affecting logic complexity.

---
