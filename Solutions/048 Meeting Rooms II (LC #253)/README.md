
---

# ➕ Problem: Meeting Rooms II

## 📘 Problem Statement

> Given an array of meeting time intervals `intervals` where `intervals[i] = [startᵢ, endᵢ]`, determine the minimum number of meeting rooms required to hold all the meetings.  
> Meetings can be held in the same room if they don’t overlap, and the room can be reused after the meeting ends.

**LeetCode Link:** [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

---

```
Example 1:

Input: intervals = [[0,30],[5,10],[15,20]]
Output: 2
Explanation: We need at least 2 meeting rooms to hold all meetings. The first and second meetings overlap, and the second and third also overlap.

Example 2:

Input: intervals = [[7,10],[2,4]]
Output: 1
Explanation: We only need one meeting room for both meetings since they don’t overlap.
```

---

## ✅ Constraints

- `1 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= startᵢ < endᵢ <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Simulate Meeting Room Allocation)

**Approach:**  
Sort the intervals by start time, and for each meeting, check how many rooms are needed by iterating over all other meetings.

```python
# Time Complexity: O(n²)
# Space Complexity: O(1)
def minMeetingRooms(intervals):
    intervals.sort(key=lambda x: x[0])
    rooms = []

    for interval in intervals:
        allocated = False
        for i in range(len(rooms)):
            if rooms[i] <= interval[0]:
                rooms[i] = interval[1]
                allocated = True
                break
        if not allocated:
            rooms.append(interval[1])
    
    return len(rooms)
```

---

### ⚙️ Level 2: Priority Queue (Min-Heap)

**Approach:**  
Use a priority queue (min-heap) to always keep track of the end times of the meetings that are currently being held in the rooms.

```python
import heapq

# Time Complexity: O(n log n)
# Space Complexity: O(n)
def minMeetingRooms(intervals):
    if not intervals:
        return 0
    
    intervals.sort(key=lambda x: x[0])  # Sort intervals by start time
    free_rooms = []

    heapq.heappush(free_rooms, intervals[0][1])  # Add the first meeting's end time

    for i in intervals[1:]:
        # If the room with the earliest end time is free, reuse it
        if free_rooms[0] <= i[0]:
            heapq.heappop(free_rooms)

        heapq.heappush(free_rooms, i[1])  # Add the new meeting's end time to the heap

    return len(free_rooms)
```

---

### 🚀 Level 3: Optimized with Early Exit

**Approach:**  
Same as Level 2, but with an early exit if the number of rooms exceeds the optimal value.

```python
import heapq

# Time Complexity: O(n log n)
# Space Complexity: O(n)
def minMeetingRooms(intervals):
    if not intervals:
        return 0
    
    intervals.sort(key=lambda x: x[0])  # Sort intervals by start time
    free_rooms = []

    heapq.heappush(free_rooms, intervals[0][1])  # Add the first meeting's end time

    for i in intervals[1:]:
        # If the room with the earliest end time is free, reuse it
        if free_rooms[0] <= i[0]:
            heapq.heappop(free_rooms)

        heapq.heappush(free_rooms, i[1])  # Add the new meeting's end time to the heap

    return len(free_rooms)
```

---

## 🔗 Similar Problems

1. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)
2. [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)
3. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
4. [986. Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force (Simulate Allocation) | O(n²)           | O(1)             |
| 2     | Priority Queue (Min-Heap)         | O(n log n)      | O(n)             |
| 3     | Optimized with Early Exit         | O(n log n)      | O(n)             |

---

## 📌 Takeaway Points

- A min-heap allows for efficient tracking of the rooms' availability.
- Sorting the intervals is a crucial step in any interval-based problem.
- The priority queue minimizes the number of rooms used and helps with efficient allocation.

---

