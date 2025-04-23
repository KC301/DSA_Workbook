
---

# ➕ Problem: Course Schedule

## 📘 Problem Statement

> There are `n` courses you have to take, labeled from `0` to `n - 1`. Some courses have prerequisites, meaning you must take a given course before another one.  
> Given the total number of courses and a list of prerequisite pairs, return `true` if you can finish all courses. Otherwise, return `false`.

**LeetCode Link:** [207. Course Schedule](https://leetcode.com/problems/course-schedule/)

---

```
Example 1:

Input: numCourses = 2, prerequisites = [[1,0]]
Output: true
Explanation: There are a total of 2 courses to take. To take course 1, you should have finished course 0. So it is possible.

Example 2:

Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Output: false
Explanation: There are a total of 2 courses to take. To take course 1, you should have finished course 0. However, to take course 0, you should have finished course 1. So it is impossible.

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

### 🧪 Level 1: DFS with Recursion - Basic Approach

**Approach:**  
We can use **DFS** to detect a cycle in the course prerequisites graph. If there is a cycle, it means there is a circular dependency, and it is impossible to finish all courses.

```python
# Time Complexity: O(V + E) 
# Space Complexity: O(V + E) for the recursion stack
def canFinish(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    for dest, src in prerequisites:
        graph[src].append(dest)
    
    visited = [0] * numCourses  # 0 = unvisited, 1 = visiting, 2 = visited
    
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
        return True

    for course in range(numCourses):
        if visited[course] == 0:
            if not dfs(course):
                return False
    return True
```

---

### ⚙️ Level 2: Topological Sort (Kahn's Algorithm)

**Approach:**  
We use **Kahn's Algorithm** for topological sorting to detect a cycle. If there’s a cycle, it’s impossible to finish all courses. Otherwise, we can complete all courses.

```python
# Time Complexity: O(V + E)
# Space Complexity: O(V + E) for graph storage and queue
from collections import deque, defaultdict

def canFinish(numCourses, prerequisites):
    graph = defaultdict(list)
    in_degree = [0] * numCourses
    
    # Build the graph and calculate the in-degree of each course
    for dest, src in prerequisites:
        graph[src].append(dest)
        in_degree[dest] += 1
    
    # Start with courses that have no prerequisites (in-degree of 0)
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    courses_taken = 0

    while queue:
        course = queue.popleft()
        courses_taken += 1
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
    
    return courses_taken == numCourses
```

---

### 🚀 Level 3: Optimized BFS with Early Termination

**Approach:**  
This approach uses BFS to traverse the graph, and we terminate early once all courses have been processed (i.e., no more prerequisites remain).

```python
# Time Complexity: O(V + E)
# Space Complexity: O(V + E) for graph and queue
from collections import deque, defaultdict

def canFinish(numCourses, prerequisites):
    graph = defaultdict(list)
    in_degree = [0] * numCourses
    
    for dest, src in prerequisites:
        graph[src].append(dest)
        in_degree[dest] += 1
    
    # Initialize the queue with courses having no prerequisites
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    courses_taken = 0

    while queue:
        course = queue.popleft()
        courses_taken += 1
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
        
        # Early exit: If we have processed all courses, return True
        if courses_taken == numCourses:
            return True
    
    return courses_taken == numCourses
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | DFS (Recursion)                     | O(V + E)        | O(V + E)         |
| 2     | Topological Sort (Kahn's Algorithm)  | O(V + E)        | O(V + E)         |
| 3     | Optimized BFS (Early Termination)    | O(V + E)        | O(V + E)         |

---

## 🔗 Similar Problems

1. [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)
2. [269. Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)
3. [785. Is Graph Bipartite?](https://leetcode.com/problems/is-graph-bipartite/)

---

## 📌 Takeaway Points

- A **graph-based approach** is key for problems involving dependencies, where cycles indicate unsolvable scenarios.
- **DFS** works well for cycle detection, but **BFS (Topological Sort)** provides an efficient way to manage the ordering of tasks.
- **Cycle detection** in graph problems can be handled using **in-degree** or **recursion**.
  
---
