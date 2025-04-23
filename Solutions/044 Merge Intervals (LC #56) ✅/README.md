
---

# ➕ Problem: Merge Intervals

## 📘 Problem Statement

> Given an array of `intervals` where `intervals[i] = [startᵢ, endᵢ]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

**LeetCode Link:** [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

---

```
Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]

Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
```

---

## ✅ Constraints

- `1 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= startᵢ <= endᵢ <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Compare All Pairs (Brute Force)

**Approach:**  
Check each pair of intervals and merge if overlapping. Repeat until no changes occur.

```python
# Time Complexity: O(n²)
# Space Complexity: O(n)
def merge(intervals):
    merged = []
    intervals.sort(key=lambda x: x[0])

    while intervals:
        curr = intervals.pop(0)
        i = 0
        while i < len(intervals):
            if not (curr[1] < intervals[i][0] or curr[0] > intervals[i][1]):
                curr = [min(curr[0], intervals[i][0]), max(curr[1], intervals[i][1])]
                intervals.pop(i)
            else:
                i += 1
        merged.append(curr)
    return merged
```

---

### ⚙️ Level 2: Sort and Merge In-Place

**Approach:**  
Sort intervals by start, then merge them as you go.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def merge(intervals):
    intervals.sort(key=lambda x: x[0])
    merged = []

    for interval in intervals:
        if not merged or merged[-1][1] < interval[0]:
            merged.append(interval)
        else:
            merged[-1][1] = max(merged[-1][1], interval[1])
    
    return merged
```

---

### 🚀 Level 3: Optimized In-Place Merge with Preallocation

**Approach:**  
Use the same logic as Level 2 but optimize by modifying the original list if allowed.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(1) if modifying in-place (O(n) if returning new list)
def merge(intervals):
    intervals.sort(key=lambda x: x[0])
    index = 0

    for i in range(1, len(intervals)):
        if intervals[index][1] >= intervals[i][0]:
            intervals[index][1] = max(intervals[index][1], intervals[i][1])
        else:
            index += 1
            intervals[index] = intervals[i]

    return intervals[:index + 1]
```

---

## 🔗 Similar Problems

1. [57. Insert Interval](https://leetcode.com/problems/insert-interval/)
2. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)
3. [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)
4. [986. Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force Pairwise Merge        | O(n²)           | O(n)             |
| 2     | Sort and Merge                    | O(n log n)      | O(n)             |
| 3     | Optimized In-Place Merge          | O(n log n)      | O(1) / O(n)      |

---

## 📌 Takeaway Points

- Sorting by start time simplifies interval merging significantly.
- Efficient merging requires only a single pass post-sort.
- In-place techniques can save space in production environments where memory matters.

---
