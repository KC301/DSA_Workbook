# ➕ Problem: Insert Interval

## 📘 Problem Statement

> You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return intervals after the insertion.

Note that you don't need to modify intervals in-place. You can make a new array and return it.

**LeetCode Link:** [57. Insert Interval](https://leetcode.com/problems/insert-interval/)

---

```

Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].

```

## ✅ Constraints

- `0 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= start_i <= end_i <= 10⁴`
- `intervals` is sorted by `start_i` and does not overlap
- `0 <= newInterval[0] <= newInterval[1] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Insert then Full Merge)

**Approach:** Insert the new interval, sort the list, and merge as in the basic Merge Intervals problem.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def insert(intervals, newInterval):
    intervals.append(newInterval)
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

### ⚙️ Level 2: Linear Scan with Merge

**Approach:** Traverse the sorted list once and merge `newInterval` only when overlapping.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def insert(intervals, newInterval):
    result = []
    i = 0
    n = len(intervals)
    
    # Add all intervals before newInterval
    while i < n and intervals[i][1] < newInterval[0]:
        result.append(intervals[i])
        i += 1
    
    # Merge overlapping intervals with newInterval
    while i < n and intervals[i][0] <= newInterval[1]:
        newInterval[0] = min(newInterval[0], intervals[i][0])
        newInterval[1] = max(newInterval[1], intervals[i][1])
        i += 1
    result.append(newInterval)
    
    # Add the rest
    while i < n:
        result.append(intervals[i])
        i += 1
    
    return result
```

---

### 🚀 Level 3: Optimized with In-place Merge

**Approach:** Modify input list in-place by tracking index positions and overwriting.

```python
# Time Complexity: O(n)
# Space Complexity: O(1) (output not counted)
def insert(intervals, newInterval):
    i = 0
    while i < len(intervals) and intervals[i][1] < newInterval[0]:
        i += 1
    
    start = i
    while i < len(intervals) and intervals[i][0] <= newInterval[1]:
        newInterval[0] = min(newInterval[0], intervals[i][0])
        newInterval[1] = max(newInterval[1], intervals[i][1])
        i += 1
    
    return intervals[:start] + [newInterval] + intervals[i:]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                 | Time Complexity | Space Complexity |
|-------|--------------------------|-----------------|------------------|
| 1     | Insert + Full Merge      | O(n log n)      | O(n)             |
| 2     | Linear Merge             | O(n)            | O(n)             |
| 3     | In-place Optimized Merge| O(n)            | O(1)*            |

> *Space is constant excluding the result list.

---

## 🔗 Similar Problems

1. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
2. [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)
3. [452. Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)

---

## 📌 Takeaway Points

- Leverage the sorted nature of input to avoid full sorting.
- Efficient merging can be done by linear scan and smart comparisons.
- Always consider whether the problem allows in-place modifications to reduce space.

---
