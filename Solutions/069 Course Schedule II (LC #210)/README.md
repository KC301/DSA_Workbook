
---

# ➕ Problem: Course Schedule II

## 📘 Problem Statement

> There are a total of `n` courses you have to take, labeled from `0` to `n - 1`.  
> You are given an array `prerequisites` of length `m` where `prerequisites[i] = [ai, bi]` indicates that you must take course `bi` before course `ai`.  
> Return the ordering of courses you should take to finish all courses. If there are many valid answers, return **any** of them. If it is impossible to finish all courses, return an empty array.

**LeetCode Link:** [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)

---

```
Example 1:

Input: numCourses = 4, prerequisites = [[2,0],[3,1],[2,1],[3,2]]
Output: [0,1,2,3]
Explanation: There are a total of 4 courses to take. To take course 2, you should have finished courses 0 and 1. 
To take course 3, you should have finished courses 1 and 2. So the correct course order is [0,1,2,3].

Example 2:

Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: []
Explanation: There are a total of 2 courses to take. To take course 1, you should have finished course 0. 
However, to take course 0, you should have finished course 1. So it is impossible.

```

---

## ✅ Constraints

- `1 <= numCourses <= 2000`
- `0 <= prerequisites.length <= 5000`
- `prerequisites[i].length == 2`
- `0 <= prerequisites[i][0], prerequisites[i][1] < numCourses`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: DFS with Recursion (Detect Cycle and Topological Sort)

**Approach:**  
We can use **DFS** to detect cycles and perform topological sorting. If a cycle is detected, it’s impossible to complete the courses. Otherwise, the result will be a valid course order.

```python
# Time Complexity: O(V + E) 
# Space Complexity: O(V + E) for the recursion stack
def findOrder(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    for dest, src in prerequisites:
        graph[src].append(dest)
    
    visited = [0] * numCourses  # 0 = unvisited, 1 = visiting, 2 = visited
    result = []
    
    def dfs(course):
        if visited[course] == 1:
            return False  # cycle detected
        if visited[course] == 2:
            return True  # already processed
        
        visited[course] = 1
        for neighbor in graph[course]:
            if not dfs(neighbor):
                return False
        
        visited[course] = 2
        result.append(course)
        return True
    
    for course in range(numCourses):
        if visited[course] == 0:
            if not dfs(course):
                return []
    
    return result[::-1]  # Reverse the result to get correct topological order
```

---

### ⚙️ Level 2: Topological Sort using Kahn's Algorithm (BFS)

**Approach:**  
We can use **Kahn’s Algorithm** (Topological Sort with BFS). We track the in-degrees of each course and add courses with zero in-degree to the queue. As we process a course, we decrease the in-degree of its neighbors.

```python
# Time Complexity: O(V + E)
# Space Complexity: O(V + E) for graph and queue
from collections import deque, defaultdict

def findOrder(numCourses, prerequisites):
    graph = defaultdict(list)
    in_degree = [0] * numCourses
    
    # Build the graph and calculate in-degrees
    for dest, src in prerequisites:
        graph[src].append(dest)
        in_degree[dest] += 1
    
    # Start with courses having no prerequisites (in-degree 0)
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    order = []

    while queue:
        course = queue.popleft()
        order.append(course)
        
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
    
    return order if len(order) == numCourses else []
```

---

### 🚀 Level 3: Optimized BFS with Early Termination and Detailed Tracking

**Approach:**  
This approach optimizes the BFS algorithm by carefully managing in-degrees and using early termination once all courses are processed.

```python
# Time Complexity: O(V + E)
# Space Complexity: O(V + E) for graph and queue
from collections import deque, defaultdict

def findOrder(numCourses, prerequisites):
    graph = defaultdict(list)
    in_degree = [0] * numCourses
    
    # Build graph and compute in-degree for each course
    for dest, src in prerequisites:
        graph[src].append(dest)
        in_degree[dest] += 1
    
    # Initialize queue with courses that have no prerequisites
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    order = []
    
    while queue:
        course = queue.popleft()
        order.append(course)
        
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
        
        # Early termination: If all courses are processed, return early
        if len(order) == numCourses:
            return order
    
    return []  # Return empty list if not all courses could be processed
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | DFS (Recursion with Cycle Detection) | O(V + E)        | O(V + E)         |
| 2     | Topological Sort (Kahn's Algorithm)  | O(V + E)        | O(V + E)         |
| 3     | Optimized BFS with Early Termination | O(V + E)        | O(V + E)         |

---

## 🔗 Similar Problems

1. [207. Course Schedule](https://leetcode.com/problems/course-schedule/)
2. [269. Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)
3. [785. Is Graph Bipartite?](https://leetcode.com/problems/is-graph-bipartite/)

---

## 📌 Takeaway Points

- **Topological sorting** is essential when dealing with dependency problems, such as course prerequisites or task scheduling.
- Both **DFS** and **BFS** are useful for cycle detection and ordering; DFS uses recursion, while BFS uses a queue.
- **Kahn’s Algorithm** (BFS) ensures a clear and efficient way to check for cycles and generate an ordering.

---
