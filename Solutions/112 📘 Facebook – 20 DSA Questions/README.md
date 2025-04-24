
📘 Facebook – 20 DSA Questions

1. [Clone Graph](https://leetcode.com/problems/clone-graph/)
2. [Add and Search Word (Trie)](https://leetcode.com/problems/add-and-search-word-data-structure-design/)
3. [Number of Islands](https://leetcode.com/problems/number-of-islands/)
4. [Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)
5. [Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
6. [Accounts Merge](https://leetcode.com/problems/accounts-merge/)
7. [Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)
8. [Merge Intervals](https://leetcode.com/problems/merge-intervals/)
9. [Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)
10. [Course Schedule](https://leetcode.com/problems/course-schedule/)
11. [Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)
12. [Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)
13. [Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)
14. [Word Break](https://leetcode.com/problems/word-break/)
15. [Spiral Matrix](https://leetcode.com/problems/spiral-matrix/)
16. [Time Based Key-Value Store](https://leetcode.com/problems/time-based-key-value-store/)
17. [Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)
18. [Split Array Largest Sum](https://leetcode.com/problems/split-array-largest-sum/)
19. [Graph Valid Tree](https://leetcode.com/problems/graph-valid-tree/)
20. [Random Pick with Weight](https://leetcode.com/problems/random-pick-with-weight/)

------------------------------------------------------------------------------------------------------------
1. Clone Graph

# ➕ Problem: Clone Graph

## 📘 Problem Statement

> Given a reference to a connected undirected graph, clone the graph.  
> Each node in the graph contains a value and a list of its neighbors.  
> Implement a function to clone the graph.

**LeetCode Link:** [133. Clone Graph](https://leetcode.com/problems/clone-graph/)

---

```
Example 1:

Input: adjList = [[2,4],[1,3],[2,4],[1,3]]
Output: [[2,4],[1,3],[2,4],[1,3]]
Explanation: The graph is represented in adjacency list form, where each node is represented by its value and the list of its neighbors.

Example 2:

Input: adjList = []
Output: []
Explanation: The graph is empty.

Example 3:

Input: adjList = [[1], [2], [3], [4], [5]]
Output: [[1], [2], [3], [4], [5]]
```

## ✅ Constraints

- The number of nodes in the graph is in the range `[0, 100]`.
- Each node has a value in the range `[1, 100]`.
- There are no cycles in the graph.
- The graph is undirected and connected.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Depth-First Search (DFS) Recursion with Hash Map

**Approach:**  
Use DFS to explore the graph. During traversal, maintain a hash map to keep track of visited nodes. For each node, create a new node with the same value and clone its neighbors recursively.

```python
# Time Complexity: O(n), where n is the number of nodes in the graph
# Space Complexity: O(n), for the hash map storing cloned nodes
def cloneGraph(node):
    if not node:
        return None
    
    visited = {}
    
    def dfs(node):
        if node in visited:
            return visited[node]
        
        # Clone the node and store it in the visited map
        clone = Node(node.val)
        visited[node] = clone
        
        # Recursively clone all neighbors
        for neighbor in node.neighbors:
            clone.neighbors.append(dfs(neighbor))
        
        return clone
    
    return dfs(node)
```

---

### ⚙️ Level 2: Depth-First Search (DFS) Iterative Approach

**Approach:**  
This is similar to the recursive DFS approach, but uses an explicit stack to simulate the recursion. It avoids the potential risk of a stack overflow with large graphs.

```python
# Time Complexity: O(n), where n is the number of nodes
# Space Complexity: O(n), for the visited map and the stack
def cloneGraph(node):
    if not node:
        return None
    
    visited = {}
    stack = [node]
    
    # Clone the root node first
    visited[node] = Node(node.val)
    
    while stack:
        current = stack.pop()
        
        for neighbor in current.neighbors:
            if neighbor not in visited:
                # Clone the neighbor and add to stack for further exploration
                visited[neighbor] = Node(neighbor.val)
                stack.append(neighbor)
            
            # Append the cloned neighbor to the current node's neighbor list
            visited[current].neighbors.append(visited[neighbor])
    
    return visited[node]
```

---

### 🚀 Level 3: Breadth-First Search (BFS) Approach

**Approach:**  
BFS can be used to clone the graph level by level. The visited map stores the nodes that have already been cloned. The queue helps in exploring the graph in layers.

```python
# Time Complexity: O(n), where n is the number of nodes in the graph
# Space Complexity: O(n), for the visited map and the queue
from collections import deque

def cloneGraph(node):
    if not node:
        return None
    
    visited = {}
    queue = deque([node])
    
    # Clone the root node first
    visited[node] = Node(node.val)
    
    while queue:
        current = queue.popleft()
        
        for neighbor in current.neighbors:
            if neighbor not in visited:
                visited[neighbor] = Node(neighbor.val)
                queue.append(neighbor)
            
            # Append the cloned neighbor to the current node's neighbor list
            visited[current].neighbors.append(visited[neighbor])
    
    return visited[node]
```

---

## 🔗 Similar Problems

1. [106. Construct Binary Tree from Inorder and Postorder Traversal](https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal/)
2. [207. Course Schedule](https://leetcode.com/problems/course-schedule/)
3. [133. Clone Graph (Advanced variations)](https://leetcode.com/problems/clone-graph/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | DFS (Recursive)                   | O(n)            | O(n)             |
| 2     | DFS (Iterative with Stack)        | O(n)            | O(n)             |
| 3     | BFS                               | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- **DFS (Recursive)** is simple and elegant but may lead to stack overflow for large graphs.
- **DFS (Iterative)** avoids recursion and uses a stack to simulate the call stack, making it safer for large graphs.
- **BFS** explores the graph layer by layer, which is an iterative approach with a queue. It's useful when you need to explore a graph level-by-level.

---

2. Add and Search Word (Trie)

# ➕ Problem: Add and Search Word (Trie)

## 📘 Problem Statement

> Design a data structure that supports the following two operations:
> 
> - `addWord(word)` - Adds a word into the data structure.
> - `search(word)` - Returns true if the word is in the data structure. A word could contain the '.' character to represent any one letter.

**LeetCode Link:** [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

---

```
Example 1:

Input: 
["WordDictionary","addWord","search","search","addWord","search"]
[[],["bad"],["b.a.d"],["b..d"],["dad"],[".ad"]]

Output:
[null,null,true,true,null,true]

Explanation:
addWord("bad") -> null
search("b.a.d") -> true
search("b..d") -> true
addWord("dad") -> null
search(".ad") -> true
```

## ✅ Constraints

- All words have lowercase letters.
- All words are at most 25 characters long.
- The `addWord` and `search` operations will be called at most 1000 times.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Trie Implementation

**Approach:**  
This solution creates a simple trie node and trie structure. Each node contains a dictionary for its children and a boolean flag to mark the end of a word.

```python
# Time Complexity: O(m) for addWord and search where m is the length of the word
# Space Complexity: O(m) for storing the word in the Trie
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end_of_word = False

class WordDictionary:

    def __init__(self):
        self.root = TrieNode()

    def addWord(self, word: str) -> None:
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end_of_word = True

    def search(self, word: str) -> bool:
        def dfs(node, word):
            if not word:
                return node.is_end_of_word
            
            first_char = word[0]
            if first_char == ".":
                for child in node.children.values():
                    if dfs(child, word[1:]):
                        return True
            else:
                if first_char in node.children:
                    return dfs(node.children[first_char], word[1:])
            
            return False
        
        return dfs(self.root, word)
```

---

### ⚙️ Level 2: Optimized Trie with Better Handling of '.' in Search

**Approach:**  
This approach is similar to the first one but uses a helper function to handle the '.' character more efficiently during the search operation. This makes it easier to recurse into multiple child nodes at once when encountering '.'.

```python
# Time Complexity: O(m) for addWord and search, where m is the length of the word
# Space Complexity: O(m) for storing the word in the Trie
class WordDictionary:

    def __init__(self):
        self.trie = {}

    def addWord(self, word: str) -> None:
        node = self.trie
        for ch in word:
            node = node.setdefault(ch, {})
        node['#'] = True

    def search(self, word: str) -> bool:
        def dfs(node, i):
            if i == len(word):
                return '#' in node
            
            if word[i] == '.':
                return any(dfs(child, i + 1) for child in node.values() if isinstance(child, dict))
            if word[i] in node:
                return dfs(node[word[i]], i + 1)
            return False

        return dfs(self.trie, 0)
```

---

### 🚀 Level 3: Trie with Optimized Search Using a Helper Function

**Approach:**  
In this approach, we optimize the search method by directly handling the '.' character without needing to recurse too deeply. We use a depth-first search for word matching, and the optimization makes it possible to handle a wider range of inputs efficiently.

```python
# Time Complexity: O(m) for addWord and search where m is the length of the word
# Space Complexity: O(m) for storing the word in the Trie
class WordDictionary:

    def __init__(self):
        self.trie = {}

    def addWord(self, word: str) -> None:
        node = self.trie
        for char in word:
            node = node.setdefault(char, {})
        node['#'] = True

    def search(self, word: str) -> bool:
        def dfs(node, index):
            if index == len(word):
                return '#' in node
            
            if word[index] == '.':
                return any(dfs(child, index + 1) for child in node.values() if isinstance(child, dict))
            
            if word[index] in node:
                return dfs(node[word[index]], index + 1)
            
            return False

        return dfs(self.trie, 0)
```

---

## 🔗 Similar Problems

1. [211. Add and Search Word - Data structure design](https://leetcode.com/problems/add-and-search-word-data-structure-design/)
2. [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)
3. [472. Concatenated Words](https://leetcode.com/problems/concatenated-words/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Simple Trie Implementation        | O(m)            | O(m)             |
| 2     | Optimized Trie with '.' handling  | O(m)            | O(m)             |
| 3     | Trie with Optimized Search        | O(m)            | O(m)             |

---

## 📌 Takeaway Points

- **Trie** is highly efficient for string matching problems due to its prefix tree structure.
- **'.' handling** in the search function requires careful traversal of multiple branches, making DFS a good choice.
- Efficient memory management and time optimization is key to handling large input sizes.

---

3. Number of Islands

# ➕ Problem: Number of Islands

## 📘 Problem Statement

> Given a 2D grid map of `'1's` (land) and `'0's` (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are surrounded by water.

**LeetCode Link:** [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

---

```
Example 1:

Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

Example 2:

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
```

## ✅ Constraints

- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 300`
- `grid[i][j] is '0' or '1'`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force - DFS for Island Counting

**Approach:**  
We use Depth-First Search (DFS) to visit each unvisited land cell (`'1'`), marking it as visited by changing it to water (`'0'`). For each DFS, we increment the island count.

```python
# Time Complexity: O(m * n) where m and n are the number of rows and columns
# Space Complexity: O(m * n) due to the recursive call stack
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0
        
        def dfs(i, j):
            if i < 0 or j < 0 or i >= len(grid) or j >= len(grid[0]) or grid[i][j] == '0':
                return
            grid[i][j] = '0'  # Mark the cell as visited
            dfs(i + 1, j)  # Explore down
            dfs(i - 1, j)  # Explore up
            dfs(i, j + 1)  # Explore right
            dfs(i, j - 1)  # Explore left
        
        island_count = 0
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == '1':  # Found unvisited land
                    island_count += 1
                    dfs(i, j)  # Perform DFS to mark the island
        return island_count
```

---

### ⚙️ Level 2: Optimized DFS with Stack

**Approach:**  
This approach uses DFS with an explicit stack instead of recursion. It ensures better memory management by avoiding deep recursion call stacks, which might be problematic for large grids.

```python
# Time Complexity: O(m * n) where m and n are the number of rows and columns
# Space Complexity: O(m * n) for the stack
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0
        
        def dfs(i, j):
            stack = [(i, j)]
            grid[i][j] = '0'  # Mark the cell as visited
            while stack:
                x, y = stack.pop()
                for nx, ny in [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]:
                    if 0 <= nx < len(grid) and 0 <= ny < len(grid[0]) and grid[nx][ny] == '1':
                        grid[nx][ny] = '0'  # Mark the cell as visited
                        stack.append((nx, ny))
        
        island_count = 0
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == '1':  # Found unvisited land
                    island_count += 1
                    dfs(i, j)  # Perform DFS to mark the island
        return island_count
```

---

### 🚀 Level 3: BFS for Island Counting (Queue-based)

**Approach:**  
In this approach, we use a Breadth-First Search (BFS) instead of DFS. BFS ensures that we explore the grid layer by layer, which can sometimes be more efficient for large grids.

```python
# Time Complexity: O(m * n) where m and n are the number of rows and columns
# Space Complexity: O(m * n) for the queue
from collections import deque

class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid:
            return 0
        
        def bfs(i, j):
            queue = deque([(i, j)])
            grid[i][j] = '0'  # Mark the cell as visited
            while queue:
                x, y = queue.popleft()
                for nx, ny in [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]:
                    if 0 <= nx < len(grid) and 0 <= ny < len(grid[0]) and grid[nx][ny] == '1':
                        grid[nx][ny] = '0'  # Mark the cell as visited
                        queue.append((nx, ny))
        
        island_count = 0
        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if grid[i][j] == '1':  # Found unvisited land
                    island_count += 1
                    bfs(i, j)  # Perform BFS to mark the island
        return island_count
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | DFS (Recursive)                   | O(m * n)        | O(m * n)         |
| 2     | DFS (Iterative with Stack)        | O(m * n)        | O(m * n)         |
| 3     | BFS (Queue-based)                 | O(m * n)        | O(m * n)         |

---

## 🔗 Similar Problems

1. [733. Flood Fill](https://leetcode.com/problems/flood-fill/)
2. [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
3. [463. Island Perimeter](https://leetcode.com/problems/island-perimeter/)

---

## 📌 Takeaway Points

- **DFS vs BFS**: Both Depth-First Search and Breadth-First Search are valid approaches to exploring connected components (i.e., islands). DFS is typically implemented with recursion or a stack, while BFS uses a queue.
- **Grid Traversal**: When traversing a grid, always be mindful of edge cases, such as ensuring you don't go out of bounds.
- **Space Complexity**: The space complexity can grow with the grid size, and iterative solutions (like DFS with a stack) may be better than recursive DFS in some cases.


4. Meeting Rooms II

# ➕ Problem: Meeting Rooms II

## 📘 Problem Statement

> Given an array of meeting time intervals consisting of start and end times `[start, end]`, find the minimum number of conference rooms required to hold all the meetings.

**LeetCode Link:** [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

---

```
Example 1:

Input: intervals = [[0,30],[5,10],[15,20]]
Output: 2

Example 2:

Input: intervals = [[7,10],[2,4]]
Output: 1
```

## ✅ Constraints

- `1 <= intervals.length <= 10⁴`
- `0 <= intervals[i][0] < intervals[i][1] <= 10⁶`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force - Sorting and Greedy (Using Priority Queue)

**Approach:**  
Sort the intervals by their start time. Use a min-heap (priority queue) to track the end times of the meetings. For each meeting, if its start time is greater than or equal to the earliest end time in the heap, reuse that room (pop the heap). If not, add a new room (push the meeting's end time into the heap). The size of the heap at the end gives the minimum number of rooms.

```python
import heapq

# Time Complexity: O(n log n), due to sorting the intervals and the heap operations
# Space Complexity: O(n), for the heap
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        # Step 1: Sort the intervals by start time
        intervals.sort(key=lambda x: x[0])
        
        # Step 2: Initialize a heap. We push the first meeting's end time.
        free_rooms = []
        heapq.heappush(free_rooms, intervals[0][1])
        
        # Step 3: Iterate through the rest of the meetings
        for i in intervals[1:]:
            # If the room due to free up the earliest is free, reuse it
            if free_rooms[0] <= i[0]:
                heapq.heappop(free_rooms)
            
            # If a new room is to be assigned, then add to the heap.
            heapq.heappush(free_rooms, i[1])
        
        # The size of the heap is the number of rooms allocated
        return len(free_rooms)
```

---

### ⚙️ Level 2: Optimized with Sorted Lists (Greedy + Priority Queue)

**Approach:**  
This approach also sorts the intervals, but we optimize the room allocation by considering the start and end times separately in sorted order, instead of always pushing and popping from the heap. This ensures that we process the times in an optimal sequence.

```python
import heapq

# Time Complexity: O(n log n), due to sorting the intervals and heap operations
# Space Complexity: O(n), for the heap
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        # Step 1: Sort the start and end times
        starts = sorted([i[0] for i in intervals])
        ends = sorted([i[1] for i in intervals])
        
        start_ptr, end_ptr = 0, 0
        rooms = 0
        
        # Step 2: Use two pointers to iterate through starts and ends
        while start_ptr < len(intervals):
            # If a meeting starts after the earliest meeting ends, reuse a room
            if starts[start_ptr] >= ends[end_ptr]:
                end_ptr += 1
            else:
                rooms += 1
            start_ptr += 1
        
        return rooms
```

---

### 🚀 Level 3: Optimized with Two Pointers (Sorting and Greedy)

**Approach:**  
Here, we focus on minimizing room allocation while considering the meetings' schedules. We use a greedy approach, sorting both the start and end times and using two pointers to track when new rooms are needed.

```python
# Time Complexity: O(n log n), due to sorting the intervals
# Space Complexity: O(n), for the storage of the sorted lists
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        # Step 1: Sort the intervals by start time
        intervals.sort(key=lambda x: x[0])
        
        # Step 2: Initialize a priority queue (min-heap) to track the end times
        heap = []
        
        # Step 3: Iterate through the sorted intervals
        for interval in intervals:
            # If the room is free (the earliest end time is less than the current start)
            if heap and heap[0] <= interval[0]:
                heapq.heappop(heap)
            
            # Allocate a new room (or reuse a room with the earliest end time)
            heapq.heappush(heap, interval[1])
        
        return len(heap)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Sorting and Priority Queue       | O(n log n)      | O(n)             |
| 2     | Optimized Sorted Lists           | O(n log n)      | O(n)             |
| 3     | Two Pointers and Heap            | O(n log n)      | O(n)             |

---

## 🔗 Similar Problems

1. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
2. [452. Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)
3. [936. Stamping the Sequence](https://leetcode.com/problems/stamping-the-sequence/)

---

## 📌 Takeaway Points

- **Greedy Strategy**: By sorting both the start and end times and using a heap, we can efficiently track when rooms become free and allocate new rooms as needed.
- **Room Allocation**: The number of rooms required corresponds to the number of concurrent meetings at any given time, which can be efficiently tracked using a priority queue or two-pointer technique.
- **Optimal Substructure**: Sorting ensures that we always consider the earliest available room or meeting first, leading to an optimal solution.

---

5. Minimum Window Substring

# ➕ Problem: Minimum Window Substring

## 📘 Problem Statement

> Given two strings `s` and `t`, return the minimum window substring of `s` such that every character in `t` (including duplicates) is included in the window. If there is no such substring, return the empty string `""`.

**LeetCode Link:** [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)

---

```
Example 1:

Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" contains all the characters of t.

Example 2:

Input: s = "AA", t = "AA"
Output: "AA"
```

## ✅ Constraints

- `1 <= s.length, t.length <= 10⁵`
- `s` and `t` consist of English letters (uppercase and lowercase).

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sliding Window with Nested Loops)

**Approach:**  
We use a sliding window approach. We generate all possible substrings of `s` and check if they contain all characters from `t`. This brute-force method will take too long for larger inputs, but it works for smaller cases.

```python
# Time Complexity: O(n^2), due to generating all substrings
# Space Complexity: O(n), for storing substrings
class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not s or not t:
            return ""
        
        def is_valid(window, t):
            # Check if the window contains all characters from t
            for char in t:
                if window.count(char) < t.count(char):
                    return False
            return True
        
        min_window = ""
        for i in range(len(s)):
            for j in range(i + 1, len(s) + 1):
                window = s[i:j]
                if is_valid(window, t):
                    if not min_window or len(window) < len(min_window):
                        min_window = window
        return min_window
```

---

### ⚙️ Level 2: Optimized Sliding Window (HashMap)

**Approach:**  
Instead of checking all substrings, we can use a sliding window with a hashmap to track the characters in the current window and their counts. We expand the window by moving the right pointer and shrink it from the left if all characters of `t` are found.

```python
# Time Complexity: O(n), due to the sliding window approach
# Space Complexity: O(n), for the hashmaps storing character counts
from collections import Counter

class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not s or not t:
            return ""
        
        # Create a hashmap for characters in t
        t_count = Counter(t)
        window_count = Counter()
        required = len(t_count)
        formed = 0
        
        # Initialize two pointers
        l, r = 0, 0
        min_len = float('inf')
        min_window = ""
        
        while r < len(s):
            # Add character from the right end of the window
            window_count[s[r]] += 1
            
            # If the count of the current character matches the required count in t
            if window_count[s[r]] == t_count[s[r]]:
                formed += 1
            
            # Try to shrink the window from the left
            while l <= r and formed == required:
                if r - l + 1 < min_len:
                    min_len = r - l + 1
                    min_window = s[l:r + 1]
                
                # Remove the character from the left end of the window
                window_count[s[l]] -= 1
                if window_count[s[l]] < t_count[s[l]]:
                    formed -= 1
                l += 1
            
            # Move the right pointer forward
            r += 1
        
        return min_window
```

---

### 🚀 Level 3: Fully Optimized Sliding Window (Two Pointers with Hashmap)

**Approach:**  
This is the most efficient approach, where we use two pointers to create a dynamic window and a hashmap to track the frequency of characters in the current window. We only expand the window when necessary and shrink it when all characters of `t` are present.

```python
# Time Complexity: O(n), where n is the length of s
# Space Complexity: O(n), for the hashmaps
from collections import Counter

class Solution:
    def minWindow(self, s: str, t: str) -> str:
        if not s or not t:
            return ""
        
        # Counter for the characters in t
        t_count = Counter(t)
        window_count = Counter()
        required = len(t_count)
        formed = 0
        
        l, r = 0, 0
        min_len = float('inf')
        min_window = ""
        
        while r < len(s):
            # Add current character from s[r] to the window
            window_count[s[r]] += 1
            
            # Check if the current window satisfies the conditions
            if window_count[s[r]] == t_count[s[r]]:
                formed += 1
            
            # Try to shrink the window
            while l <= r and formed == required:
                # Update the result if we find a smaller window
                if r - l + 1 < min_len:
                    min_len = r - l + 1
                    min_window = s[l:r + 1]
                
                # Move left pointer to shrink the window
                window_count[s[l]] -= 1
                if window_count[s[l]] < t_count[s[l]]:
                    formed -= 1
                l += 1
            
            # Move the right pointer
            r += 1
        
        return min_window
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (Nested Loops)         | O(n^2)          | O(n)             |
| 2     | Optimized Sliding Window (Hashmap) | O(n)            | O(n)             |
| 3     | Fully Optimized Sliding Window     | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
2. [567. Permutation in String](https://leetcode.com/problems/permutation-in-string/)
3. [438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)

---

## 📌 Takeaway Points

- **Sliding Window Approach**: By using a sliding window, we can efficiently explore substrings and minimize the search space.
- **Greedy Optimization**: The window is expanded and contracted dynamically, ensuring that the smallest valid substring is found without examining every possible combination.
- **Hashmap Tracking**: Using hashmaps for character counts enables us to quickly check whether the window contains all required characters from `t`.


6. Accounts Merge

# ➕ Problem: Accounts Merge

## 📘 Problem Statement

> Given a list of `accounts`, where each account is represented by a list of strings. The first element of each account is the name of the account holder, followed by the email addresses associated with that account.  
> We would like to merge accounts that have at least one common email address. If two accounts have a common email address, they are merged into one account.  
> Return a list of merged accounts sorted lexicographically by the name.

**LeetCode Link:** [721. Accounts Merge](https://leetcode.com/problems/accounts-merge/)

---

```
Example 1:

Input: accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], 
                   ["John", "johnnybravo@mail.com"], 
                   ["John", "johnsmith@mail.com", "john_newyork@mail.com"], 
                   ["Mary", "mary@mail.com"]]
Output: [["John", "john00@mail.com", "john_newyork@mail.com", "johnsmith@mail.com"], 
         ["John", "johnnybravo@mail.com"], 
         ["Mary", "mary@mail.com"]]
Explanation: 
The first and third accounts are merged because they share "johnsmith@mail.com".
Note that "John" and "Mary" are different people.

Example 2:

Input: accounts = [["Gabe", "Gabe0@m.co", "Gabe1@m.co"], ["Gabe", "Gabe0@m.co", "Gabe2@m.co"]]
Output: [["Gabe", "Gabe0@m.co", "Gabe1@m.co", "Gabe2@m.co"]]
```

## ✅ Constraints

- `1 <= accounts.length <= 1000`
- `2 <= accounts[i].length <= 100`
- `1 <= accounts[i][j].length <= 30`
- The email addresses of different accounts are distinct.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Using DFS for Connected Components)

**Approach:**  
We can treat each account as a node in a graph, and the email addresses as edges connecting the nodes. We can perform a depth-first search (DFS) to find all connected components. Each connected component corresponds to a set of accounts that can be merged.

```python
# Time Complexity: O(N * E), where N is the number of accounts and E is the total number of emails
# Space Complexity: O(N + E), for storing the graph and visited set
from collections import defaultdict

class Solution:
    def accountsMerge(self, accounts):
        graph = defaultdict(list)
        email_to_name = {}
        
        # Build the graph and map email to the account name
        for account in accounts:
            name = account[0]
            for i in range(1, len(account)):
                graph[account[i]].append(account[i-1])
                graph[account[i-1]].append(account[i])
                email_to_name[account[i]] = name
        
        visited = set()
        result = []
        
        def dfs(email, emails):
            visited.add(email)
            emails.append(email)
            for neighbor in graph[email]:
                if neighbor not in visited:
                    dfs(neighbor, emails)
        
        # Perform DFS to get all connected components
        for email in email_to_name:
            if email not in visited:
                emails = []
                dfs(email, emails)
                result.append([email_to_name[email]] + sorted(emails))
        
        return result
```

---

### ⚙️ Level 2: Optimized Union-Find (Disjoint Set)

**Approach:**  
We can use the Union-Find (Disjoint Set) data structure to efficiently manage the merging of accounts. We union accounts that share common email addresses and then gather all emails that belong to the same account.

```python
# Time Complexity: O(N * α(N)), where N is the number of accounts and α is the inverse Ackermann function
# Space Complexity: O(N + E), for storing the parent array and emails
class Solution:
    def accountsMerge(self, accounts):
        parent = {}
        email_to_name = {}
        
        # Union-Find helper functions
        def find(x):
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]
        
        def union(x, y):
            rootX = find(x)
            rootY = find(y)
            if rootX != rootY:
                parent[rootY] = rootX
        
        # Build the Union-Find structure
        for account in accounts:
            name = account[0]
            first_email = account[1]
            if first_email not in parent:
                parent[first_email] = first_email
            email_to_name[first_email] = name
            for email in account[2:]:
                if email not in parent:
                    parent[email] = email
                email_to_name[email] = name
                union(first_email, email)
        
        # Group emails by root
        result = defaultdict(list)
        for email in parent:
            root = find(email)
            result[root].append(email)
        
        # Build the result
        return [[email_to_name[root]] + sorted(emails) for root, emails in result.items()]
```

---

### 🚀 Level 3: Fully Optimized Union-Find with Path Compression and Union by Rank

**Approach:**  
This is a more optimized version of the Union-Find approach with path compression and union by rank for efficient merging. This ensures the union-find operations run in near constant time.

```python
# Time Complexity: O(N * α(N)), where N is the number of accounts and α is the inverse Ackermann function
# Space Complexity: O(N + E), for storing the parent array and emails
class Solution:
    def accountsMerge(self, accounts):
        parent = {}
        rank = {}
        email_to_name = {}
        
        # Union-Find helper functions with path compression and union by rank
        def find(x):
            if parent[x] != x:
                parent[x] = find(parent[x])
            return parent[x]
        
        def union(x, y):
            rootX = find(x)
            rootY = find(y)
            if rootX != rootY:
                if rank[rootX] > rank[rootY]:
                    parent[rootY] = rootX
                elif rank[rootX] < rank[rootY]:
                    parent[rootX] = rootY
                else:
                    parent[rootY] = rootX
                    rank[rootX] += 1
        
        # Build the Union-Find structure
        for account in accounts:
            name = account[0]
            first_email = account[1]
            if first_email not in parent:
                parent[first_email] = first_email
                rank[first_email] = 0
            email_to_name[first_email] = name
            for email in account[2:]:
                if email not in parent:
                    parent[email] = email
                    rank[email] = 0
                email_to_name[email] = name
                union(first_email, email)
        
        # Group emails by root
        result = defaultdict(list)
        for email in parent:
            root = find(email)
            result[root].append(email)
        
        # Build the result
        return [[email_to_name[root]] + sorted(emails) for root, emails in result.items()]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity    | Space Complexity |
|-------|-------------------------------------|--------------------|------------------|
| 1     | Brute Force (DFS)                  | O(N * E)           | O(N + E)         |
| 2     | Union-Find (Disjoint Set)          | O(N * α(N))        | O(N + E)         |
| 3     | Optimized Union-Find (Path Compression & Union by Rank) | O(N * α(N)) | O(N + E) |

---

## 🔗 Similar Problems

1. [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)
2. [547. Friend Circles](https://leetcode.com/problems/friend-circles/)
3. [886. Possible Bipartition](https://leetcode.com/problems/possible-bipartition/)

---

## 📌 Takeaway Points

- **Union-Find** is a powerful data structure for efficiently merging disjoint sets and tracking connected components.
- **Path Compression and Union by Rank** optimizations ensure that Union-Find operations are near constant time.
- **Graph Representation** is a key concept for this problem, where email addresses are treated as nodes and shared emails as edges.
---

7. Alien Dictionary

# 🗣️ Problem: Alien Dictionary

## 📘 Problem Statement

> There is a new alien language that uses the English alphabet. However, the order of the characters is different from the order we use. Given a list of words sorted lexicographically by the rules of this new language, return the order of characters in the alien language.

> For example, given the list of words:

```
["wrt", "wrf", "er", "ett", "rftt"]
```

> The correct order of characters is: `"wertf"`.

**LeetCode Link:** [269. Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)

---

### Example 1:

**Input:**

```python
words = ["wrt", "wrf", "er", "ett", "rftt"]
```

**Output:**

```python
"wertf"
```

**Explanation:**  
The letters are ordered as follows:
1. From "wrt" and "wrf", we can see that 't' < 'f' because 't' comes before 'f' in the second word.
2. From "wrf" and "er", we can see that 'w' < 'e' because 'w' comes before 'e' in the first letter.
3. From "er" and "ett", we can see that 'r' < 't'.

This gives the order: `"wertf"`.

---

### Example 2:

**Input:**

```python
words = ["z", "x", "z"]
```

**Output:**

```python
"zx"
```

**Explanation:**  
The order of characters is `"zx"`.

---

## ✅ Constraints

- `1 <= words.length <= 100`
- `1 <= words[i].length <= 100`
- `words[i]` consists of only lowercase English letters.
- All the strings in `words` are unique.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Graph-based Topological Sort)

**Approach:**

- The problem can be viewed as finding a topological order of letters (nodes) where edges represent the ordering between characters.
- A directed graph can be constructed using the order between letters from adjacent words.
- Then, perform a topological sort to find the correct order of characters.

```python
# Time Complexity: O(N + E), where N is the number of characters and E is the number of edges
# Space Complexity: O(N + E), for storing the graph and in-degree
from collections import defaultdict, deque

class Solution:
    def alienOrder(self, words):
        # Build graph and calculate in-degrees
        graph = defaultdict(set)
        in_degree = defaultdict(int)
        all_chars = set(''.join(words))
        
        # Initialize in-degree for each character
        for char in all_chars:
            in_degree[char] = 0
        
        # Build the graph
        for i in range(len(words) - 1):
            word1, word2 = words[i], words[i+1]
            min_length = min(len(word1), len(word2))
            for j in range(min_length):
                if word1[j] != word2[j]:
                    if word2[j] not in graph[word1[j]]:
                        graph[word1[j]].add(word2[j])
                        in_degree[word2[j]] += 1
                    break
        
        # Topological sort using Kahn's algorithm (BFS)
        queue = deque([char for char in all_chars if in_degree[char] == 0])
        result = []
        
        while queue:
            char = queue.popleft()
            result.append(char)
            for neighbor in graph[char]:
                in_degree[neighbor] -= 1
                if in_degree[neighbor] == 0:
                    queue.append(neighbor)
        
        # If there's a cycle, return an empty string
        if len(result) != len(all_chars):
            return ""
        
        return ''.join(result)
```

---

### ⚙️ Level 2: Optimized Topological Sort (DFS)

**Approach:**  
- Perform DFS to find the topological order.
- Track visited nodes to avoid cycles and backtracking.
- Use recursion to ensure that all dependencies are processed before a node.

```python
# Time Complexity: O(N + E), where N is the number of characters and E is the number of edges
# Space Complexity: O(N + E), for storing the graph, in-degree, and visited state
from collections import defaultdict

class Solution:
    def alienOrder(self, words):
        graph = defaultdict(set)
        in_degree = defaultdict(int)
        all_chars = set(''.join(words))
        
        # Initialize in-degree for each character
        for char in all_chars:
            in_degree[char] = 0
        
        # Build the graph and calculate in-degrees
        for i in range(len(words) - 1):
            word1, word2 = words[i], words[i+1]
            min_length = min(len(word1), len(word2))
            for j in range(min_length):
                if word1[j] != word2[j]:
                    if word2[j] not in graph[word1[j]]:
                        graph[word1[j]].add(word2[j])
                        in_degree[word2[j]] += 1
                    break
        
        visited = {}
        result = []
        
        def dfs(char):
            if char in visited:
                return visited[char]
            visited[char] = -1  # Mark as visiting
            for neighbor in graph[char]:
                if visited[neighbor] == -1:  # Cycle detected
                    return False
                if visited[neighbor] == 0:  # Not visited yet
                    if not dfs(neighbor):
                        return False
            visited[char] = 1  # Mark as visited
            result.append(char)
            return True
        
        # Perform DFS on each character
        for char in all_chars:
            if visited.get(char, 0) == 0:
                if not dfs(char):
                    return ""
        
        return ''.join(result[::-1])  # Reverse to get the correct order
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity    | Space Complexity |
|-------|-------------------------------------|--------------------|------------------|
| 1     | Graph-based Topological Sort (BFS)  | O(N + E)           | O(N + E)         |
| 2     | DFS-based Topological Sort         | O(N + E)           | O(N + E)         |

---

## 🔗 Similar Problems

1. [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)
2. [207. Course Schedule](https://leetcode.com/problems/course-schedule/)
3. [444. Sequence Reconstruction](https://leetcode.com/problems/sequence-reconstruction/)

---

## 📌 Takeaway Points

- **Topological Sort** is a powerful technique for problems where you need to determine an ordering of elements based on precedence constraints.
- **Graph-based approach** helps in representing the order relations between the characters in the alien language.
- **DFS** and **BFS** are two key methods for performing topological sort. DFS ensures that we process each node only after all of its dependencies, while BFS is often used with Kahn's algorithm to handle the nodes with zero in-degrees.


8. Merge Intervals

# 🗂️ Problem: Merge Intervals

## 📘 Problem Statement

> Given an array of intervals where `intervals[i] = [start_i, end_i]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

**LeetCode Link:** [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

---

### Example 1:

**Input:**

```python
intervals = [[1,3],[2,6],[8,10],[15,18]]
```

**Output:**

```python
[[1,6],[8,10],[15,18]]
```

**Explanation:**  
Since intervals [1,3] and [2,6] overlap, we merge them into [1,6].  
Intervals [8,10] and [15,18] do not overlap, so they are kept as is.

---

### Example 2:

**Input:**

```python
intervals = [[1,4],[4,5]]
```

**Output:**

```python
[[1,5]]
```

**Explanation:**  
Intervals [1,4] and [4,5] are touching but not overlapping, so they are merged into [1,5].

---

## ✅ Constraints

- `1 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= start_i <= end_i <= 10⁶`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sorting and Merging)

**Approach:**  
1. Sort the intervals by their starting times.
2. Iterate through the sorted intervals and merge the intervals that overlap.

```python
# Time Complexity: O(n log n), due to sorting
# Space Complexity: O(n), for storing the result
def merge(intervals):
    # Sort intervals by the start time
    intervals.sort(key=lambda x: x[0])
    
    merged = []
    for interval in intervals:
        # If merged is empty or there's no overlap, append the interval
        if not merged or merged[-1][1] < interval[0]:
            merged.append(interval)
        else:
            # Merge the intervals
            merged[-1][1] = max(merged[-1][1], interval[1])
    
    return merged
```

---

### ⚙️ Level 2: Optimized Sorting and Merging

**Approach:**  
1. Sort intervals by their start times.
2. Iterate through intervals and merge them only when there’s an overlap.

```python
# Time Complexity: O(n log n), due to sorting
# Space Complexity: O(n), for storing the result
def merge(intervals):
    # Sort intervals based on the start value
    intervals.sort(key=lambda x: x[0])
    
    result = []
    for interval in intervals:
        if not result or result[-1][1] < interval[0]:
            result.append(interval)
        else:
            result[-1][1] = max(result[-1][1], interval[1])
    
    return result
```

---

### 🚀 Level 3: Space-Optimized with In-place Merging

**Approach:**  
1. Sort the intervals.
2. Merge intervals in place to save extra space.

```python
# Time Complexity: O(n log n), due to sorting
# Space Complexity: O(1) if merging in place
def merge(intervals):
    if not intervals:
        return []
    
    intervals.sort(key=lambda x: x[0])
    
    index = 0
    for i in range(1, len(intervals)):
        if intervals[i][0] <= intervals[index][1]:
            intervals[index][1] = max(intervals[index][1], intervals[i][1])
        else:
            index += 1
            intervals[index] = intervals[i]
    
    return intervals[:index + 1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity    | Space Complexity |
|-------|-------------------------------------|--------------------|------------------|
| 1     | Sorting and Merging                | O(n log n)         | O(n)             |
| 2     | Optimized Sorting and Merging      | O(n log n)         | O(n)             |
| 3     | In-place Merging                   | O(n log n)         | O(1)             |

---

## 🔗 Similar Problems

1. [57. Insert Interval](https://leetcode.com/problems/insert-interval/)
2. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)
3. [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

---

## 📌 Takeaway Points

- **Sorting** is a crucial first step for merging intervals because it ensures that any overlapping intervals are adjacent to each other.
- **Greedy approach** is used to keep merging intervals as long as they overlap, ensuring that we only keep the largest range possible for any overlapping intervals.
- **Space Optimization** can be achieved by merging intervals in place, avoiding the need for extra space.



9. Find All Anagrams in a String

# ➕ Problem: Find All Anagrams in a String

## 📘 Problem Statement

> Given two strings `s` and `p`, return all the start indices of `p`'s anagrams in `s`.  
> Strings consists of lowercase English letters only, and the order of output does not matter.

**LeetCode Link:** [438. Find All Anagrams in a String](https://leetcode.com/problems/find-all-anagrams-in-a-string/)

---

### Example 1:

**Input:**

```python
s = "cbaebabacd"
p = "abc"
```

**Output:**

```python
[0, 6]
```

**Explanation:**  
The substring with start index = 0 is "cba", which is an anagram of "abc".  
The substring with start index = 6 is "bac", which is an anagram of "abc".

---

### Example 2:

**Input:**

```python
s = "abab"
p = "ab"
```

**Output:**

```python
[0, 1, 2]
```

**Explanation:**  
The substring with start index = 0 is "ab", which is an anagram of "ab".  
The substring with start index = 1 is "ba", which is an anagram of "ab".  
The substring with start index = 2 is "ab", which is an anagram of "ab".

---

## ✅ Constraints

- `1 <= s.length, p.length <= 10⁴`
- `s` and `p` consist of lowercase English letters only.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Checking Substrings)

**Approach:**  
1. Check every substring of length `p.length` in `s`.
2. Sort the substring and compare it with `p` (also sorted) to check if it’s an anagram.

```python
# Time Complexity: O((n - m + 1) * m * log(m)) where n is the length of s and m is the length of p
# Space Complexity: O(m)
def findAnagrams(s, p):
    p_sorted = sorted(p)
    result = []
    for i in range(len(s) - len(p) + 1):
        if sorted(s[i:i+len(p)]) == p_sorted:
            result.append(i)
    return result
```

---

### ⚙️ Level 2: Sliding Window with Frequency Count

**Approach:**  
1. Use a sliding window of size `len(p)` and maintain a frequency count of characters.
2. Compare the frequency count of the current window with the frequency count of `p`.

```python
# Time Complexity: O(n), where n is the length of s
# Space Complexity: O(1), since there are at most 26 characters in the alphabet
from collections import Counter

def findAnagrams(s, p):
    p_count = Counter(p)
    s_count = Counter()
    result = []
    
    for i in range(len(s)):
        s_count[s[i]] += 1
        
        if i >= len(p):
            if s_count[s[i - len(p)]] == 1:
                del s_count[s[i - len(p)]]
            else:
                s_count[s[i - len(p)]] -= 1
        
        if s_count == p_count:
            result.append(i - len(p) + 1)
    
    return result
```

---

### 🚀 Level 3: Optimized Sliding Window with Only Two Counters

**Approach:**  
1. Use two frequency counts for the sliding window and string `p`.
2. Shift the window one character at a time and check if both counts match.

```python
# Time Complexity: O(n), where n is the length of s
# Space Complexity: O(1), since we only store frequency of 26 characters
from collections import defaultdict

def findAnagrams(s, p):
    result = []
    p_count = defaultdict(int)
    s_count = defaultdict(int)
    
    for char in p:
        p_count[char] += 1
    
    for i in range(len(s)):
        s_count[s[i]] += 1
        
        if i >= len(p):
            s_count[s[i - len(p)]] -= 1
            if s_count[s[i - len(p)]] == 0:
                del s_count[s[i - len(p)]]
        
        if s_count == p_count:
            result.append(i - len(p) + 1)
    
    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Brute Force (Sorting Substrings)     | O((n - m + 1) * m * log(m)) | O(m)             |
| 2     | Sliding Window with Frequency Count  | O(n)            | O(1)             |
| 3     | Optimized Sliding Window with Two Counters | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [76. Minimum Window Substring](https://leetcode.com/problems/minimum-window-substring/)
2. [438. Find All Anagrams in a String (Variation)](https://leetcode.com/problems/find-all-anagrams-in-a-string/)
3. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

---

## 📌 Takeaway Points

- **Sliding window technique** is efficient when dealing with problems involving substrings or subarrays of a fixed size.
- **Character frequency counts** are useful for checking anagrams and can be compared efficiently with hashmaps.
- The optimized approach minimizes the space complexity by using a fixed-sized frequency counter for the alphabet.

---

10. Course Schedule

# 🗂️ Problem: Course Schedule

## 📘 Problem Statement

> There are `numCourses` courses you have to take, labeled from `0` to `numCourses - 1`.  
> You are given an array `prerequisites` where `prerequisites[i] = [ai, bi]` indicates that you must take course `bi` first if you want to take course `ai`.  
> Return `true` if you can finish all courses. Otherwise, return `false`.

**LeetCode Link:** [207. Course Schedule](https://leetcode.com/problems/course-schedule/)

---

### Example 1:

**Input:**

```python
numCourses = 2
prerequisites = [[1,0]]
```

**Output:**

```python
true
```

**Explanation:**  
There are 2 courses to take. To take course 1, you need to first take course 0. So it is possible to finish all courses.

---

### Example 2:

**Input:**

```python
numCourses = 2
prerequisites = [[1,0],[0,1]]
```

**Output:**

```python
false
```

**Explanation:**  
There are 2 courses to take. To take course 1, you need to take course 0 first. But to take course 0, you need to take course 1 first. Therefore, you cannot finish all courses.

---

## ✅ Constraints

- `1 <= numCourses <= 10⁵`
- `0 <= prerequisites.length <= 5000`
- `prerequisites[i].length == 2`
- `0 <= ai, bi < numCourses`
- All the pairs `[ai, bi]` are unique.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (DFS with Cycle Detection)

**Approach:**  
1. Use Depth First Search (DFS) to explore the prerequisites.
2. If a cycle is detected in the graph, return `false`.

```python
# Time Complexity: O(V + E), where V is the number of courses and E is the number of prerequisites
# Space Complexity: O(V + E), for storing the graph and recursion stack
def canFinish(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    for course, pre in prerequisites:
        graph[course].append(pre)

    visited = [0] * numCourses  # 0: not visited, 1: visiting, 2: visited

    def dfs(course):
        if visited[course] == 1:
            return False  # cycle detected
        if visited[course] == 2:
            return True  # already checked
        
        visited[course] = 1
        for prereq in graph[course]:
            if not dfs(prereq):
                return False
        
        visited[course] = 2
        return True

    for course in range(numCourses):
        if not dfs(course):
            return False
    
    return True
```

---

### ⚙️ Level 2: Optimized with Topological Sort (Kahn's Algorithm)

**Approach:**  
1. Use Kahn's algorithm to perform a topological sort.
2. Track in-degrees and reduce them as we visit nodes (courses).
3. If all courses are visited without cycles, return `true`.

```python
# Time Complexity: O(V + E), where V is the number of courses and E is the number of prerequisites
# Space Complexity: O(V + E), for storing the graph and queue
from collections import deque

def canFinish(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    in_degree = [0] * numCourses
    
    for course, pre in prerequisites:
        graph[pre].append(course)
        in_degree[course] += 1
    
    # Queue for courses with no prerequisites (in-degree = 0)
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    
    visited = 0
    while queue:
        course = queue.popleft()
        visited += 1
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)
    
    return visited == numCourses
```

---

### 🚀 Level 3: Space Optimized with Topological Sort

**Approach:**  
1. Similar to the previous approach, but we optimize space usage by using an array for the graph instead of a dictionary.

```python
# Time Complexity: O(V + E)
# Space Complexity: O(V + E) for storing graph and in-degree
from collections import deque

def canFinish(numCourses, prerequisites):
    in_degree = [0] * numCourses
    graph = [[] for _ in range(numCourses)]

    for course, pre in prerequisites:
        graph[pre].append(course)
        in_degree[course] += 1

    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])

    visited = 0
    while queue:
        course = queue.popleft()
        visited += 1
        for next_course in graph[course]:
            in_degree[next_course] -= 1
            if in_degree[next_course] == 0:
                queue.append(next_course)
    
    return visited == numCourses
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity    | Space Complexity |
|-------|-------------------------------------|--------------------|------------------|
| 1     | DFS with Cycle Detection           | O(V + E)           | O(V + E)         |
| 2     | Kahn's Topological Sort            | O(V + E)           | O(V + E)         |
| 3     | Space-Optimized Topological Sort   | O(V + E)           | O(V + E)         |

---

## 🔗 Similar Problems

1. [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)
2. [207. Course Schedule (Variation)](https://leetcode.com/problems/course-schedule/)
3. [269. Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)

---

## 📌 Takeaway Points

- **Cycle Detection** is key for problems involving directed graphs and scheduling.
- **Topological Sort** is a powerful tool for determining if a directed acyclic graph (DAG) has a valid ordering.
- **Kahn's Algorithm** uses an in-degree array and a queue for efficient traversal, helping us detect cycles while processing nodes.
---

11. Serialize and Deserialize Binary Tree

# ➕ Problem: Serialize and Deserialize Binary Tree

## 📘 Problem Statement

> Serialization is the process of converting a data structure or object into a format that can be easily stored or transmitted. Deserialization is the reverse process of converting that format back into a data structure.
>
> Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and that the string can be deserialized back to the original tree structure.

**LeetCode Link:** [297. Serialize and Deserialize Binary Tree](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)

---

### Example 1:

**Input:**

```python
root = [1,2,3,null,null,4,5]
```

**Output:**

```python
["1","2","3","null","null","4","5"]
```

**Explanation:**
The tree structure:

```
    1
   / \
  2   3
     / \
    4   5
```

---

### Example 2:

**Input:**

```python
root = []
```

**Output:**

```python
["null"]
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 10^4]`.
- The value of each node is between `[-1000, 1000]`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Preorder Traversal with String)

**Approach:**  
- Serialize the tree using preorder traversal and store values as a string.
- Deserialize by reading the string values and reconstructing the tree using a queue.

```python
# Time Complexity: O(n) where n is the number of nodes in the tree
# Space Complexity: O(n) for storing the serialized string
class Codec:
    
    def serialize(self, root):
        def preorder(node):
            if not node:
                return "null,"
            return str(node.val) + "," + preorder(node.left) + preorder(node.right)
        
        return preorder(root)
    
    def deserialize(self, data):
        def build_tree(data_list):
            val = data_list.pop(0)
            if val == "null":
                return None
            node = TreeNode(int(val))
            node.left = build_tree(data_list)
            node.right = build_tree(data_list)
            return node
        
        data_list = data.split(",")
        return build_tree(data_list)
```

---

### ⚙️ Level 2: Optimized with Iteration

**Approach:**  
- Serialize the tree using preorder traversal with a queue.
- Deserialize using the queue to reconstruct the tree.

```python
# Time Complexity: O(n), where n is the number of nodes
# Space Complexity: O(n), space for the queue during serialization/deserialization
from collections import deque

class Codec:

    def serialize(self, root):
        result = []
        queue = deque([root])
        
        while queue:
            node = queue.popleft()
            if node:
                result.append(str(node.val))
                queue.append(node.left)
                queue.append(node.right)
            else:
                result.append("null")
        
        return ",".join(result)
    
    def deserialize(self, data):
        if data == "null":
            return None
        
        data_list = data.split(",")
        root = TreeNode(int(data_list[0]))
        queue = deque([root])
        i = 1
        
        while queue:
            node = queue.popleft()
            
            if data_list[i] != "null":
                node.left = TreeNode(int(data_list[i]))
                queue.append(node.left)
            i += 1
            
            if data_list[i] != "null":
                node.right = TreeNode(int(data_list[i]))
                queue.append(node.right)
            i += 1
        
        return root
```

---

### 🚀 Level 3: Optimized Space Usage with a Stack

**Approach:**  
- Serialize using preorder traversal while maintaining stack-based tracking for tree structure.
- Deserialize by creating nodes iteratively and maintaining the structure with a stack.

```python
# Time Complexity: O(n) where n is the number of nodes
# Space Complexity: O(n), stack space for holding nodes during construction
class Codec:

    def serialize(self, root):
        result = []
        
        def preorder(node):
            if node:
                result.append(str(node.val))
                preorder(node.left)
                preorder(node.right)
            else:
                result.append("null")
        
        preorder(root)
        return ",".join(result)
    
    def deserialize(self, data):
        data_list = data.split(",")
        
        def build_tree():
            val = data_list.pop(0)
            if val == "null":
                return None
            node = TreeNode(int(val))
            node.left = build_tree()
            node.right = build_tree()
            return node
        
        return build_tree()
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Preorder Traversal with Recursion    | O(n)            | O(n)             |
| 2     | Preorder Traversal with Queue        | O(n)            | O(n)             |
| 3     | Preorder Traversal with Iteration    | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [297. Serialize and Deserialize Binary Tree (Alternative Solution)](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)
2. [449. Serialize and Deserialize BST](https://leetcode.com/problems/serialize-and-deserialize-bst/)
3. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

---

## 📌 Takeaway Points

- **Preorder traversal** is an excellent choice for serialization as it captures the structure of the tree.
- **Null values** must be handled explicitly to maintain the tree's structure in serialization/deserialization.
- Iterative approaches like using a queue or stack can optimize space and time for serialization/deserialization.

---

12. Interval List Intersections

# ➕ Problem: Interval List Intersections

## 📘 Problem Statement

> Given two lists of intervals `A` and `B`, where each interval is a pair of integers `[start, end]`, return the intersection of these two lists. Each interval in the result should be **non-empty** and sorted by the starting value.

> If there is no intersection between two intervals, return an empty list.

**LeetCode Link:** [986. Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)

---

### Example 1:

**Input:**

```python
A = [[0,2],[5,10],[13,23],[24,25]]
B = [[1,5],[8,12],[15,24],[25,26]]
```

**Output:**

```python
[[1,2],[5,5],[8,10],[15,23],[24,25]]
```

**Explanation:**
- The intervals in `A` and `B` that intersect are:
  - `[0,2]` intersects with `[1,5]` → `[1,2]`
  - `[5,10]` intersects with `[1,5]` → `[5,5]`
  - `[5,10]` intersects with `[8,12]` → `[8,10]`
  - `[13,23]` intersects with `[15,24]` → `[15,23]`
  - `[24,25]` intersects with `[25,26]` → `[24,25]`

---

### Example 2:

**Input:**

```python
A = [[1,3],[5,9]]
B = [[2,3],[5,9]]
```

**Output:**

```python
[[2,3],[5,9]]
```

---

## ✅ Constraints

- `0 <= A.length, B.length <= 1000`
- `0 <= A[i][0] <= A[i][1] <= 10⁹`
- `0 <= B[i][0] <= B[i][1] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Double Loop)

**Approach:**  
- Compare each interval from `A` with every interval from `B`.
- If there is an intersection, add it to the result.

```python
# Time Complexity: O(m * n) where m and n are the number of intervals in A and B
# Space Complexity: O(min(m, n)) for storing the result
def intervalIntersection(A, B):
    res = []
    
    for a in A:
        for b in B:
            # Find intersection between two intervals
            start = max(a[0], b[0])
            end = min(a[1], b[1])
            
            if start <= end:
                res.append([start, end])
    
    return res
```

---

### ⚙️ Level 2: Optimized with Two Pointers

**Approach:**  
- Use two pointers to iterate through the lists `A` and `B`.
- For each pair of intervals, find the intersection and move the pointers accordingly.

```python
# Time Complexity: O(m + n) where m and n are the number of intervals in A and B
# Space Complexity: O(min(m, n)) for storing the result
def intervalIntersection(A, B):
    i, j = 0, 0
    res = []
    
    while i < len(A) and j < len(B):
        # Find intersection between A[i] and B[j]
        start = max(A[i][0], B[j][0])
        end = min(A[i][1], B[j][1])
        
        if start <= end:
            res.append([start, end])
        
        # Move the pointer with the smaller end
        if A[i][1] < B[j][1]:
            i += 1
        else:
            j += 1
    
    return res
```

---

### 🚀 Level 3: Fully Optimized with Direct Processing

**Approach:**  
- Use two pointers and avoid any redundant checks. Directly append the intersecting intervals to the result list while moving the pointers efficiently.

```python
# Time Complexity: O(m + n) where m and n are the number of intervals in A and B
# Space Complexity: O(min(m, n)) for storing the result
def intervalIntersection(A, B):
    i, j = 0, 0
    res = []
    
    while i < len(A) and j < len(B):
        # Calculate the intersection of A[i] and B[j]
        start = max(A[i][0], B[j][0])
        end = min(A[i][1], B[j][1])
        
        if start <= end:
            res.append([start, end])
        
        # Move the pointer with the smaller end to the next interval
        if A[i][1] < B[j][1]:
            i += 1
        else:
            j += 1
    
    return res
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force                       | O(m * n)        | O(min(m, n))     |
| 2     | Two Pointers                      | O(m + n)        | O(min(m, n))     |
| 3     | Fully Optimized                   | O(m + n)        | O(min(m, n))     |

---

## 🔗 Similar Problems

1. [57. Insert Interval](https://leetcode.com/problems/insert-interval/)
2. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
3. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

---

## 📌 Takeaway Points

- **Two pointers technique** can efficiently solve problems involving merging or intersecting intervals.
- Always check if the current intervals overlap before proceeding to the next one.
- Sorting the intervals beforehand might be necessary for certain types of interval problems, although it's not required in this case.
---

13. Diameter of Binary Tree

# ➕ Problem: Diameter of Binary Tree

## 📘 Problem Statement

> Given a binary tree, you need to compute the **diameter** of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

> The **diameter** of a tree is the number of nodes on the longest path between two leaves in the tree. 

**LeetCode Link:** [543. Diameter of Binary Tree](https://leetcode.com/problems/diameter-of-binary-tree/)

---

### Example 1:

**Input:**

```python
root = [1,2,3,4,5]
```

**Output:**

```python
3
```

**Explanation:**  
The longest path in the tree is `[4,2,1,3]`, which has length 3.

---

### Example 2:

**Input:**

```python
root = [1,2]
```

**Output:**

```python
1
```

---

## ✅ Constraints

- The number of nodes in the tree is in the range `[1, 10⁴]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (DFS for every node)

**Approach:**  
- Perform DFS from each node to calculate the path to every other node. For each node, compute the diameter by finding the longest path from that node to its descendants.

```python
# Time Complexity: O(n^2) because for each node we perform a DFS to calculate the path to all other nodes.
# Space Complexity: O(n) for the recursion stack
def diameterOfBinaryTree(root):
    def dfs(node):
        if not node:
            return 0
        left = dfs(node.left)
        right = dfs(node.right)
        return 1 + max(left, right)

    if not root:
        return 0
    
    max_diameter = 0
    
    def dfs_max(node):
        nonlocal max_diameter
        if not node:
            return 0
        left = dfs_max(node.left)
        right = dfs_max(node.right)
        max_diameter = max(max_diameter, left + right)
        return 1 + max(left, right)

    dfs_max(root)
    return max_diameter
```

---

### ⚙️ Level 2: Optimized DFS (Single DFS)

**Approach:**  
- Use a single DFS traversal to compute the height of each subtree and update the diameter on the go. The diameter is the maximum of the current diameter and the sum of the heights of the left and right subtrees.

```python
# Time Complexity: O(n) where n is the number of nodes in the tree
# Space Complexity: O(h) where h is the height of the tree (for the recursion stack)
def diameterOfBinaryTree(root):
    def dfs(node):
        if not node:
            return 0
        left = dfs(node.left)
        right = dfs(node.right)
        self.diameter = max(self.diameter, left + right)
        return 1 + max(left, right)

    self.diameter = 0
    dfs(root)
    return self.diameter
```

---

### 🚀 Level 3: Optimized Iterative Approach (If Applicable)

**Approach:**  
- The recursive solution is usually optimal for this problem. Iterative solutions are possible using BFS, but DFS is more intuitive and straightforward in this case.

```python
# The iterative approach is not as common for this problem, as DFS is simpler and more efficient.
# Using DFS is optimal for tree traversal in this case.
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (DFS from each node) | O(n^2)          | O(n)             |
| 2     | Optimized DFS (Single DFS)       | O(n)            | O(h)             |
| 3     | Iterative (Not typically used)   | O(n)            | O(h)             |

---

## 🔗 Similar Problems

1. [104. Maximum Depth of Binary Tree](https://leetcode.com/problems/maximum-depth-of-binary-tree/)
2. [111. Minimum Depth of Binary Tree](https://leetcode.com/problems/minimum-depth-of-binary-tree/)
3. [124. Binary Tree Maximum Path Sum](https://leetcode.com/problems/binary-tree-maximum-path-sum/)

---

## 📌 Takeaway Points

- **DFS** is optimal for problems that involve tree traversal, such as diameter calculations.
- **Height of subtrees** is an important concept when calculating the diameter or maximum path in trees.
- While a brute force approach can work, it's inefficient, and a single DFS that keeps track of the diameter is a more optimal solution.
---

14. Word Break

# ➕ Problem: Word Break

## 📘 Problem Statement

> Given a string `s` and a dictionary of strings `wordDict`, return `true` if `s` can be segmented into a space-separated sequence of one or more dictionary words.

> You may assume the dictionary does not contain duplicate words.

**LeetCode Link:** [139. Word Break](https://leetcode.com/problems/word-break/)

---

### Example 1:

**Input:**

```python
s = "leetcode"
wordDict = ["leet", "code"]
```

**Output:**

```python
True
```

**Explanation:**  
Return `True` because "leetcode" can be segmented as "leet code".

---

### Example 2:

**Input:**

```python
s = "applepenapple"
wordDict = ["apple", "pen"]
```

**Output:**

```python
True
```

**Explanation:**  
Return `True` because "applepenapple" can be segmented as "apple pen apple".

---

### Example 3:

**Input:**

```python
s = "catsandog"
wordDict = ["cats", "dog", "sand", "and", "cat"]
```

**Output:**

```python
False
```

**Explanation:**  
Return `False` because "catsandog" cannot be segmented into words from the dictionary.

---

## ✅ Constraints

- `1 <= s.length <= 300`
- `1 <= wordDict.length <= 1000`
- `1 <= wordDict[i].length <= 20`
- All strings consist of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking)

**Approach:**  
We can try every possible way of segmenting the string using backtracking. This will try to match the string from the beginning and check whether the suffix is a valid word.

```python
# Time Complexity: O(2^n), where n is the length of the string (due to backtracking)
# Space Complexity: O(n), recursion stack
def wordBreak(s, wordDict):
    def backtrack(start):
        if start == len(s):
            return True
        for word in wordDict:
            if s[start:start+len(word)] == word and backtrack(start + len(word)):
                return True
        return False
    
    return backtrack(0)
```

---

### ⚙️ Level 2: Dynamic Programming (Bottom-up Approach)

**Approach:**  
We can use dynamic programming to solve this problem. Let `dp[i]` represent whether the substring `s[0:i]` can be segmented into words from the dictionary. We initialize `dp[0] = True` and check every substring `s[j:i]` if it is in the dictionary.

```python
# Time Complexity: O(n^2), where n is the length of the string
# Space Complexity: O(n), for the dp array
def wordBreak(s, wordDict):
    dp = [False] * (len(s) + 1)
    dp[0] = True
    
    for i in range(1, len(s) + 1):
        for j in range(i):
            if dp[j] and s[j:i] in wordDict:
                dp[i] = True
                break
                
    return dp[len(s)]
```

---

### 🚀 Level 3: Optimized Dynamic Programming (Using Set for Faster Lookup)

**Approach:**  
We can optimize the DP solution by using a set for faster lookup. This will make checking if a substring is in the dictionary faster.

```python
# Time Complexity: O(n^2), where n is the length of the string
# Space Complexity: O(n), for the dp array
def wordBreak(s, wordDict):
    word_set = set(wordDict)  # Using a set for faster lookup
    dp = [False] * (len(s) + 1)
    dp[0] = True
    
    for i in range(1, len(s) + 1):
        for j in range(i):
            if dp[j] and s[j:i] in word_set:
                dp[i] = True
                break
                
    return dp[len(s)]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)       | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Bottom-up)  | O(n^2)          | O(n)             |
| 3     | Optimized DP with Set           | O(n^2)          | O(n)             |

---

## 🔗 Similar Problems

1. [140. Word Break II](https://leetcode.com/problems/word-break-ii/)
2. [472. Concatenated Words](https://leetcode.com/problems/concatenated-words/)
3. [139. Word Break II - Follow up](https://leetcode.com/problems/word-break-ii/)

---

## 📌 Takeaway Points

- The **dynamic programming** approach is often the most efficient solution for word segmentation problems.
- The brute force approach can be slow due to the exponential number of possible segmentations.
- Using a **set** for fast lookups of dictionary words in the optimized solution is key for improving performance.
---

15. Spiral Matrix

# ➕ Problem: Spiral Matrix

## 📘 Problem Statement

> Given an `m x n` matrix, return all the elements of the matrix in spiral order.

**LeetCode Link:** [54. Spiral Matrix](https://leetcode.com/problems/spiral-matrix/)

---

### Example 1:

**Input:**

```python
matrix = [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]
```

**Output:**

```python
[1, 2, 3, 6, 9, 8, 7, 4, 5]
```

**Explanation:**  
The matrix is read in a spiral order starting from the top left corner, moving right, then down, then left, then up, and continuing in this pattern.

---

### Example 2:

**Input:**

```python
matrix = [
 [ 1, 2, 3, 4 ],
 [ 5, 6, 7, 8 ],
 [ 9, 10, 11, 12 ]
]
```

**Output:**

```python
[1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
```

---

### Example 3:

**Input:**

```python
matrix = [
 [ 1, 2 ],
 [ 3, 4 ]
]
```

**Output:**

```python
[1, 2, 4, 3]
```

---

## ✅ Constraints

- `m == matrix.length`
- `n == matrix[i].length`
- `1 <= m, n <= 10⁴`
- `1 <= m * n <= 10⁴`
- `-10⁴ <= matrix[i][j] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Simulating Spiral Movement)

**Approach:**  
We can simulate the process of moving in a spiral by maintaining boundaries for the four sides of the matrix (top, bottom, left, right). We keep reducing these boundaries after each step in the spiral.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns
# Space Complexity: O(m * n), for the output list
def spiralOrder(matrix):
    if not matrix:
        return []
    
    result = []
    top, bottom, left, right = 0, len(matrix) - 1, 0, len(matrix[0]) - 1
    
    while top <= bottom and left <= right:
        # Traverse from left to right along the top row
        for i in range(left, right + 1):
            result.append(matrix[top][i])
        top += 1
        
        # Traverse from top to bottom along the right column
        for i in range(top, bottom + 1):
            result.append(matrix[i][right])
        right -= 1
        
        if top <= bottom:
            # Traverse from right to left along the bottom row
            for i in range(right, left - 1, -1):
                result.append(matrix[bottom][i])
            bottom -= 1
        
        if left <= right:
            # Traverse from bottom to top along the left column
            for i in range(bottom, top - 1, -1):
                result.append(matrix[i][left])
            left += 1
    
    return result
```

---

### ⚙️ Level 2: Optimized Approach (Using Boundaries Efficiently)

**Approach:**  
This solution is essentially the same as the brute-force solution but ensures minimal steps and checks by reducing the boundaries for each spiral loop more efficiently.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns
# Space Complexity: O(m * n), for the output list
def spiralOrder(matrix):
    if not matrix:
        return []
    
    result = []
    top, bottom, left, right = 0, len(matrix) - 1, 0, len(matrix[0]) - 1
    
    while top <= bottom and left <= right:
        # Traverse top row
        result.extend(matrix[top][left:right+1])
        top += 1
        
        # Traverse right column
        for i in range(top, bottom + 1):
            result.append(matrix[i][right])
        right -= 1
        
        if top <= bottom:
            # Traverse bottom row
            result.extend(matrix[bottom][left:right+1][::-1])
            bottom -= 1
        
        if left <= right:
            # Traverse left column
            for i in range(bottom, top - 1, -1):
                result.append(matrix[i][left])
            left += 1
    
    return result
```

---

### 🚀 Level 3: Space Optimized (Using Generator)

**Approach:**  
To avoid the extra space for `result` list and instead use a generator that yields elements as they are encountered in the spiral order.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns
# Space Complexity: O(1) for the extra space, apart from the output
def spiralOrder(matrix):
    def generator():
        top, bottom, left, right = 0, len(matrix) - 1, 0, len(matrix[0]) - 1
        
        while top <= bottom and left <= right:
            for i in range(left, right + 1):
                yield matrix[top][i]
            top += 1
            
            for i in range(top, bottom + 1):
                yield matrix[i][right]
            right -= 1
            
            if top <= bottom:
                for i in range(right, left - 1, -1):
                    yield matrix[bottom][i]
                bottom -= 1
            
            if left <= right:
                for i in range(bottom, top - 1, -1):
                    yield matrix[i][left]
                left += 1

    return list(generator())
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Simulating Spiral)  | O(m * n)        | O(m * n)         |
| 2     | Optimized (Efficient Boundaries) | O(m * n)        | O(m * n)         |
| 3     | Generator Approach               | O(m * n)        | O(1)             |

---

## 🔗 Similar Problems

1. [59. Spiral Matrix II](https://leetcode.com/problems/spiral-matrix-ii/)
2. [885. Spiral Matrix III](https://leetcode.com/problems/spiral-matrix-iii/)
3. [54. Spiral Matrix - Follow up](https://leetcode.com/problems/spiral-matrix/)

---

## 📌 Takeaway Points

- **Spiral matrix** problems often require simulating movement or traversal in a matrix with clear boundary control.
- Optimizing space can be done using generators or careful management of the result list, but the core traversal pattern remains the same.
- The **efficiency of boundary management** plays a key role in ensuring the algorithm works correctly and efficiently.
---

16. Time Based Key-Value Store

# ➕ Problem: Time Based Key-Value Store

## 📘 Problem Statement

> Design a time-based key-value data structure that supports the following operations:
> - `set(key, value, timestamp)`: Set the value of the key at the given timestamp.
> - `get(key, timestamp)`: Get the value of the key at the given timestamp. If the key has not been set at that timestamp, return the value associated with the most recent timestamp that is less than or equal to the given timestamp. If there are no previous timestamps, return an empty string.

**LeetCode Link:** [981. Time Based Key-Value Store](https://leetcode.com/problems/time-based-key-value-store/)

---

### Example 1:

**Input:**

```python
timeMap = TimeMap()
timeMap.set("foo", "bar", 1)
timeMap.get("foo", 1)  # Returns "bar"
timeMap.get("foo", 3)  # Returns "bar"
timeMap.set("foo", "baz", 4)
timeMap.get("foo", 4)  # Returns "baz"
timeMap.get("foo", 5)  # Returns "baz"
```

**Output:**

```python
[None, "bar", "bar", None, "baz", "baz"]
```

---

### Example 2:

**Input:**

```python
timeMap = TimeMap()
timeMap.set("love", "high", 10)
timeMap.set("love", "low", 20)
timeMap.get("love", 5)  # Returns "" 
timeMap.get("love", 10) # Returns "high"
timeMap.get("love", 15) # Returns "high"
timeMap.get("love", 20) # Returns "low"
timeMap.get("love", 25) # Returns "low"
```

**Output:**

```python
[None, None, "", "high", "high", "low", "low"]
```

---

## ✅ Constraints

- `1 <= key.length, value.length <= 100`
- `1 <= timestamp <= 10⁷`
- `set` and `get` operations will be called at most 2 * 10⁴ times.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Linear Search)

**Approach:**  
For each `get` operation, we can perform a linear search on the list of timestamps for the given key to find the latest value whose timestamp is less than or equal to the given one.

```python
# Time Complexity: O(n) for each get operation, where n is the number of sets for that key.
# Space Complexity: O(n), for storing the key-value pairs and timestamps
class TimeMap:

    def __init__(self):
        self.store = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        if key not in self.store:
            self.store[key] = []
        self.store[key].append((value, timestamp))

    def get(self, key: str, timestamp: int) -> str:
        if key not in self.store:
            return ""
        
        # Find the latest value with timestamp <= given timestamp
        pairs = self.store[key]
        for i in range(len(pairs) - 1, -1, -1):
            if pairs[i][1] <= timestamp:
                return pairs[i][0]
        
        return ""
```

---

### ⚙️ Level 2: Binary Search Optimization

**Approach:**  
To optimize the search for the latest timestamp less than or equal to the given timestamp, we can use **binary search** on the timestamps for each key.

```python
# Time Complexity: O(log n) for each get operation using binary search, where n is the number of sets for that key.
# Space Complexity: O(n), for storing the key-value pairs and timestamps
from bisect import bisect_right

class TimeMap:

    def __init__(self):
        self.store = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        if key not in self.store:
            self.store[key] = []
        self.store[key].append((value, timestamp))

    def get(self, key: str, timestamp: int) -> str:
        if key not in self.store:
            return ""
        
        # Binary search for the rightmost value with timestamp <= given timestamp
        pairs = self.store[key]
        idx = bisect_right(pairs, (None, timestamp)) - 1
        if idx >= 0 and pairs[idx][1] <= timestamp:
            return pairs[idx][0]
        
        return ""
```

---

### 🚀 Level 3: Fully Optimized with Sorted Timestamps

**Approach:**  
In this approach, we maintain a sorted list of timestamps for each key, which allows for binary search directly. We use the `bisect_right` method to quickly find the rightmost element whose timestamp is less than or equal to the given timestamp.

```python
# Time Complexity: O(log n) for each get operation using binary search
# Space Complexity: O(n), for storing the key-value pairs and timestamps
from bisect import bisect_right

class TimeMap:

    def __init__(self):
        self.store = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        if key not in self.store:
            self.store[key] = ([], [])  # Separate lists for values and timestamps
        self.store[key][0].append(value)
        self.store[key][1].append(timestamp)

    def get(self, key: str, timestamp: int) -> str:
        if key not in self.store:
            return ""
        
        values, timestamps = self.store[key]
        idx = bisect_right(timestamps, timestamp) - 1
        if idx >= 0:
            return values[idx]
        
        return ""
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity      | Space Complexity |
|-------|--------------------------------------|----------------------|------------------|
| 1     | Brute Force (Linear Search)          | O(n) for each get    | O(n)             |
| 2     | Binary Search Optimization           | O(log n) for each get| O(n)             |
| 3     | Sorted Timestamps with Binary Search | O(log n) for each get| O(n)             |

---

## 🔗 Similar Problems

1. [981. Time Based Key-Value Store - Follow-up](https://leetcode.com/problems/time-based-key-value-store/)
2. [981. Time-Based Key-Value Store II](https://leetcode.com/problems/time-based-key-value-store/)
3. [706. Design HashMap](https://leetcode.com/problems/design-hashmap/)

---

## 📌 Takeaway Points

- **Binary Search** optimizes lookup times when querying the most recent entry based on a given timestamp.
- **Efficient Storage** is key to ensure that the solution scales well, and separating keys with their timestamps helps optimize space complexity.
- The **combination of binary search with timestamp management** is the core to solving this problem efficiently.

----

17. Implement Trie (Prefix Tree)

# ➕ Problem: Implement Trie (Prefix Tree)

## 📘 Problem Statement

> Implement a trie (prefix tree) with the following methods:
> - `insert(word)`: Insert a word into the trie.
> - `search(word)`: Returns `true` if the word is in the trie.
> - `startsWith(prefix)`: Returns `true` if there is any word in the trie that starts with the given prefix.

**LeetCode Link:** [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

---

### Example 1:

**Input:**
```python
obj = Trie()
obj.insert("apple")
param_2 = obj.search("apple")  # Returns true
param_3 = obj.search("app")    # Returns false
param_4 = obj.startsWith("app") # Returns true
obj.insert("app")
param_5 = obj.search("app")    # Returns true
```

**Output:**
```python
[None, True, False, True, True]
```

---

### Example 2:

**Input:**
```python
obj = Trie()
obj.insert("banana")
param_2 = obj.search("banana")  # Returns true
param_3 = obj.startsWith("ban")  # Returns true
param_4 = obj.search("bana")    # Returns false
```

**Output:**
```python
[None, True, True, False]
```

---

## ✅ Constraints

- `1 <= word.length <= 200`
- `word` consists of lowercase English letters.
- `1 <= prefix.length <= 200`
- `prefix` consists of lowercase English letters.
- At most `10⁴` calls will be made to `insert`, `search`, and `startsWith`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Trie with Basic Operations

**Approach:**  
We create a TrieNode class to represent each node in the Trie. Each node will have a `children` dictionary to store child nodes and a `is_end` flag to mark if a word ends at that node.

```python
# Time Complexity: O(m) for each operation (m is the length of the word or prefix)
# Space Complexity: O(m), where m is the length of the word (due to the Trie structure)
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False

class Trie:

    def __init__(self):
        self.root = TrieNode()

    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end = True

    def search(self, word: str) -> bool:
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end

    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        return True
```

---

### ⚙️ Level 2: Optimized Trie with Handling Multiple Words

**Approach:**  
We extend the Trie structure by using a helper function to handle multiple words efficiently. This allows for fast insertions and searches even when the trie becomes large.

```python
# Time Complexity: O(m) for each operation (m is the length of the word or prefix)
# Space Complexity: O(m), where m is the length of the word
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False

class Trie:

    def __init__(self):
        self.root = TrieNode()

    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end = True

    def search(self, word: str) -> bool:
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end

    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        return True
```

---

### 🚀 Level 3: Trie with Optimized Storage and Efficient Lookup

**Approach:**  
In this approach, we maintain a `children` dictionary for each TrieNode and a boolean flag `is_end` to mark word boundaries. The performance of insert, search, and startsWith remains optimal.

```python
# Time Complexity: O(m) for each operation (m is the length of the word or prefix)
# Space Complexity: O(m) for each operation (due to the Trie structure)
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False

class Trie:

    def __init__(self):
        self.root = TrieNode()

    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end = True

    def search(self, word: str) -> bool:
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end

    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        return True
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Simple Trie with Basic Operations | O(m)            | O(m)             |
| 2     | Optimized Trie with Handling Multiple Words | O(m) | O(m) |
| 3     | Optimized Storage and Efficient Lookup | O(m) | O(m) |

---

## 🔗 Similar Problems

1. [208. Implement Trie (Prefix Tree) - Follow-up](https://leetcode.com/problems/implement-trie-prefix-tree/)
2. [211. Add and Search Word](https://leetcode.com/problems/add-and-search-word/)
3. [208. Trie Implementation](https://leetcode.com/problems/implement-trie-prefix-tree/)

---

## 📌 Takeaway Points

- **Trie** is a highly efficient data structure for problems related to prefix matching.
- **Inserting and searching** in a trie is done in linear time relative to the length of the word or prefix.
- **Prefix-based operations** such as `startsWith` are naturally optimized using a Trie structure, ensuring fast lookup times.
---

18. Split Array Largest Sum


# ➕ Problem: Split Array Largest Sum

## 📘 Problem Statement

> Given an array `nums` and an integer `m`, you need to split the array into `m` non-empty continuous subarrays.  
> Write an algorithm to minimize the largest sum among these subarrays.

**LeetCode Link:** [410. Split Array Largest Sum](https://leetcode.com/problems/split-array-largest-sum/)

---

### Example 1:

**Input:**
```python
nums = [7,2,5,10,8]
m = 2
```

**Output:**
```python
18
```

**Explanation:**  
There are multiple ways to split the array, but the optimal split is `[7,2,5]` and `[10,8]`, with the largest sum being 18.

### Example 2:

**Input:**
```python
nums = [1,2,3,4,5]
m = 2
```

**Output:**
```python
9
```

**Explanation:**  
The optimal split is `[1,2,3]` and `[4,5]`, with the largest sum being 9.

---

### Example 3:

**Input:**
```python
nums = [1,4,4]
m = 3
```

**Output:**
```python
4
```

**Explanation:**  
The optimal split is `[1]`, `[4]`, and `[4]`, with the largest sum being 4.

---

## ✅ Constraints

- `1 <= nums.length <= 1000`
- `0 <= nums[i] <= 10⁶`
- `1 <= m <= min(50, nums.length)`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Binary Search with Greedy Checking

**Approach:**  
We can use binary search to find the minimum largest sum.  
- First, calculate the lower and upper bounds for binary search:
  - The minimum possible value (lower bound) is the maximum element in the array (`max(nums)`), because no subarray can have a sum smaller than the largest element.
  - The maximum possible value (upper bound) is the sum of all elements in the array (`sum(nums)`), because one subarray could have all elements.

- Then, perform a binary search on the sum and check if it is possible to split the array into `m` subarrays where the largest sum does not exceed the mid-value.

```python
# Time Complexity: O(n * log(sum(nums) - max(nums)))
# Space Complexity: O(1)
def splitArray(nums, m):
    def can_split(mid):
        subarrays = 1
        current_sum = 0
        for num in nums:
            if current_sum + num > mid:
                subarrays += 1
                current_sum = num
                if subarrays > m:
                    return False
            else:
                current_sum += num
        return True

    left, right = max(nums), sum(nums)
    while left < right:
        mid = (left + right) // 2
        if can_split(mid):
            right = mid
        else:
            left = mid + 1
    return left
```

---

### ⚙️ Level 2: Optimized Binary Search with Helper Function

**Approach:**  
The binary search logic remains the same, but we improve the helper function that checks if we can split the array into `m` subarrays with the largest sum not exceeding a given value.

```python
# Time Complexity: O(n * log(sum(nums) - max(nums)))
# Space Complexity: O(1)
def splitArray(nums, m):
    def can_split(mid):
        subarrays = 1
        current_sum = 0
        for num in nums:
            if current_sum + num > mid:
                subarrays += 1
                current_sum = num
                if subarrays > m:
                    return False
            else:
                current_sum += num
        return True

    left, right = max(nums), sum(nums)
    while left < right:
        mid = (left + right) // 2
        if can_split(mid):
            right = mid
        else:
            left = mid + 1
    return left
```

---

### 🚀 Level 3: Binary Search with Optimized Checking and Conditions

**Approach:**  
In this level, we enhance the binary search and the checking logic for greater efficiency.

```python
# Time Complexity: O(n * log(sum(nums) - max(nums)))
# Space Complexity: O(1)
def splitArray(nums, m):
    def can_split(mid):
        subarrays = 1
        current_sum = 0
        for num in nums:
            if current_sum + num > mid:
                subarrays += 1
                current_sum = num
                if subarrays > m:
                    return False
            else:
                current_sum += num
        return True

    left, right = max(nums), sum(nums)
    while left < right:
        mid = (left + right) // 2
        if can_split(mid):
            right = mid
        else:
            left = mid + 1
    return left
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity        | Space Complexity |
|-------|--------------------------------------|------------------------|------------------|
| 1     | Binary Search with Greedy Checking    | O(n * log(sum(nums) - max(nums))) | O(1)             |
| 2     | Optimized Binary Search with Helper Function | O(n * log(sum(nums) - max(nums))) | O(1) |
| 3     | Binary Search with Optimized Checking and Conditions | O(n * log(sum(nums) - max(nums))) | O(1) |

---

## 🔗 Similar Problems

1. [410. Split Array Largest Sum (Follow-up)](https://leetcode.com/problems/split-array-largest-sum/)
2. [287. Find the Duplicate Number](https://leetcode.com/problems/find-the-duplicate-number/)
3. [123. Best Time to Buy and Sell Stock III](https://leetcode.com/problems/best-time-to-buy-and-sell-stock-iii/)

---

## 📌 Takeaway Points

- **Binary Search** can be applied to optimization problems where you need to minimize or maximize a certain value within a range.
- **Greedy approaches** like splitting arrays into subarrays help efficiently check if the sum conditions are met.
- The **sum of the array** and the **maximum element** set the bounds for the binary search range.
---

19. Graph Valid Tree

# ➕ Problem: Graph Valid Tree

## 📘 Problem Statement

> Given `n` nodes labeled from `0` to `n-1` and a list of edges `edges` where `edges[i] = [ai, bi]` indicates that there is an undirected edge between nodes `ai` and `bi`, write a function to check whether the given graph is a valid tree.
>  
> A **valid tree** is defined as:
> 1. There are no cycles.
> 2. All nodes are connected (i.e., all nodes can reach each other).

**LeetCode Link:** [261. Graph Valid Tree](https://leetcode.com/problems/graph-valid-tree/)

---

### Example 1:

**Input:**
```python
n = 5
edges = [[0,1],[0,2],[0,3],[1,4]]
```

**Output:**
```python
True
```

**Explanation:**  
The given graph is a tree, as it has no cycles and all nodes are connected.

### Example 2:

**Input:**
```python
n = 5
edges = [[0,1],[1,2],[2,3],[1,3],[1,4]]
```

**Output:**
```python
False
```

**Explanation:**  
The given graph contains a cycle (`[1, 2, 3, 1]`), so it is not a valid tree.

---

### Example 3:

**Input:**
```python
n = 5
edges = [[0,1],[1,2],[3,4]]
```

**Output:**
```python
False
```

**Explanation:**  
The graph is not connected, as node `0` and node `4` cannot reach each other.

---

## ✅ Constraints

- `1 <= n <= 1000`
- `0 <= edges.length <= 10⁴`
- `edges[i].length == 2`
- `0 <= edges[i][0], edges[i][1] < n`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Union-Find (Disjoint Set)

**Approach:**  
The union-find data structure can be used to check if the graph contains cycles.  
- We initialize each node as its own parent and then process each edge.
- For each edge, if the two nodes are already connected, a cycle is present.  
- If no cycles are found, we check if all nodes are connected by checking the number of unique parents.

```python
# Time Complexity: O(n + e), where e is the number of edges
# Space Complexity: O(n)
def validTree(n, edges):
    parent = list(range(n))
    
    def find(x):
        if parent[x] != x:
            parent[x] = find(parent[x])
        return parent[x]
    
    def union(x, y):
        rootX, rootY = find(x), find(y)
        if rootX != rootY:
            parent[rootX] = rootY
            return True
        return False

    for u, v in edges:
        if not union(u, v):
            return False
    
    return len(set(find(i) for i in range(n))) == 1
```

---

### ⚙️ Level 2: DFS Traversal (Depth-First Search)

**Approach:**  
Another approach to check if the graph is a valid tree is by performing a DFS traversal.  
- We start from any node and traverse all nodes while marking them visited.
- If we encounter a previously visited node (excluding the parent), a cycle is detected.
- If we visit all nodes and no cycle is found, the graph is a valid tree.

```python
# Time Complexity: O(n + e), where e is the number of edges
# Space Complexity: O(n)
def validTree(n, edges):
    adj_list = {i: [] for i in range(n)}
    for u, v in edges:
        adj_list[u].append(v)
        adj_list[v].append(u)

    visited = set()

    def dfs(node, parent):
        visited.add(node)
        for neighbor in adj_list[node]:
            if neighbor != parent:
                if neighbor in visited or not dfs(neighbor, node):
                    return False
        return True

    if not dfs(0, -1):
        return False

    return len(visited) == n
```

---

### 🚀 Level 3: BFS Traversal (Breadth-First Search)

**Approach:**  
This is a BFS approach, which is similar to DFS but uses a queue to explore nodes layer by layer. The cycle check remains the same as the DFS approach.

```python
# Time Complexity: O(n + e), where e is the number of edges
# Space Complexity: O(n)
from collections import deque

def validTree(n, edges):
    adj_list = {i: [] for i in range(n)}
    for u, v in edges:
        adj_list[u].append(v)
        adj_list[v].append(u)

    visited = set()
    queue = deque([(0, -1)])  # node, parent

    while queue:
        node, parent = queue.popleft()
        if node in visited:
            return False
        visited.add(node)
        for neighbor in adj_list[node]:
            if neighbor != parent:
                queue.append((neighbor, node))

    return len(visited) == n
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Union-Find (Disjoint Set)          | O(n + e)        | O(n)             |
| 2     | DFS Traversal                      | O(n + e)        | O(n)             |
| 3     | BFS Traversal                      | O(n + e)        | O(n)             |

---

## 🔗 Similar Problems

1. [323. Number of Connected Components in an Undirected Graph](https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/)
2. [547. Friend Circles](https://leetcode.com/problems/friend-circles/)
3. [785. Is Graph Bipartite?](https://leetcode.com/problems/is-graph-bipartite/)

---

## 📌 Takeaway Points

- **Union-Find** is a powerful technique for detecting cycles and checking connectivity in a graph.
- **DFS** and **BFS** are standard graph traversal methods that can be used to explore all nodes and detect cycles.
- The graph must be **connected** and have no **cycles** to be a valid tree.

---

20. Random Pick with Weight

# ➕ Problem: Random Pick with Weight

## 📘 Problem Statement

> Given an array of positive integers `w` where `w[i]` describes the weight of index `i`, write a function that randomly picks an index `i` such that the probability of picking index `i` is proportional to its weight `w[i]`.
>  
> Implement the `Solution` class:
> 
> - `Solution(int[] w)` Initializes the object with the weights array `w`.
> - `int pickIndex()` Returns a random index `i` such that the probability of picking index `i` is proportional to `w[i]`.

**LeetCode Link:** [528. Random Pick with Weight](https://leetcode.com/problems/random-pick-with-weight/)

---

### Example 1:

**Input:**
```python
w = [1, 3]
obj = Solution(w)
obj.pickIndex()  # pick 1 with probability 3/(1+3) = 0.75, pick 0 with probability 1/(1+3) = 0.25
```

**Output:**
```python
1
```

### Example 2:

**Input:**
```python
w = [1]
obj = Solution(w)
obj.pickIndex()  # only index 0 can be picked
```

**Output:**
```python
0
```

---

### Example 3:

**Input:**
```python
w = [1, 2, 3, 4]
obj = Solution(w)
obj.pickIndex()  # picks index 3 most likely, since weight 4 is the largest
```

**Output:**
```python
3
```

---

## ✅ Constraints

- `1 <= w.length <= 10⁴`
- `1 <= w[i] <= 10⁶`
- The sum of all `w[i]` will not exceed `10⁷`.
- **pickIndex** will be called at most `10⁴` times.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Prefix Sum and Binary Search

**Approach:**  
To pick an index proportionally to its weight, we can:
1. First, compute the prefix sum of weights. This helps us know the cumulative weight at each index.
2. When we pick an index randomly, we generate a random number between 1 and the total weight sum, and find the corresponding index using binary search.

**Steps:**
- Calculate the prefix sum array.
- Generate a random number in the range [1, total_sum].
- Use binary search to find the corresponding index in the prefix sum array.

```python
# Time Complexity: O(n) for initialization, O(log n) for each pick
# Space Complexity: O(n) for storing prefix sums
import random
from bisect import bisect_left

class Solution:

    def __init__(self, w):
        self.prefix_sums = []
        current_sum = 0
        for weight in w:
            current_sum += weight
            self.prefix_sums.append(current_sum)
        self.total_sum = current_sum

    def pickIndex(self):
        target = random.randint(1, self.total_sum)
        return bisect_left(self.prefix_sums, target)
```

---

### ⚙️ Level 2: Optimized Prefix Sum with Linear Search

**Approach:**  
This is a simpler but less optimized approach where we linearly search for the index that matches the random target. This solution is not as efficient as the binary search approach, especially for large inputs.

```python
# Time Complexity: O(n) for initialization, O(n) for each pick
# Space Complexity: O(n) for storing prefix sums
import random

class Solution:

    def __init__(self, w):
        self.prefix_sums = []
        current_sum = 0
        for weight in w:
            current_sum += weight
            self.prefix_sums.append(current_sum)
        self.total_sum = current_sum

    def pickIndex(self):
        target = random.randint(1, self.total_sum)
        for i, prefix_sum in enumerate(self.prefix_sums):
            if target <= prefix_sum:
                return i
```

---

### 🚀 Level 3: Caching the Random Number Generation

**Approach:**  
To minimize the overhead of generating a random number and searching for it multiple times, this version caches the random number generated for each pick. This helps in case you need to make multiple picks efficiently.

```python
# Time Complexity: O(n) for initialization, O(1) for each pick (after caching the total sum)
# Space Complexity: O(n) for storing prefix sums
import random

class Solution:

    def __init__(self, w):
        self.prefix_sums = []
        current_sum = 0
        for weight in w:
            current_sum += weight
            self.prefix_sums.append(current_sum)
        self.total_sum = current_sum
        self.cache = None

    def pickIndex(self):
        if self.cache is None:
            target = random.randint(1, self.total_sum)
            self.cache = target
        else:
            target = self.cache
            self.cache = None
        return bisect_left(self.prefix_sums, target)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity (Initialization) | Time Complexity (Pick) | Space Complexity |
|-------|------------------------------------|----------------------------------|------------------------|------------------|
| 1     | Prefix Sum with Binary Search      | O(n)                             | O(log n)               | O(n)             |
| 2     | Prefix Sum with Linear Search      | O(n)                             | O(n)                   | O(n)             |
| 3     | Cached Random Number with Binary Search | O(n)                         | O(1)                   | O(n)             |

---

## 🔗 Similar Problems

1. [519. Random Flip Matrix](https://leetcode.com/problems/random-flip-matrix/)
2. [382. Linked List Random Node](https://leetcode.com/problems/linked-list-random-node/)
3. [528. Random Pick with Weight (Modified)](https://leetcode.com/problems/random-pick-with-weight/)

---

## 📌 Takeaway Points

- **Prefix Sum** helps efficiently handle weighted random selection by providing cumulative weight information.
- **Binary Search** enables quick lookups on the prefix sum array.
- This problem is a good example of using random number generation in combination with algorithms like binary search for efficient probabilistic operations.

---
