
---

# ➕ Problem: Task Scheduler

## 📘 Problem Statement

> Given a characters array `tasks`, representing the tasks a CPU needs to do, where each letter represents a different task.  
> The CPU can complete the tasks in any order, but it must follow the constraint that two same tasks cannot be executed consecutively.  
> The CPU has a cooldown period of `n` units after completing a task before it can execute the same task again.  
> Return the least number of units of time that the CPU will take to finish all the given tasks, considering the cooldown period.

**LeetCode Link:** [621. Task Scheduler](https://leetcode.com/problems/task-scheduler/)

---

```
Example 1:

Input: tasks = ["A","A","A","B","B","B"], n = 2
Output: 8
Explanation: A -> B -> A -> B -> A -> B. The cooling period is 2 between any two same tasks.

Example 2:

Input: tasks = ["A","A","A","B","B","B"], n = 0
Output: 6
Explanation: No cooldown period, all tasks can be completed sequentially.

```

---

## ✅ Constraints

- `1 <= tasks.length <= 10⁴`
- `0 <= n <= 100`
- `tasks[i] is upper-case English letter`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Naive Simulation)

**Approach:**  
In the brute-force approach, we simulate each task being scheduled and attempt to handle the cooldown period. For each task, we check if the previous task is the same, and if so, we insert the cooldown period. This is inefficient because it doesn't optimize the task scheduling and directly handles each task in a greedy manner.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
from collections import Counter

def leastInterval(tasks, n):
    task_count = Counter(tasks)
    sorted_tasks = sorted(task_count.values(), reverse=True)
    
    time = 0
    while sorted_tasks:
        temp = []
        for i in range(n + 1):
            if sorted_tasks:
                task = sorted_tasks.pop(0) - 1
                if task > 0:
                    temp.append(task)
            time += 1
        sorted_tasks.extend(temp)
        sorted_tasks.sort(reverse=True)
    
    return time
```

---

### ⚙️ Level 2: Greedy Approach with Priority Queue

**Approach:**  
This approach uses a priority queue (max heap) to always execute the task that occurs the most frequently. After completing a task, it is placed in a cooldown queue, which ensures that the same task isn't executed consecutively. Once the cooldown period is over, the task is added back to the heap.

```python
# Time Complexity: O(n log k) where k is the number of unique tasks
# Space Complexity: O(k) where k is the number of unique tasks
import heapq
from collections import Counter

def leastInterval(tasks, n):
    task_count = Counter(tasks)
    max_heap = [-count for count in task_count.values()]
    heapq.heapify(max_heap)
    
    time = 0
    queue = []
    
    while max_heap or queue:
        time += 1
        
        if max_heap:
            task = heapq.heappop(max_heap) + 1
            if task != 0:
                queue.append((task, time + n))
        
        if queue and queue[0][1] == time:
            heapq.heappush(max_heap, queue.pop(0)[0])
    
    return time
```

---

### 🚀 Level 3: Optimized Greedy with Frequency Counting

**Approach:**  
The optimized greedy approach calculates the number of times the most frequent task occurs, and from there, estimates the total time. By leveraging the frequency of the tasks, we minimize idle time, which leads to a highly efficient solution with **O(n)** time complexity and **O(1)** space complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
from collections import Counter

def leastInterval(tasks, n):
    task_count = Counter(tasks)
    max_count = max(task_count.values())
    max_count_tasks = sum(1 for count in task_count.values() if count == max_count)
    
    # Formula to calculate minimum time
    part_count = max_count - 1
    part_length = n - (max_count_tasks - 1)
    empty_slots = part_count * part_length
    available_tasks = len(tasks) - max_count * max_count_tasks
    
    idle_time = max(0, empty_slots - available_tasks)
    
    return len(tasks) + idle_time
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                    | Time Complexity   | Space Complexity   |
|-------|---------------------------------------------|-------------------|--------------------|
| 1     | Brute Force (Naive Simulation)              | O(n^2)            | O(n)               |
| 2     | Greedy Approach with Priority Queue         | O(n log k)        | O(k)               |
| 3     | Optimized Greedy with Frequency Counting    | O(n)              | O(1)               |

---

## 🔗 Similar Problems

1. [621. Task Scheduler II](https://leetcode.com/problems/task-scheduler-ii/)
2. [455. Assign Cookies](https://leetcode.com/problems/assign-cookies/)
3. [621. Task Scheduler III](https://leetcode.com/problems/task-scheduler-iii/)

---

## 📌 Takeaway Points

- **Brute force** approach is inefficient, especially for large inputs, with **O(n^2)** time complexity.
- **Greedy approach with priority queue** optimizes the scheduling by using a heap, improving time complexity to **O(n log k)**.
- **Optimized greedy approach** leverages the task frequencies, reducing time complexity to **O(n)** and space complexity to **O(1)**.

---
