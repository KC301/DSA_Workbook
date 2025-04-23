
---

# ➕ Problem: Insert Interval

## 📘 Problem Statement

> Given a set of non-overlapping intervals `intervals` sorted by their start time, insert a new interval into the intervals (merge if necessary).  
> You may assume that the intervals were initially sorted according to the start times.  
> Return the new intervals after the insertion.

**LeetCode Link:** [57. Insert Interval](https://leetcode.com/problems/insert-interval/)

---

```
Example 1:

Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]

Example 2:

Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]

Example 3:

Input: intervals = [], newInterval = [5,7]
Output: [[5,7]]

Example 4:

Input: intervals = [[1,5]], newInterval = [2,3]
Output: [[1,5]]
```

---

## ✅ Constraints

- `0 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= startᵢ <= endᵢ <= 10⁴`
- `intervals` is sorted by `startᵢ` in non-decreasing order.
- `newInterval.length == 2`
- `0 <= start ≤ end <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Merge with Insertion

**Approach:**  
Add the new interval and merge the intervals by comparing each pair.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def insert(intervals, newInterval):
    intervals.append(newInterval)
    intervals.sort(key=lambda x: x[0])
    
    result = []
    for interval in intervals:
        if result and result[-1][1] >= interval[0]:
            result[-1][1] = max(result[-1][1], interval[1])
        else:
            result.append(interval)
    return result
```

---

### ⚙️ Level 2: Efficient Merge by Traversing Once

**Approach:**  
Instead of sorting, directly find the correct position for the new interval and merge while iterating through the intervals.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def insert(intervals, newInterval):
    result = []
    i = 0

    while i < len(intervals) and intervals[i][1] < newInterval[0]:
        result.append(intervals[i])
        i += 1

    while i < len(intervals) and intervals[i][0] <= newInterval[1]:
        newInterval[0] = min(newInterval[0], intervals[i][0])
        newInterval[1] = max(newInterval[1], intervals[i][1])
        i += 1

    result.append(newInterval)

    while i < len(intervals):
        result.append(intervals[i])
        i += 1

    return result
```

---

### 🚀 Level 3: Optimized with In-Place Modifications

**Approach:**  
Use in-place modification of the input list without creating additional arrays (if allowed).

```python
# Time Complexity: O(n)
# Space Complexity: O(1) (in-place)
def insert(intervals, newInterval):
    i = 0
    n = len(intervals)
    
    while i < n and intervals[i][1] < newInterval[0]:
        i += 1

    while i < n and intervals[i][0] <= newInterval[1]:
        newInterval[0] = min(newInterval[0], intervals[i][0])
        newInterval[1] = max(newInterval[1], intervals[i][1])
        intervals.pop(i)
        n -= 1
    
    intervals.insert(i, newInterval)
    
    return intervals
```

---

## 🔗 Similar Problems

1. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
2. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)
3. [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)
4. [986. Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force Merge with Insertion  | O(n)            | O(n)             |
| 2     | Efficient Merge by Traversing Once| O(n)            | O(n)             |
| 3     | Optimized In-Place Merge          | O(n)            | O(1)             |

---

## 📌 Takeaway Points

- Merging intervals involves comparing start and end points.
- Sorting the intervals and using a simple merging technique can lead to an efficient solution.
- In-place solutions optimize for space but can be harder to implement.

---
