
---

# ➕ Problem: Clone Graph

## 📘 Problem Statement

> Given a reference to a node in a **connected undirected graph**, return a **deep copy** (clone) of the graph.  
> Each node in the graph contains:
> - `val` (an integer)
> - `neighbors` (a list of neighbors of the node).
> 
> **Note**: The graph is represented as a **adjacency list** where each node’s neighbors are stored in a list.

**LeetCode Link:** [133. Clone Graph](https://leetcode.com/problems/clone-graph/)

---

```
Example 1:

Input: node = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: The graph is represented as: [[2,4],[1,3],[2,4],[1,3]].
```

---

## ✅ Constraints

- `0 <= node.val <= 100`
- The graph is guaranteed to be **connected**.
- The graph contains at most `100` nodes.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: DFS with HashMap (Naive Copy)

**Approach:**  
Perform a **DFS** to traverse the graph and clone each node. Use a hash map to store the clone of each node, ensuring that each node is cloned only once.

```python
# Time Complexity: O(V + E) where V is the number of nodes and E is the number of edges
# Space Complexity: O(V) for the recursion stack and hash map
def cloneGraph(node):
    if not node:
        return None
    
    # A dictionary to hold the original nodes and their corresponding clone nodes
    clone_map = {}
    
    def dfs(node):
        if node in clone_map:
            return clone_map[node]
        
        # Create a new node and add it to the clone_map
        clone = Node(node.val)
        clone_map[node] = clone
        
        # Clone all the neighbors
        for neighbor in node.neighbors:
            clone.neighbors.append(dfs(neighbor))
        
        return clone
    
    return dfs(node)
```

---

### ⚙️ Level 2: BFS with HashMap (Iterative Approach)

**Approach:**  
In this approach, we use **BFS** to clone the graph iteratively. We maintain a queue to process each node and clone its neighbors while using a hash map to store the cloned nodes.

```python
# Time Complexity: O(V + E) where V is the number of nodes and E is the number of edges
# Space Complexity: O(V) for the queue and hash map
from collections import deque

def cloneGraph(node):
    if not node:
        return None
    
    # A dictionary to map original nodes to cloned nodes
    clone_map = {}
    queue = deque([node])
    clone_map[node] = Node(node.val)
    
    while queue:
        curr_node = queue.popleft()
        
        for neighbor in curr_node.neighbors:
            if neighbor not in clone_map:
                clone_map[neighbor] = Node(neighbor.val)
                queue.append(neighbor)
            clone_map[curr_node].neighbors.append(clone_map[neighbor])
    
    return clone_map[node]
```

---

### 🚀 Level 3: BFS with Detailed Optimization

**Approach:**  
This is an optimized BFS solution where we clone nodes and neighbors while keeping the code simple and efficient. The BFS approach ensures that we visit each node and its neighbors exactly once.

```python
# Time Complexity: O(V + E)
# Space Complexity: O(V)
from collections import deque

def cloneGraph(node):
    if not node:
        return None
    
    clone_map = {node: Node(node.val)}  # Initialize with the starting node
    queue = deque([node])
    
    while queue:
        curr_node = queue.popleft()
        
        # Traverse through all neighbors of the current node
        for neighbor in curr_node.neighbors:
            if neighbor not in clone_map:
                clone_map[neighbor] = Node(neighbor.val)  # Clone the neighbor
                queue.append(neighbor)  # Add neighbor to queue for future processing
            clone_map[curr_node].neighbors.append(clone_map[neighbor])
    
    return clone_map[node]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity       | Space Complexity     |
|-------|------------------------------------|-----------------------|----------------------|
| 1     | DFS with HashMap (Naive Copy)      | O(V + E)             | O(V)                 |
| 2     | BFS with HashMap (Iterative)       | O(V + E)             | O(V)                 |
| 3     | BFS with Detailed Optimization     | O(V + E)             | O(V)                 |

---

## 🔗 Similar Problems

1. [133. Clone Graph (Modified)](https://leetcode.com/problems/clone-graph/)
2. [127. Word Ladder](https://leetcode.com/problems/word-ladder/)
3. [207. Course Schedule](https://leetcode.com/problems/course-schedule/)

---

## 📌 Takeaway Points

- **Graph traversal algorithms** such as **DFS** and **BFS** are fundamental for problems like cloning graphs, pathfinding, and cycle detection.
- **HashMap** (or dictionary) is crucial for storing references to avoid revisiting nodes.
- **DFS** is recursive and easy to implement, while **BFS** uses a queue and can be more iterative.

---
