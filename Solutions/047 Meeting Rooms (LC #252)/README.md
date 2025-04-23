
---

# ➕ Problem: Meeting Rooms

## 📘 Problem Statement

> Given an array of meeting time intervals `intervals` where `intervals[i] = [startᵢ, endᵢ]`, determine if a person could attend all meetings.  
> We assume that the meeting rooms are unlimited.

**LeetCode Link:** [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

---

```
Example 1:

Input: intervals = [[0,30],[5,10],[15,20]]
Output: false
Explanation: The first and second meetings overlap.

Example 2:

Input: intervals = [[7,10],[2,4]]
Output: true
Explanation: The meetings do not overlap.
```

---

## ✅ Constraints

- `0 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= startᵢ < endᵢ <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Pairwise Comparison

**Approach:**  
Compare each pair of intervals to check for overlaps.

```python
# Time Complexity: O(n²)
# Space Complexity: O(1)
def canAttendMeetings(intervals):
    for i in range(len(intervals)):
        for j in range(i + 1, len(intervals)):
            if intervals[i][1] > intervals[j][0] and intervals[i][0] < intervals[j][1]:
                return False
    return True
```

---

### ⚙️ Level 2: Sorting with Greedy Check

**Approach:**  
Sort the intervals by their start times and check if any two consecutive intervals overlap.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(1)
def canAttendMeetings(intervals):
    intervals.sort(key=lambda x: x[0])
    
    for i in range(1, len(intervals)):
        if intervals[i][0] < intervals[i - 1][1]:
            return False
    return True
```

---

### 🚀 Level 3: Optimized Greedy Approach

**Approach:**  
Same as Level 2 but more optimized in terms of clarity and performance.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(1)
def canAttendMeetings(intervals):
    intervals.sort(key=lambda x: x[0])
    
    for i in range(1, len(intervals)):
        if intervals[i][0] < intervals[i - 1][1]:
            return False
    return True
```

---

## 🔗 Similar Problems

1. [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)
2. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
3. [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force Pairwise Comparison   | O(n²)           | O(1)             |
| 2     | Sorting with Greedy Check         | O(n log n)      | O(1)             |
| 3     | Optimized Greedy Approach         | O(n log n)      | O(1)             |

---

## 📌 Takeaway Points

- Sorting is a common approach to handle interval-related problems.
- Greedy algorithms are useful when making local optimal choices (no overlap in this case).
- Time complexity can often be reduced by sorting first and then making a single pass.

---
