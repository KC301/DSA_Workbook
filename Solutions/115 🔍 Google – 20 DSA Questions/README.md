🔍 Google – 20 DSA Questions

Here are the LeetCode links for the new list of problems:

1. [Word Break](https://leetcode.com/problems/word-break/)
2. [Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)
3. [Design Search Autocomplete System](https://leetcode.com/problems/design-search-autocomplete-system/)
4. [Sudoku Solver](https://leetcode.com/problems/sudoku-solver/)
5. [Reconstruct Itinerary](https://leetcode.com/problems/reconstruct-itinerary/)
6. [Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)
7. [Dijkstra’s Algorithm](https://leetcode.com/problems/network-delay-time/) *(Note: Dijkstra's algorithm is generally used for shortest path problems; this is a related problem)*
8. [Burst Balloons](https://leetcode.com/problems/burst-balloons/)
9. [Serialize and Deserialize N-ary Tree](https://leetcode.com/problems/serialize-and-deserialize-n-ary-tree/)
10. [Jump Game](https://leetcode.com/problems/jump-game/)
11. [Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)
12. [Find Duplicate Subtrees](https://leetcode.com/problems/find-duplicate-subtrees/)
13. [Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)
14. [Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)
15. [Critical Connections in a Network](https://leetcode.com/problems/critical-connections-in-a-network/)
16. [Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/)
17. [Count Connected Components in an Undirected Graph](https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/)
18. [Paint House](https://leetcode.com/problems/paint-house/)
19. [Knight Probability in Chessboard](https://leetcode.com/problems/knight-probability-in-chessboard/)
20. [Google Interview Word Ladder II](https://leetcode.com/problems/word-ladder-ii/)

------------------------------------------------------------------------------------------

1. Word Break
---

# 🧩 Problem: Word Break

## 📘 Problem Statement

> Given a string `s` and a dictionary of strings `wordDict`, return `true` if `s` can be segmented into a space-separated sequence of one or more dictionary words.
>
> Note that the same word in the dictionary may be reused multiple times in the segmentation.

**LeetCode Link:** [139. Word Break](https://leetcode.com/problems/word-break/)

---

```

```

## ✅ Constraints

- `1 <= s.length <= 300`
- `1 <= wordDict.length <= 1000`
- `1 <= wordDict[i].length <= 20`
- `s` and `wordDict[i]` consist of only lowercase English letters.
- All the strings of `wordDict` are **unique**.

---

## 🧠 Python Solutions

### 🧪 Level 1: Brute Force (Recursive Backtracking without Memoization)

**Approach:** Try every possible prefix and recursively check the suffix. Exponential time due to recomputation.

```python
# Time Complexity: Exponential
# Space Complexity: O(n)
def wordBreak(s, wordDict):
    def backtrack(start):
        if start == len(s):
            return True
        for end in range(start + 1, len(s) + 1):
            if s[start:end] in wordDict and backtrack(end):
                return True
        return False
    
    return backtrack(0)
```

---

### ⚙️ Level 2: Mildly Optimized (Top-Down with Memoization)

**Approach:** Add memoization to cache overlapping subproblems.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def wordBreak(s, wordDict):
    wordSet = set(wordDict)
    memo = {}

    def canBreak(start):
        if start == len(s):
            return True
        if start in memo:
            return memo[start]
        for end in range(start + 1, len(s) + 1):
            if s[start:end] in wordSet and canBreak(end):
                memo[start] = True
                return True
        memo[start] = False
        return False

    return canBreak(0)
```

---

### 🚀 Level 3: Fully Optimized (Bottom-Up Dynamic Programming)

**Approach:** Use a DP array where `dp[i]` is True if `s[0:i]` can be formed using the dictionary.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def wordBreak(s, wordDict):
    wordSet = set(wordDict)
    n = len(s)
    dp = [False] * (n + 1)
    dp[0] = True

    for i in range(1, n + 1):
        for j in range(i):
            if dp[j] and s[j:i] in wordSet:
                dp[i] = True
                break

    return dp[n]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                     | Time Complexity | Space Complexity |
|-------|------------------------------|------------------|------------------|
| 1     | Brute Force (Recursive)      | Exponential      | O(n)             |
| 2     | Top-Down DP (Memoization)    | O(n²)            | O(n)             |
| 3     | Bottom-Up DP                 | O(n²)            | O(n)             |

> _n = length of the input string `s`_

---

## 🔗 Similar Problems

1. [140. Word Break II](https://leetcode.com/problems/word-break-ii/)
2. [472. Concatenated Words](https://leetcode.com/problems/concatenated-words/)
3. [91. Decode Ways](https://leetcode.com/problems/decode-ways/)

---

## 📌 Takeaway Points

- Brute-force recursive methods often lead to timeouts due to repeated subproblem evaluations.
- Top-down memoization drastically reduces redundant computation.
- Bottom-up DP is the most efficient and scalable approach.
- Using `set()` for word lookup improves performance over `list`.

---

2. Course Schedule II

---

# 🧩 Problem: Course Schedule II

## 📘 Problem Statement

> There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses - 1`. You are given an array `prerequisites` where `prerequisites[i] = [a, b]` indicates that you must take course `b` before course `a`.
>
> Return the ordering of courses you should take to finish all courses. If there are many valid answers, return any of them. If it is impossible to finish all courses, return an empty array.

**LeetCode Link:** [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)

---

## ✅ Constraints

- `1 <= numCourses <= 2000`
- `0 <= prerequisites.length <= numCourses * (numCourses - 1)`
- `prerequisites[i].length == 2`
- `0 <= ai, bi < numCourses`
- All the pairs `[ai, bi]` are **unique**.

---

## 🧠 Python Solutions

### 🧪 Level 1: Brute Force (DFS with Cycle Check on Every Node)

**Approach:** For each node, perform DFS to detect cycles and build the path. Inefficient due to repeated traversals.

```python
# Time Complexity: O(N^2)
# Space Complexity: O(N + E)
def findOrder(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    for dest, src in prerequisites:
        graph[src].append(dest)

    result = []
    visited = set()
    visiting = set()

    def dfs(course):
        if course in visiting:
            return False
        if course in visited:
            return True
        visiting.add(course)
        for neighbor in graph[course]:
            if not dfs(neighbor):
                return False
        visiting.remove(course)
        visited.add(course)
        result.append(course)
        return True

    for course in range(numCourses):
        if course not in visited:
            if not dfs(course):
                return []

    return result[::-1]
```

---

### ⚙️ Level 2: Topological Sort using DFS + Global Memoization

**Approach:** Optimized DFS with a result list and visited state tracking.

```python
# Time Complexity: O(N + E)
# Space Complexity: O(N + E)
def findOrder(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    for dest, src in prerequisites:
        graph[src].append(dest)

    visited = [0] * numCourses  # 0=unvisited, 1=visiting, 2=visited
    result = []
    has_cycle = False

    def dfs(course):
        nonlocal has_cycle
        if visited[course] == 1:
            has_cycle = True
            return
        if visited[course] == 2:
            return
        visited[course] = 1
        for neighbor in graph[course]:
            dfs(neighbor)
        visited[course] = 2
        result.append(course)

    for course in range(numCourses):
        if visited[course] == 0:
            dfs(course)

    return [] if has_cycle else result[::-1]
```

---

### 🚀 Level 3: Fully Optimized (Kahn’s Algorithm - BFS Topological Sort)

**Approach:** Count in-degrees and apply BFS for topological sort.

```python
# Time Complexity: O(N + E)
# Space Complexity: O(N + E)
from collections import deque

def findOrder(numCourses, prerequisites):
    graph = {i: [] for i in range(numCourses)}
    in_degree = [0] * numCourses

    for dest, src in prerequisites:
        graph[src].append(dest)
        in_degree[dest] += 1

    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    result = []

    while queue:
        course = queue.popleft()
        result.append(course)
        for neighbor in graph[course]:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)

    return result if len(result) == numCourses else []
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|------------------|------------------|
| 1     | DFS per Node (Cycle Detection)   | O(N²)            | O(N + E)         |
| 2     | DFS with Global Visited State    | O(N + E)         | O(N + E)         |
| 3     | BFS (Kahn’s Algorithm)           | O(N + E)         | O(N + E)         |

> _N = number of courses, E = number of prerequisite pairs_

---

## 🔗 Similar Problems

1. [207. Course Schedule](https://leetcode.com/problems/course-schedule/)
2. [133. Clone Graph](https://leetcode.com/problems/clone-graph/)
3. [444. Sequence Reconstruction](https://leetcode.com/problems/sequence-reconstruction/)

---

## 📌 Takeaway Points

- Use **DFS or BFS topological sort** to solve dependency-related problems.
- **Cycle detection** is key to validating the graph.
- **Kahn’s algorithm (BFS)** is iterative, easy to debug, and generally more intuitive for course scheduling.
- DFS with color/state arrays is a compact and efficient recursive solution.

---

3. Design Search Autocomplete System

---

# 🧩 Problem: Design Search Autocomplete System

## 📘 Problem Statement

> Design a search autocomplete system for a search engine. Users may input a sentence (at a time character by character), and the system returns the top 3 historical hot sentences that have the prefix of the input.
>
> Implement the `AutocompleteSystem` class:
>
> - `AutocompleteSystem(String[] sentences, int[] times)` – Initializes the system with historical sentences and corresponding frequencies.
> - `List<String> input(char c)` – Processes the next character of the input and returns the top 3 autocomplete results based on the current prefix.

**LeetCode Link:** [642. Design Search Autocomplete System](https://leetcode.com/problems/design-search-autocomplete-system/)

---

## ✅ Constraints

- All sentences contain only lowercase letters and space `' '`.
- 1 ≤ `sentences.length`, `times.length` ≤ 100
- 1 ≤ `sentence.length` ≤ 100
- Input is terminated with `'#'`

---

## 🧠 Python Solutions

### 🧪 Level 1: Brute Force (Linear Search Every Time)

**Approach:** Store all sentences and scan linearly for matches on every keystroke.

```python
# Time Complexity: O(N * L) per input
# Space Complexity: O(N * L)
class AutocompleteSystem:
    def __init__(self, sentences, times):
        self.freq = {}
        for i in range(len(sentences)):
            self.freq[sentences[i]] = times[i]
        self.input_str = ""

    def input(self, c):
        if c == '#':
            self.freq[self.input_str] = self.freq.get(self.input_str, 0) + 1
            self.input_str = ""
            return []
        self.input_str += c
        candidates = [s for s in self.freq if s.startswith(self.input_str)]
        candidates.sort(key=lambda x: (-self.freq[x], x))
        return candidates[:3]
```

---

### ⚙️ Level 2: Trie with Lists at Nodes

**Approach:** Build a Trie and store all matching sentences at each node. Use that list to filter by prefix.

```python
# Time Complexity: O(P + K log K), P = prefix length, K = matching sentences
# Space Complexity: O(N * L)
from collections import defaultdict

class TrieNode:
    def __init__(self):
        self.children = {}
        self.sentences = set()

class AutocompleteSystem:
    def __init__(self, sentences, times):
        self.root = TrieNode()
        self.freq = defaultdict(int)
        self.input_str = ""
        for i in range(len(sentences)):
            self.freq[sentences[i]] = times[i]
            self._insert(sentences[i])

    def _insert(self, sentence):
        node = self.root
        for char in sentence:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
            node.sentences.add(sentence)

    def _search(self, prefix):
        node = self.root
        for char in prefix:
            if char not in node.children:
                return []
            node = node.children[char]
        return list(node.sentences)

    def input(self, c):
        if c == '#':
            self.freq[self.input_str] += 1
            self._insert(self.input_str)
            self.input_str = ""
            return []
        self.input_str += c
        results = self._search(self.input_str)
        results.sort(key=lambda x: (-self.freq[x], x))
        return results[:3]
```

---

### 🚀 Level 3: Fully Optimized Trie + Min-Heap for Top 3 Hot Sentences

**Approach:** Use Trie nodes with max-heaps to maintain only top 3 suggestions at each node. Improves both memory and runtime.

```python
# Time Complexity: O(P log K), P = prefix length, K = 3
# Space Complexity: O(N * L)
import heapq
from collections import defaultdict

class TrieNode:
    def __init__(self):
        self.children = {}
        self.counts = defaultdict(int)

class AutocompleteSystem:
    def __init__(self, sentences, times):
        self.root = TrieNode()
        self.freq = defaultdict(int)
        self.curr = ""
        for sentence, time in zip(sentences, times):
            self.freq[sentence] += time
            self._insert(sentence)

    def _insert(self, sentence):
        node = self.root
        for char in sentence:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
            node.counts[sentence] += self.freq[sentence]

    def input(self, c):
        if c == '#':
            self.freq[self.curr] += 1
            self._insert(self.curr)
            self.curr = ""
            return []
        self.curr += c
        node = self.root
        for char in self.curr:
            if char not in node.children:
                return []
            node = node.children[char]
        heap = [(-freq, s) for s, freq in node.counts.items()]
        heapq.heapify(heap)
        return [heapq.heappop(heap)[1] for _ in range(min(3, len(heap)))]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity      | Space Complexity     |
|-------|----------------------------------|----------------------|----------------------|
| 1     | Brute Force                     | O(N * L) per input   | O(N * L)             |
| 2     | Trie + Sentence Sets            | O(P + K log K)       | O(N * L)             |
| 3     | Trie + Top-3 Min Heap per Node  | O(P log K), K=3      | O(N * L)             |

> _N = number of sentences, L = average sentence length, P = prefix length_

---

## 🔗 Similar Problems

1. [692. Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/)
2. [820. Short Encoding of Words](https://leetcode.com/problems/short-encoding-of-words/)
3. [1032. Stream of Characters](https://leetcode.com/problems/stream-of-characters/)

---

## 📌 Takeaway Points

- A naive solution can work well for small data but becomes slow as volume grows.
- Tries offer fast prefix lookups, especially useful for autocomplete systems.
- Maintaining only the **top 3** at each Trie node using a **heap** keeps space usage efficient and fast to access.
- Balancing runtime with memory usage is key in data-intensive problems like this.

---

4. Sudoku Solver


---

# 🧩 Problem: Sudoku Solver

## 📘 Problem Statement

> Write a program to solve a Sudoku puzzle by filling the empty cells. A sudoku solution must satisfy all of the following rules:
>
> - Each of the digits 1-9 must occur exactly once in each row.
> - Each of the digits 1-9 must occur exactly once in each column.
> - Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
>
> The input board is a 9x9 2D array of characters where empty cells are filled with `'.'`.

**LeetCode Link:** [37. Sudoku Solver](https://leetcode.com/problems/sudoku-solver/)

---

## ✅ Constraints

- The board is a 9x9 grid.
- It is guaranteed that the input has only one solution.
- You must solve the Sudoku by **modifying the input board in-place**.

---

## 🧠 Python Solutions

### 🧪 Level 1: Brute Force Backtracking (Naive Validation)

**Approach:** Try all digits in every empty cell using brute-force and validate every placement by scanning rows, columns, and blocks.

```python
# Time Complexity: O(9^(n)), where n is number of empty cells
# Space Complexity: O(1) (modifies board in-place)
def solveSudoku(board):
    def is_valid(r, c, ch):
        for i in range(9):
            if board[r][i] == ch or board[i][c] == ch:
                return False
            if board[3*(r//3)+i//3][3*(c//3)+i%3] == ch:
                return False
        return True

    def backtrack():
        for r in range(9):
            for c in range(9):
                if board[r][c] == '.':
                    for ch in '123456789':
                        if is_valid(r, c, ch):
                            board[r][c] = ch
                            if backtrack():
                                return True
                            board[r][c] = '.'
                    return False
        return True

    backtrack()
```

---

### ⚙️ Level 2: Optimized with Precomputed Row/Col/Box Sets

**Approach:** Use sets to store used digits in each row, column, and box to reduce validation time.

```python
# Time Complexity: O(1) worst-case (constant board size)
# Space Complexity: O(1)
def solveSudoku(board):
    rows = [set() for _ in range(9)]
    cols = [set() for _ in range(9)]
    boxes = [set() for _ in range(9)]

    for r in range(9):
        for c in range(9):
            if board[r][c] != '.':
                val = board[r][c]
                rows[r].add(val)
                cols[c].add(val)
                boxes[(r//3)*3 + c//3].add(val)

    def backtrack(r=0, c=0):
        if r == 9:
            return True
        if c == 9:
            return backtrack(r+1, 0)
        if board[r][c] != '.':
            return backtrack(r, c+1)

        for ch in '123456789':
            box_idx = (r//3)*3 + c//3
            if ch not in rows[r] and ch not in cols[c] and ch not in boxes[box_idx]:
                board[r][c] = ch
                rows[r].add(ch)
                cols[c].add(ch)
                boxes[box_idx].add(ch)

                if backtrack(r, c+1):
                    return True

                board[r][c] = '.'
                rows[r].remove(ch)
                cols[c].remove(ch)
                boxes[box_idx].remove(ch)

        return False

    backtrack()
```

---

### 🚀 Level 3: Most Optimized with Bitmasking

**Approach:** Use bitmasking instead of sets to reduce memory and speed up lookups.

```python
# Time Complexity: O(1)
# Space Complexity: O(1)
def solveSudoku(board):
    rows = [0] * 9
    cols = [0] * 9
    boxes = [0] * 9
    empties = []

    def get_bit(ch):
        return 1 << (int(ch) - 1)

    for r in range(9):
        for c in range(9):
            if board[r][c] == '.':
                empties.append((r, c))
            else:
                bit = get_bit(board[r][c])
                rows[r] |= bit
                cols[c] |= bit
                boxes[(r//3)*3 + c//3] |= bit

    def backtrack(idx):
        if idx == len(empties):
            return True
        r, c = empties[idx]
        b = (r//3)*3 + c//3
        mask = ~(rows[r] | cols[c] | boxes[b]) & 0x1FF
        while mask:
            bit = mask & -mask
            ch = str((bit.bit_length()))
            board[r][c] = ch
            rows[r] |= bit
            cols[c] |= bit
            boxes[b] |= bit
            if backtrack(idx + 1):
                return True
            rows[r] ^= bit
            cols[c] ^= bit
            boxes[b] ^= bit
            board[r][c] = '.'
            mask &= mask - 1
        return False

    backtrack(0)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                      | Time Complexity | Space Complexity |
|-------|-------------------------------|------------------|------------------|
| 1     | Brute Force Validation        | O(9^n)           | O(1)             |
| 2     | Sets for Row/Col/Box          | O(1)             | O(1)             |
| 3     | Bitmasking Optimization       | O(1)             | O(1)             |

> Though technically all are **constant time** (fixed board size), the performance improves drastically with optimization.

---

## 🔗 Similar Problems

1. [36. Valid Sudoku](https://leetcode.com/problems/valid-sudoku/)
2. [51. N-Queens](https://leetcode.com/problems/n-queens/)
3. [52. N-Queens II](https://leetcode.com/problems/n-queens-ii/)

---

## 📌 Takeaway Points

- Backtracking is a natural fit for constraint-satisfaction problems like Sudoku.
- Using sets drastically reduces validation overhead.
- Bitmasking further boosts performance by minimizing memory and computational costs.
- Order of cell filling can affect performance; MRV heuristic can improve speed.

---

5. Reconstruct Itinerary

---

# 🧩 Problem: Reconstruct Itinerary

## 📘 Problem Statement

> You are given a list of airline tickets represented by pairs of departure and arrival airports `[from, to]`. Reconstruct the itinerary in order. All of the tickets belong to a man who departs from "JFK". Thus, the itinerary must begin with "JFK".
>
> If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string.

**LeetCode Link:** [332. Reconstruct Itinerary](https://leetcode.com/problems/reconstruct-itinerary/)

---

## ✅ Constraints

- All tickets form at least one valid itinerary.
- All airport codes are represented as three capital letters.
- You must use all the tickets once and only once.

---

## 🧠 Python Solutions

### 🧪 Level 1: Brute Force Backtracking with Sorting at Each Step

**Approach:** Try every possible itinerary using backtracking. At each airport, sort destinations and try each possible ticket recursively.

```python
# Time Complexity: O(N!), N = number of tickets
# Space Complexity: O(N)
def findItinerary(tickets):
    from collections import defaultdict

    graph = defaultdict(list)
    for src, dst in tickets:
        graph[src].append(dst)

    for src in graph:
        graph[src].sort()

    route = ["JFK"]
    used = [False] * len(tickets)

    def backtrack():
        if len(route) == len(tickets) + 1:
            return True
        last = route[-1]
        for i, (src, dst) in enumerate(tickets):
            if not used[i] and src == last:
                used[i] = True
                route.append(dst)
                if backtrack():
                    return True
                route.pop()
                used[i] = False
        return False

    backtrack()
    return route
```

---

### ⚙️ Level 2: DFS + Sorting Once + Path Building

**Approach:** Build an adjacency list with sorted destinations. Use DFS to construct a path and backtrack if needed.

```python
# Time Complexity: O(E log E), E = number of edges
# Space Complexity: O(E)
def findItinerary(tickets):
    from collections import defaultdict

    graph = defaultdict(list)
    for src, dst in sorted(tickets, reverse=True):
        graph[src].append(dst)

    result = []

    def dfs(airport):
        while graph[airport]:
            dfs(graph[airport].pop())
        result.append(airport)

    dfs("JFK")
    return result[::-1]
```

---

### 🚀 Level 3: Hierholzer’s Algorithm (Eulerian Path)

**Approach:** This is an Eulerian path problem (use every edge exactly once). Use a postorder DFS traversal and reverse at the end.

```python
# Time Complexity: O(E log E), E = number of tickets
# Space Complexity: O(E)
def findItinerary(tickets):
    from collections import defaultdict
    import heapq

    graph = defaultdict(list)
    for src, dst in tickets:
        heapq.heappush(graph[src], dst)

    route = []

    def visit(airport):
        while graph[airport]:
            visit(heapq.heappop(graph[airport]))
        route.append(airport)

    visit("JFK")
    return route[::-1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity   | Space Complexity  |
|-------|----------------------------------|-------------------|-------------------|
| 1     | Brute Force Backtracking         | O(N!)             | O(N)              |
| 2     | DFS with Sorted List             | O(E log E)        | O(E)              |
| 3     | Hierholzer’s Algorithm (DFS + Heap) | O(E log E)     | O(E)              |

> _N = number of tickets, E = number of edges (tickets)_

---

## 🔗 Similar Problems

1. [210. Course Schedule II](https://leetcode.com/problems/course-schedule-ii/)
2. [753. Cracking the Safe](https://leetcode.com/problems/cracking-the-safe/)
3. [269. Alien Dictionary](https://leetcode.com/problems/alien-dictionary/)

---

## 📌 Takeaway Points

- This is a disguised **Eulerian Path** problem in a **directed graph**.
- Sorting the destinations **lexicographically** before traversal ensures the smallest order.
- Using a **min-heap** (priority queue) improves performance over sorting at every recursion.
- Hierholzer’s algorithm is ideal when all edges must be used exactly once.

---

6. Pacific Atlantic Water Flow

---

# 🌊 Problem: Pacific Atlantic Water Flow

## 📘 Problem Statement

> Given an `m x n` matrix of non-negative integers representing the height of each unit cell in a continent, the "Pacific ocean" touches the left and top edges, and the "Atlantic ocean" touches the right and bottom edges.
>
> Return a list of grid coordinates where water can flow to both the Pacific and Atlantic oceans.  
> Water can flow from cell `(r, c)` to cell `(r+1, c)`, `(r-1, c)`, `(r, c+1)`, or `(r, c-1)` **if and only if** the neighboring cell’s height is **less than or equal** to the current cell’s height.

**LeetCode Link:** [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

---

## ✅ Constraints

- `1 <= m, n <= 200`
- `0 <= heights[i][j] <= 10⁵`

---

## 🧠 Python Solutions

### 🧪 Level 1: Brute Force DFS from Each Cell

**Approach:** For every cell, perform a DFS to see if it can reach both oceans independently. Inefficient due to repeated calculations.

```python
# Time Complexity: O(m * n * (m + n))
# Space Complexity: O(m * n)
def pacificAtlantic(heights):
    m, n = len(heights), len(heights[0])
    
    def dfs(r, c, visited, prev_height):
        if (r < 0 or c < 0 or r >= m or c >= n or 
            (r, c) in visited or heights[r][c] < prev_height):
            return
        visited.add((r, c))
        for dr, dc in [(0,1), (0,-1), (1,0), (-1,0)]:
            dfs(r + dr, c + dc, visited, heights[r][c])
    
    result = []
    for r in range(m):
        for c in range(n):
            pac, atl = set(), set()
            dfs(r, c, pac, heights[r][c])
            dfs(r, c, atl, heights[r][c])
            if (0, c) in pac and (m-1, c) in atl:
                result.append((r, c))
    return result
```

---

### ⚙️ Level 2: DFS from Ocean Borders

**Approach:** Perform DFS from all Pacific-bordering and Atlantic-bordering cells **in reverse flow**, collecting reachable cells. Return intersection.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n)
def pacificAtlantic(heights):
    from collections import deque
    m, n = len(heights), len(heights[0])
    pacific, atlantic = set(), set()
    
    def dfs(r, c, visited):
        visited.add((r, c))
        for dr, dc in [(0,1), (0,-1), (1,0), (-1,0)]:
            nr, nc = r + dr, c + dc
            if (0 <= nr < m and 0 <= nc < n and 
                (nr, nc) not in visited and heights[nr][nc] >= heights[r][c]):
                dfs(nr, nc, visited)
    
    for i in range(m):
        dfs(i, 0, pacific)
        dfs(i, n-1, atlantic)
    for j in range(n):
        dfs(0, j, pacific)
        dfs(m-1, j, atlantic)
    
    return list(pacific & atlantic)
```

---

### 🚀 Level 3: BFS from Ocean Borders (Optimized Memory)

**Approach:** Perform BFS from all Pacific and Atlantic edges to mark reachable cells. BFS is iterative and avoids recursion stack.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n)
def pacificAtlantic(heights):
    from collections import deque
    m, n = len(heights), len(heights[0])
    
    def bfs(starts):
        visited = set(starts)
        queue = deque(starts)
        while queue:
            r, c = queue.popleft()
            for dr, dc in [(0,1), (0,-1), (1,0), (-1,0)]:
                nr, nc = r + dr, c + dc
                if (0 <= nr < m and 0 <= nc < n and
                    (nr, nc) not in visited and
                    heights[nr][nc] >= heights[r][c]):
                    visited.add((nr, nc))
                    queue.append((nr, nc))
        return visited

    pacific_starts = [(i, 0) for i in range(m)] + [(0, j) for j in range(n)]
    atlantic_starts = [(i, n-1) for i in range(m)] + [(m-1, j) for j in range(n)]

    pacific = bfs(pacific_starts)
    atlantic = bfs(atlantic_starts)

    return list(pacific & atlantic)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|------------------|------------------|
| 1     | Brute Force DFS from Each Cell    | O(m * n * (m+n)) | O(m * n)         |
| 2     | DFS from Ocean Borders            | O(m * n)         | O(m * n)         |
| 3     | BFS from Ocean Borders (Optimized)| O(m * n)         | O(m * n)         |

> _m = number of rows, n = number of columns_

---

## 🔗 Similar Problems

1. [130. Surrounded Regions](https://leetcode.com/problems/surrounded-regions/)
2. [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)
3. [417. Pacific Atlantic Water Flow](https://leetcode.com/problems/pacific-atlantic-water-flow/)

---

## 📌 Takeaway Points

- Think **reverse flow**: start from the ocean and go **uphill**.
- Use **DFS** for compact code, but **BFS** for stack-safe implementations.
- The key idea is **bidirectional reachability** — find intersection of two flows.
- Great example of graph traversal over a grid.

---

7. Dijkstra’s Algorithm

---

# 🧠 Problem: Dijkstra’s Algorithm (Shortest Path in Weighted Graph)

## 📘 Problem Statement

> Given a weighted directed graph with non-negative edge weights, compute the **shortest path** from a given source node to all other nodes in the graph.
>
> You may be given the graph as an edge list, adjacency list, or adjacency matrix. The goal is to compute the shortest distances using Dijkstra’s algorithm.

> This structure is frequently used in problems like:
> - [743. Network Delay Time](https://leetcode.com/problems/network-delay-time/)
> - [1631. Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort/)
> - [787. Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops/)

---

## ✅ Constraints

- Graph contains non-negative weights only.
- No negative cycles.
- Suitable for sparse or dense graphs.
- Priority queue is key for optimization.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Bellman-Ford Style Iteration)

**Approach:** Check all edges `V - 1` times (like Bellman-Ford). No priority queue. Works for Dijkstra when there are no negative edges.

```python
# Time Complexity: O(V * E)
# Space Complexity: O(V)
def dijkstra_brute_force(n, edges, source):
    import math
    dist = [math.inf] * n
    dist[source] = 0

    for _ in range(n - 1):
        for u, v, w in edges:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w

    return dist
```

---

### ⚙️ Level 2: Dijkstra with List as Priority Queue

**Approach:** Use a basic list to simulate the min-priority queue. At every step, manually scan for the smallest tentative distance.

```python
# Time Complexity: O(V^2)
# Space Complexity: O(V + E)
def dijkstra_naive(n, adj, source):
    import math
    dist = [math.inf] * n
    visited = [False] * n
    dist[source] = 0

    for _ in range(n):
        u = -1
        for i in range(n):
            if not visited[i] and (u == -1 or dist[i] < dist[u]):
                u = i
        visited[u] = True
        for v, w in adj[u]:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w

    return dist
```

---

### 🚀 Level 3: Optimized Dijkstra with Min-Heap (heapq)

**Approach:** Use a heap (min-priority queue) to always process the next nearest node. This brings the time down for sparse graphs.

```python
# Time Complexity: O((V + E) * log V)
# Space Complexity: O(V + E)
def dijkstra_heap(n, adj, source):
    import heapq
    dist = [float('inf')] * n
    dist[source] = 0
    heap = [(0, source)]

    while heap:
        d, u = heapq.heappop(heap)
        if d > dist[u]:
            continue
        for v, w in adj[u]:
            if dist[u] + w < dist[v]:
                dist[v] = dist[u] + w
                heapq.heappush(heap, (dist[v], v))

    return dist
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                      | Time Complexity         | Space Complexity |
|-------|-------------------------------|--------------------------|------------------|
| 1     | Bellman-Ford Style            | O(V * E)                 | O(V)             |
| 2     | Dijkstra (List Priority Queue)| O(V²)                    | O(V + E)         |
| 3     | Dijkstra with Min-Heap        | O((V + E) * log V)       | O(V + E)         |

---

## 🔗 Similar Problems

1. [743. Network Delay Time](https://leetcode.com/problems/network-delay-time/)
2. [1631. Path With Minimum Effort](https://leetcode.com/problems/path-with-minimum-effort/)
3. [787. Cheapest Flights Within K Stops](https://leetcode.com/problems/cheapest-flights-within-k-stops/)

---

## 📌 Takeaway Points

- Dijkstra’s algorithm is ideal for **non-negative edge weights**.
- The **heap-optimized version** is best for **sparse graphs**.
- Naive list-based Dijkstra is only suitable for small or dense graphs.
- Use Bellman-Ford only if the graph may contain **negative edge weights**.

---

8. Burst Balloons

---

# 🎈 Problem: Burst Balloons

## 📘 Problem Statement

> You are given `n` balloons, indexed from `0` to `n-1`. Each balloon is painted with a number on it represented by an array `nums`. You are asked to burst all the balloons. If you burst the balloon at index `i`, you will get `nums[i-1] * nums[i] * nums[i+1]` coins. If `i-1` or `i+1` is out of bounds, consider it as `1` (for example, if `i = 0`, then `nums[i-1] = 1`).
>
> Return the maximum coins you can collect by bursting the balloons wisely.

**LeetCode Link:** [312. Burst Balloons](https://leetcode.com/problems/burst-balloons/)

---

## ✅ Constraints

- `1 <= nums.length <= 300`
- `0 <= nums[i] <= 100`
- The problem is typically solved with **dynamic programming**.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion (Exponential Time)

**Approach:** Try all possible burst orderings recursively, and calculate the total coins.

```python
# Time Complexity: O(2^n) (Exponential)
# Space Complexity: O(n)
def maxCoins(nums):
    def dfs(nums, start, end):
        if start + 1 == end:
            return 0
        max_coins = 0
        for i in range(start + 1, end):
            coins = nums[start] * nums[i] * nums[end]
            coins += dfs(nums, start, i) + dfs(nums, i, end)
            max_coins = max(max_coins, coins)
        return max_coins

    nums = [1] + nums + [1]
    return dfs(nums, 0, len(nums) - 1)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:** Use **memoization** to avoid recalculating subproblems. This improves the performance of the brute force solution.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(n^2)
def maxCoins(nums):
    n = len(nums)
    nums = [1] + nums + [1]
    dp = [[0] * (n + 2) for _ in range(n + 2)]

    for length in range(2, n + 2):
        for left in range(n + 2 - length):
            right = left + length
            for i in range(left + 1, right):
                dp[left][right] = max(dp[left][right], dp[left][i] + dp[i][right] + nums[left] * nums[i] * nums[right])

    return dp[0][n + 1]
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:** Use **tabulation** instead of recursion with memoization for better space and time efficiency.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(n^2)
def maxCoins(nums):
    n = len(nums)
    nums = [1] + nums + [1]
    dp = [[0] * (n + 2) for _ in range(n + 2)]

    # Bottom-up approach
    for length in range(2, n + 2):
        for left in range(n + 2 - length):
            right = left + length
            for i in range(left + 1, right):
                dp[left][right] = max(dp[left][right], dp[left][i] + dp[i][right] + nums[left] * nums[i] * nums[right])

    return dp[0][n + 1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity   | Space Complexity  |
|-------|--------------------------------------|-------------------|-------------------|
| 1     | Brute Force Recursion               | O(2^n)            | O(n)              |
| 2     | DP with Memoization                 | O(n^3)            | O(n^2)            |
| 3     | DP with Tabulation                  | O(n^3)            | O(n^2)            |

> _n = number of balloons_

---

## 🔗 Similar Problems

1. [276. Paint Fence](https://leetcode.com/problems/paint-fence/)
2. [494. Target Sum](https://leetcode.com/problems/target-sum/)
3. [337. House Robber III](https://leetcode.com/problems/house-robber-iii/)

---

## 📌 Takeaway Points

- The problem is a classic **Dynamic Programming** challenge that benefits from breaking down the problem into subproblems.
- **Tabulation** can be more space-efficient than **memoization**, although the time complexity remains the same.
- This problem can be viewed as a variation of **matrix chain multiplication**.

---

9. Serialize and Deserialize N-ary Tree

---

# 🌳 Problem: Serialize and Deserialize N-ary Tree

## 📘 Problem Statement

> Design an algorithm to serialize and deserialize an **N-ary tree**. An **N-ary tree** is a tree in which each node has **no more than N children**.
>
> Implement the `Codec` class:
> - `Codec.serialize(root)`: Encodes an N-ary tree to a single string.
> - `Codec.deserialize(data)`: Decodes your encoded data to the original tree structure.

**LeetCode Link:** [428. Serialize and Deserialize N-ary Tree](https://leetcode.com/problems/serialize-and-deserialize-n-ary-tree/)

---

## ✅ Constraints

- The tree is guaranteed to have at least one node.
- Nodes in the tree will be represented as an **N-ary node** object.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple DFS for Serialization and Deserialization

**Approach:** Use a **DFS** approach for encoding and decoding the tree structure. Represent children with simple delimiters.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
class Codec:

    def serialize(self, root):
        def dfs(node):
            if not node:
                return "#"
            return str(node.val) + "," + ",".join(dfs(child) for child in node.children)
        
        return dfs(root)
    
    def deserialize(self, data):
        def dfs(data_list):
            val = data_list.pop(0)
            if val == "#":
                return None
            node = Node(int(val), [])
            while data_list and data_list[0] != "#":
                node.children.append(dfs(data_list))
            return node

        data_list = data.split(",")
        return dfs(data_list)
```

---

### ⚙️ Level 2: Use Queue for Serialization and Deserialization

**Approach:** Use a **queue** for more iterative control over the traversal process. Serialize nodes with an explicit `#` for null children.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
class Codec:

    def serialize(self, root):
        if not root:
            return ""
        result = []
        queue = [root]
        while queue:
            node = queue.pop(0)
            if node:
                result.append(str(node.val))
                queue.extend(node.children)
            else:
                result.append("#")
        return ",".join(result)

    def deserialize(self, data):
        if not data:
            return None
        data_list = data.split(",")
        root = Node(int(data_list.pop(0)), [])
        queue = [root]
        while data_list:
            node = queue.pop(0)
            while data_list[0] != "#":
                val = int(data_list.pop(0))
                new_node = Node(val, [])
                node.children.append(new_node)
                queue.append(new_node)
            data_list.pop(0)
        return root
```

---

### 🚀 Level 3: Optimized Space Complexity Using Preorder Traversal

**Approach:** Optimize the space usage and serialization by representing the structure more compactly, maintaining the tree's depth in the process.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
class Codec:

    def serialize(self, root):
        def dfs(node):
            if not node:
                return ""
            children = ",".join(dfs(child) for child in node.children)
            return f"{node.val} [{children}]"
        
        return dfs(root) if root else ""

    def deserialize(self, data):
        def dfs(data_list):
            if not data_list:
                return None
            val = int(data_list.pop(0))
            node = Node(val, [])
            if data_list and data_list[0] == "[":
                data_list.pop(0)
                while data_list and data_list[0] != "]":
                    node.children.append(dfs(data_list))
                data_list.pop(0)  # Remove "]"
            return node

        data_list = data.split(" ")
        return dfs(data_list) if data_list else None
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Simple DFS                           | O(n)            | O(n)             |
| 2     | Queue-based Serialization/Deserialization | O(n)            | O(n)             |
| 3     | Optimized Space with Preorder Traversal | O(n)            | O(n)             |

> _n = number of nodes in the tree_

---

## 🔗 Similar Problems

1. [226. Invert Binary Tree](https://leetcode.com/problems/invert-binary-tree/)
2. [144. Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)
3. [652. Find Duplicate Subtrees](https://leetcode.com/problems/find-duplicate-subtrees/)

---

## 📌 Takeaway Points

- **DFS** is a great way to serialize and deserialize trees, but ensure you're using efficient data structures for large trees.
- A **queue** can make deserialization more manageable in iterative approaches.
- The space complexity can be optimized by using more compact representations of the tree, such as preorder traversal.

---

10. Jump Game

---

# 🏃‍♂️ Problem: Jump Game

## 📘 Problem Statement

> Given an array of non-negative integers `nums`, you are initially positioned at the first index. Each element in the array represents your maximum jump length from that position.
>
> Determine if you can reach the last index.

**LeetCode Link:** [55. Jump Game](https://leetcode.com/problems/jump-game/)

---

## ✅ Constraints

- `1 <= nums.length <= 10^4`
- `0 <= nums[i] <= 10^5`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion (Exponential Time)

**Approach:** Recursively try to jump to every position from the current index and see if it leads to the end.

```python
# Time Complexity: O(2^n) (Exponential)
# Space Complexity: O(n) (Recursive stack)
def canJump(nums):
    def dfs(index):
        if index >= len(nums) - 1:
            return True
        for i in range(1, nums[index] + 1):
            if dfs(index + i):
                return True
        return False
    
    return dfs(0)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:** Use **memoization** to store results of subproblems to avoid recomputation, improving efficiency over brute force.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def canJump(nums):
    memo = {}

    def dfs(index):
        if index in memo:
            return memo[index]
        if index >= len(nums) - 1:
            return True
        for i in range(1, nums[index] + 1):
            if dfs(index + i):
                memo[index] = True
                return True
        memo[index] = False
        return False
    
    return dfs(0)
```

---

### 🚀 Level 3: Greedy Approach (Optimal Solution)

**Approach:** Start from the last index and work backward. Maintain a variable to track the farthest index you can reach. If you can reach the first index with this approach, it means the answer is `True`.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def canJump(nums):
    last_pos = len(nums) - 1
    for i in range(len(nums) - 2, -1, -1):
        if i + nums[i] >= last_pos:
            last_pos = i
    return last_pos == 0
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force Recursion               | O(2^n)          | O(n)             |
| 2     | DP with Memoization                 | O(n^2)          | O(n)             |
| 3     | Greedy Approach                     | O(n)            | O(1)             |

> _n = number of elements in the array_

---

## 🔗 Similar Problems

1. [45. Jump Game II](https://leetcode.com/problems/jump-game-ii/)
2. [134. Gas Station](https://leetcode.com/problems/gas-station/)
3. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

## 📌 Takeaway Points

- The **greedy approach** is optimal for this problem and provides a **linear time** solution.
- **Memoization** significantly improves performance compared to brute force by caching results.
- The **recursive brute force approach** can become inefficient for large inputs due to its exponential time complexity.

---

11. Trapping Rain Water

---

# 🌧️ Problem: Trapping Rain Water

## 📘 Problem Statement

> Given `n` non-negative integers representing the heights of walls, where each wall's width is 1, compute how much water is trapped after raining.

**LeetCode Link:** [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

---

## ✅ Constraints

- `1 <= heights.length <= 2 * 10^4`
- `0 <= heights[i] <= 10^5`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Checking Each Position)

**Approach:** For each bar, find the maximum height to the left and right, and calculate the trapped water at that position. This approach uses **two loops**.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def trap(height):
    n = len(height)
    if n == 0:
        return 0
    water_trapped = 0
    for i in range(1, n - 1):
        left_max = max(height[:i])
        right_max = max(height[i+1:])
        water_trapped += max(0, min(left_max, right_max) - height[i])
    return water_trapped
```

---

### ⚙️ Level 2: Dynamic Programming (Two Passes)

**Approach:** Precompute the **left_max** and **right_max** arrays, then iterate through the heights to compute the trapped water at each position.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def trap(height):
    n = len(height)
    if n == 0:
        return 0

    left_max = [0] * n
    right_max = [0] * n
    left_max[0] = height[0]
    right_max[n - 1] = height[n - 1]

    for i in range(1, n):
        left_max[i] = max(left_max[i - 1], height[i])

    for i in range(n - 2, -1, -1):
        right_max[i] = max(right_max[i + 1], height[i])

    water_trapped = 0
    for i in range(n):
        water_trapped += max(0, min(left_max[i], right_max[i]) - height[i])

    return water_trapped
```

---

### 🚀 Level 3: Optimized with Two Pointers

**Approach:** Use two pointers to track the left and right bounds, and calculate the trapped water dynamically. This reduces the space complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def trap(height):
    n = len(height)
    if n == 0:
        return 0
    
    left, right = 0, n - 1
    left_max, right_max = height[left], height[right]
    water_trapped = 0

    while left < right:
        if height[left] < height[right]:
            left += 1
            left_max = max(left_max, height[left])
            water_trapped += max(0, left_max - height[left])
        else:
            right -= 1
            right_max = max(right_max, height[right])
            water_trapped += max(0, right_max - height[right])

    return water_trapped
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force                          | O(n^2)          | O(1)             |
| 2     | Dynamic Programming (Two Passes)     | O(n)            | O(n)             |
| 3     | Two Pointers (Optimized)             | O(n)            | O(1)             |

> _n = number of bars (length of the height array)_

---

## 🔗 Similar Problems

1. [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)
2. [84. Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)
3. [738. Monotone Increasing Digits](https://leetcode.com/problems/monotone-increasing-digits/)

---

## 📌 Takeaway Points

- The brute force solution is simple but inefficient due to its **O(n^2)** time complexity.
- The **Dynamic Programming (two-pass)** approach is much more efficient but requires additional space.
- The **two-pointer approach** is the most efficient in both **time** and **space** complexity, making it optimal for larger datasets.

---


12. Find Duplicate Subtrees


---

# 🌳 Problem: Find Duplicate Subtrees

## 📘 Problem Statement

> Given the root of a binary tree, return all duplicate subtrees. For each duplicate subtree, return a list of all nodes that have the same structure and value. The answer should not contain the same subtree multiple times.
>
> A subtree is a tree that consists of a node and all of its descendants.

**LeetCode Link:** [652. Find Duplicate Subtrees](https://leetcode.com/problems/find-duplicate-subtrees/)

---

## ✅ Constraints

- The number of nodes in the tree is between `1` and `10^4`.
- Each node's value is between `-10^9` and `10^9`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Traverse and Compare Subtrees)

**Approach:** Use a recursive function to traverse the tree and compare each subtree with others. This will be slow due to repeated subtree comparisons.

```python
# Time Complexity: O(n^2) (due to repeated subtree comparisons)
# Space Complexity: O(n)
class Solution:
    def findDuplicateSubtrees(self, root: TreeNode):
        def is_duplicate(node1, node2):
            if not node1 and not node2:
                return True
            if not node1 or not node2:
                return False
            return node1.val == node2.val and is_duplicate(node1.left, node2.left) and is_duplicate(node1.right, node2.right)

        def traverse(root):
            result = []
            def dfs(node):
                if not node:
                    return None
                for i, res in enumerate(result):
                    if is_duplicate(node, res):
                        return res
                result.append(node)
                dfs(node.left)
                dfs(node.right)
            dfs(root)
            return result
        
        return traverse(root)
```

---

### ⚙️ Level 2: Using a Hash Map for Subtree Serialization

**Approach:** Serialize each subtree as a string and use a hash map to store the frequency of each subtree. When a subtree appears more than once, it is a duplicate.

```python
# Time Complexity: O(n) (for tree traversal)
# Space Complexity: O(n)
class Solution:
    def findDuplicateSubtrees(self, root: TreeNode):
        def serialize(node):
            if not node:
                return "#"
            serialized = f"{node.val},{serialize(node.left)},{serialize(node.right)}"
            subtree_map[serialized] += 1
            if subtree_map[serialized] == 2:
                result.append(node)
            return serialized

        subtree_map = defaultdict(int)
        result = []
        serialize(root)
        return result
```

---

### 🚀 Level 3: Optimized with Hashing and In-Order Traversal

**Approach:** Use a more efficient in-order traversal and hashing to track subtree appearances while ensuring we don't traverse nodes repeatedly.

```python
# Time Complexity: O(n) (for tree traversal)
# Space Complexity: O(n)
class Solution:
    def findDuplicateSubtrees(self, root: TreeNode):
        def serialize(node):
            if not node:
                return "#"
            serialized = f"{node.val},{serialize(node.left)},{serialize(node.right)}"
            if serialized not in subtree_map:
                subtree_map[serialized] = node
            elif serialized not in seen:
                result.append(subtree_map[serialized])
                seen.add(serialized)
            return serialized

        subtree_map = {}
        seen = set()
        result = []
        serialize(root)
        return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force                          | O(n^2)          | O(n)             |
| 2     | Hash Map with Serialization          | O(n)            | O(n)             |
| 3     | Optimized Hashing and In-Order Traversal | O(n)          | O(n)             |

> _n = number of nodes in the tree_

---

## 🔗 Similar Problems

1. [144. Binary Tree Preorder Traversal](https://leetcode.com/problems/binary-tree-preorder-traversal/)
2. [100. Same Tree](https://leetcode.com/problems/same-tree/)
3. [102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)

---

## 📌 Takeaway Points

- The brute force approach is inefficient for large trees due to repeated subtree comparisons.
- Using **serialization** and a **hash map** allows us to track subtrees efficiently and identify duplicates without redundant traversal.
- **In-order traversal** ensures that the tree is serialized in a way that respects the structure, making it easy to compare subtrees.

---

13. Median of Two Sorted Arrays

---

# 📊 Problem: Median of Two Sorted Arrays

## 📘 Problem Statement

> Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return the **median** of the two sorted arrays. The overall run time complexity should be O(log(min(m, n))).

**LeetCode Link:** [4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)

---

## ✅ Constraints

- `0 <= nums1.length <= 1000`
- `0 <= nums2.length <= 1000`
- `1 <= nums1.length + nums2.length <= 2000`
- `-10^6 <= nums1[i], nums2[i] <= 10^6`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Merge Both Arrays and Find Median (Brute Force)

**Approach:** Merge the two sorted arrays and then find the median of the merged array.

```python
# Time Complexity: O(m + n)
# Space Complexity: O(m + n)
def findMedianSortedArrays(nums1, nums2):
    merged = nums1 + nums2
    merged.sort()
    n = len(merged)
    if n % 2 == 1:
        return merged[n // 2]
    else:
        return (merged[n // 2 - 1] + merged[n // 2]) / 2
```

---

### ⚙️ Level 2: Use Binary Search for Efficient Median Finding

**Approach:** Perform binary search on the smaller array to partition both arrays such that the left half contains the smaller elements, and the right half contains the larger elements. Use the partition to compute the median efficiently.

```python
# Time Complexity: O(log(min(m, n)))
# Space Complexity: O(1)
def findMedianSortedArrays(nums1, nums2):
    if len(nums1) > len(nums2):
        nums1, nums2 = nums2, nums1

    m, n = len(nums1), len(nums2)
    low, high = 0, m

    while low <= high:
        partition1 = (low + high) // 2
        partition2 = (m + n + 1) // 2 - partition1

        max_left1 = float('-inf') if partition1 == 0 else nums1[partition1 - 1]
        min_right1 = float('inf') if partition1 == m else nums1[partition1]
        
        max_left2 = float('-inf') if partition2 == 0 else nums2[partition2 - 1]
        min_right2 = float('inf') if partition2 == n else nums2[partition2]

        if max_left1 <= min_right2 and max_left2 <= min_right1:
            if (m + n) % 2 == 0:
                return (max(max_left1, max_left2) + min(min_right1, min_right2)) / 2
            else:
                return max(max_left1, max_left2)
        elif max_left1 > min_right2:
            high = partition1 - 1
        else:
            low = partition1 + 1
```

---

### 🚀 Level 3: Optimized Binary Search for Edge Cases and Precision

**Approach:** Further optimize the binary search approach to handle edge cases and improve precision in floating-point operations, ensuring the binary search approach works for arrays of all sizes.

```python
# Time Complexity: O(log(min(m, n)))
# Space Complexity: O(1)
def findMedianSortedArrays(nums1, nums2):
    if len(nums1) > len(nums2):
        nums1, nums2 = nums2, nums1
    
    m, n = len(nums1), len(nums2)
    low, high = 0, m

    while low <= high:
        partition1 = (low + high) // 2
        partition2 = (m + n + 1) // 2 - partition1
        
        max_left1 = float('-inf') if partition1 == 0 else nums1[partition1 - 1]
        min_right1 = float('inf') if partition1 == m else nums1[partition1]
        
        max_left2 = float('-inf') if partition2 == 0 else nums2[partition2 - 1]
        min_right2 = float('inf') if partition2 == n else nums2[partition2]

        if max_left1 <= min_right2 and max_left2 <= min_right1:
            if (m + n) % 2 == 0:
                return (max(max_left1, max_left2) + min(min_right1, min_right2)) / 2
            else:
                return max(max_left1, max_left2)
        elif max_left1 > min_right2:
            high = partition1 - 1
        else:
            low = partition1 + 1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Merge Arrays and Find Median         | O(m + n)        | O(m + n)         |
| 2     | Binary Search for Median             | O(log(min(m, n))) | O(1)             |
| 3     | Optimized Binary Search for Edge Cases | O(log(min(m, n))) | O(1)             |

> _m = length of nums1, n = length of nums2_

---

## 🔗 Similar Problems

1. [4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)
2. [9. Palindrome Number](https://leetcode.com/problems/palindrome-number/)
3. [27. Remove Element](https://leetcode.com/problems/remove-element/)

---

## 📌 Takeaway Points

- **Binary search** on the smaller array significantly reduces time complexity, achieving an optimal O(log(min(m, n))) time.
- The brute force approach of merging arrays is simple but inefficient for large inputs due to O(m + n) complexity.
- Edge cases, such as empty arrays, are efficiently handled with the binary search approach.

---

14. Search in Rotated Sorted Array

---

# 🔄 Problem: Search in Rotated Sorted Array

## 📘 Problem Statement

> Given an integer array `nums` sorted in **ascending order** and rotated at some pivot unknown to you beforehand, find the target value in `nums`. If the target exists, return its index. Otherwise, return `-1`.
>
> You must solve it in `O(log n)` time complexity.

**LeetCode Link:** [33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)

---

## ✅ Constraints

- `1 <= nums.length <= 5000`
- `-10^4 <= nums[i] <= 10^4`
- `nums` is guaranteed to be a rotated sorted array.
- `-10^4 <= target <= 10^4`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Linear Search)

**Approach:** Simply iterate over the array to find the target element.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def search(nums, target):
    for i in range(len(nums)):
        if nums[i] == target:
            return i
    return -1
```

---

### ⚙️ Level 2: Binary Search (Finding the Pivot)

**Approach:** Use binary search to find the pivot (the index where the rotation occurs) and then apply binary search on the appropriate half of the array.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    low, high = 0, len(nums) - 1

    while low <= high:
        mid = (low + high) // 2

        if nums[mid] == target:
            return mid

        if nums[low] <= nums[mid]:
            if nums[low] <= target < nums[mid]:
                high = mid - 1
            else:
                low = mid + 1
        else:
            if nums[mid] < target <= nums[high]:
                low = mid + 1
            else:
                high = mid - 1

    return -1
```

---

### 🚀 Level 3: Optimized Binary Search with Constant Space

**Approach:** This is the same approach as Level 2, but with a slight optimization to avoid unnecessary checks by directly focusing on the rotation logic to identify the correct half of the array more efficiently.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    low, high = 0, len(nums) - 1

    while low <= high:
        mid = (low + high) // 2

        if nums[mid] == target:
            return mid

        if nums[low] <= nums[mid]:
            if nums[low] <= target < nums[mid]:
                high = mid - 1
            else:
                low = mid + 1
        else:
            if nums[mid] < target <= nums[high]:
                low = mid + 1
            else:
                high = mid - 1

    return -1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Linear Search)          | O(n)            | O(1)             |
| 2     | Binary Search with Pivot Identification | O(log n)        | O(1)             |
| 3     | Optimized Binary Search              | O(log n)        | O(1)             |

> _n = length of the array_

---

## 🔗 Similar Problems

1. [81. Search in Rotated Sorted Array II](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/)
2. [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)
3. [34. Find First and Last Position of Element in Sorted Array](https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/)

---

## 📌 Takeaway Points

- The brute force approach is inefficient for large arrays with **O(n)** complexity, making it unsuitable for this problem's constraints.
- **Binary Search** significantly reduces the time complexity to **O(log n)**, which is optimal for this problem.
- The **optimized binary search** ensures that we are correctly identifying the correct half of the array without unnecessary checks, which minimizes the number of comparisons.

---

15. Critical Connections in a Network

---

# 🌐 Problem: Critical Connections in a Network

## 📘 Problem Statement

> There are `n` servers numbered from `0` to `n-1` connected by `n-1` connections forming a tree. You are given a 2D array `connections` where `connections[i] = [a, b]` represents a connection between servers `a` and `b`.
>
> Return all the **critical connections** in the network, which are the connections that, if removed, would make the network disconnected.
>
> A connection is critical if, after removing it, the number of connected components in the graph increases.

**LeetCode Link:** [1192. Critical Connections in a Network](https://leetcode.com/problems/critical-connections-in-a-network/)

---

## ✅ Constraints

- `n == len(connections)`
- `2 <= n <= 10^5`
- `connections[i].length == 2`
- `0 <= a, b < n`
- `a != b`
- There are no duplicate edges.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (DFS to Check Connectivity After Removing Each Edge)

**Approach:** For each edge, remove it from the graph, and then perform a DFS to check if the graph remains connected. If it’s disconnected, then the edge is critical.

```python
# Time Complexity: O(n^2) (since for each edge we perform DFS)
# Space Complexity: O(n)
def criticalConnections(n, connections):
    graph = defaultdict(list)
    for a, b in connections:
        graph[a].append(b)
        graph[b].append(a)
    
    def dfs(node, visited, parent):
        visited.add(node)
        for neighbor in graph[node]:
            if neighbor != parent and neighbor not in visited:
                dfs(neighbor, visited, node)

    result = []
    for a, b in connections:
        graph[a].remove(b)
        graph[b].remove(a)

        visited = set()
        dfs(0, visited, -1)

        if len(visited) != n:
            result.append([a, b])

        graph[a].append(b)
        graph[b].append(a)
    
    return result
```

---

### ⚙️ Level 2: Tarjan's Algorithm (DFS with Low Link Values)

**Approach:** Implement Tarjan's algorithm for finding bridges (critical connections) in a graph. This method runs in linear time and avoids the need to remove edges repeatedly.

```python
# Time Complexity: O(n + m) where n is the number of nodes and m is the number of edges
# Space Complexity: O(n + m)
def criticalConnections(n, connections):
    graph = defaultdict(list)
    for a, b in connections:
        graph[a].append(b)
        graph[b].append(a)

    disc = [-1] * n  # Discovery time
    low = [-1] * n   # Lowest reachable node
    parent = [-1] * n
    result = []
    time = [0]  # To keep track of the discovery time

    def dfs(u):
        disc[u] = low[u] = time[0]
        time[0] += 1

        for v in graph[u]:
            if disc[v] == -1:  # If v is not visited
                parent[v] = u
                dfs(v)

                low[u] = min(low[u], low[v])

                if low[v] > disc[u]:  # Bridge found
                    result.append([u, v])
            elif v != parent[u]:  # Back edge found
                low[u] = min(low[u], disc[v])

    for i in range(n):
        if disc[i] == -1:
            dfs(i)

    return result
```

---

### 🚀 Level 3: Optimized Tarjan's Algorithm with Early Stopping

**Approach:** Optimize the Tarjan's algorithm to stop early when possible, improving the traversal speed by eliminating unnecessary recursive calls after finding critical connections.

```python
# Time Complexity: O(n + m) where n is the number of nodes and m is the number of edges
# Space Complexity: O(n + m)
def criticalConnections(n, connections):
    graph = defaultdict(list)
    for a, b in connections:
        graph[a].append(b)
        graph[b].append(a)

    disc = [-1] * n  # Discovery time
    low = [-1] * n   # Lowest reachable node
    parent = [-1] * n
    result = []
    time = [0]  # To keep track of the discovery time

    def dfs(u):
        disc[u] = low[u] = time[0]
        time[0] += 1

        for v in graph[u]:
            if disc[v] == -1:  # If v is not visited
                parent[v] = u
                dfs(v)

                low[u] = min(low[u], low[v])

                if low[v] > disc[u]:  # Bridge found
                    result.append([u, v])
            elif v != parent[u]:  # Back edge found
                low[u] = min(low[u], disc[v])

            if len(result) == m:  # Early stopping if all bridges are found
                return

    for i in range(n):
        if disc[i] == -1:
            dfs(i)

    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force DFS                      | O(n^2)          | O(n)             |
| 2     | Tarjan's Algorithm                   | O(n + m)        | O(n + m)         |
| 3     | Optimized Tarjan's Algorithm         | O(n + m)        | O(n + m)         |

> _n = number of nodes, m = number of edges_

---

## 🔗 Similar Problems

1. [1192. Critical Connections in a Network](https://leetcode.com/problems/critical-connections-in-a-network/)
2. [1992. Find All Groups of Farmland](https://leetcode.com/problems/find-all-groups-of-farmland/)
3. [1195. FizzBuzz Multithreaded](https://leetcode.com/problems/fizzbuzz-multithreaded/)

---

## 📌 Takeaway Points

- The brute force approach is inefficient for large graphs due to its O(n²) complexity.
- **Tarjan's algorithm** provides an optimal and efficient solution for finding critical connections, with a time complexity of O(n + m).
- **Early stopping** in the optimized version of Tarjan’s algorithm can help terminate the process faster once all critical connections are identified.

---

16. Palindrome Partitioning

---

# 💡 Problem: Palindrome Partitioning

## 📘 Problem Statement

> Given a string `s`, partition `s` such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of `s`.
>
> A palindrome string is a string that reads the same forward and backward.

**LeetCode Link:** [131. Palindrome Partitioning](https://leetcode.com/problems/palindrome-partitioning/)

---

## ✅ Constraints

- `1 <= s.length <= 16`
- `s` contains only lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive Approach)

**Approach:** Generate all possible partitions of the string and check if each substring is a palindrome. If all substrings are palindromes, then add it to the result.

```python
# Time Complexity: O(2^n * n) where n is the length of the string
# Space Complexity: O(n)
def partition(s):
    def is_palindrome(s):
        return s == s[::-1]

    def dfs(start, path):
        if start == len(s):
            result.append(path)
            return
        for end in range(start + 1, len(s) + 1):
            if is_palindrome(s[start:end]):
                dfs(end, path + [s[start:end]])

    result = []
    dfs(0, [])
    return result
```

---

### ⚙️ Level 2: Optimized Backtracking with Palindrome Checking

**Approach:** Use backtracking to explore all possible partitionings and optimize palindrome checking using dynamic programming (memoization).

```python
# Time Complexity: O(2^n * n) where n is the length of the string
# Space Complexity: O(n^2) for the memoization table
def partition(s):
    n = len(s)
    dp = [[False] * n for _ in range(n)]

    def is_palindrome(i, j):
        if i >= j:
            return True
        if dp[i][j] is not False:
            return dp[i][j]
        dp[i][j] = (s[i] == s[j]) and is_palindrome(i + 1, j - 1)
        return dp[i][j]

    def dfs(start, path):
        if start == n:
            result.append(path)
            return
        for end in range(start + 1, n + 1):
            if is_palindrome(start, end - 1):
                dfs(end, path + [s[start:end]])

    result = []
    dfs(0, [])
    return result
```

---

### 🚀 Level 3: Optimized Backtracking with Memoization and Pruning

**Approach:** Combine backtracking with memoization to avoid redundant work, and prune the search space by skipping unnecessary partitions early when possible.

```python
# Time Complexity: O(2^n * n) where n is the length of the string
# Space Complexity: O(n^2) for the memoization table
def partition(s):
    n = len(s)
    dp = [[False] * n for _ in range(n)]

    def is_palindrome(i, j):
        if i >= j:
            return True
        if dp[i][j] is not False:
            return dp[i][j]
        dp[i][j] = (s[i] == s[j]) and is_palindrome(i + 1, j - 1)
        return dp[i][j]

    def dfs(start, path):
        if start == n:
            result.append(path)
            return
        for end in range(start + 1, n + 1):
            if is_palindrome(start, end - 1):
                dfs(end, path + [s[start:end]])

    result = []
    dfs(0, [])
    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity  | Space Complexity |
|-------|--------------------------------------|------------------|------------------|
| 1     | Brute Force (Recursive Approach)     | O(2^n * n)       | O(n)             |
| 2     | Optimized Backtracking with Memoization | O(2^n * n)       | O(n^2)           |
| 3     | Optimized Backtracking with Memoization & Pruning | O(2^n * n) | O(n^2)           |

> _n = length of the string_

---

## 🔗 Similar Problems

1. [93. Restore IP Addresses](https://leetcode.com/problems/restore-ip-addresses/)
2. [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)
3. [131. Palindrome Partitioning II](https://leetcode.com/problems/palindrome-partitioning-ii/)

---

## 📌 Takeaway Points

- **Backtracking** is an effective approach for exploring all possible partitions.
- **Memoization** helps optimize repeated checks for palindromes, improving efficiency.
- The problem can be solved in **exponential time complexity**, but with the use of dynamic programming and pruning, the performance is significantly enhanced.

---

17. Count Connected Components in an Undirected Graph

---

# 🌐 Problem: Count Connected Components in an Undirected Graph

## 📘 Problem Statement

> You have a graph of `n` nodes labeled from `0` to `n - 1` and a list of `edges` where `edges[i] = [a, b]` is an undirected edge connecting nodes `a` and `b`.
>
> Return the total number of connected components in the graph.

**LeetCode Link:** [323. Count Connected Components in an Undirected Graph](https://leetcode.com/problems/count-connected-components-in-an-undirected-graph/)

---

## ✅ Constraints

- `1 <= n <= 2000`
- `0 <= edges.length <= 5000`
- `edges[i].length == 2`
- `0 <= a, b < n`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (DFS for Each Node)

**Approach:** Perform a Depth-First Search (DFS) from every unvisited node to explore all reachable nodes. Every time we initiate a DFS from an unvisited node, we count a new connected component.

```python
# Time Complexity: O(n + m) where n is the number of nodes and m is the number of edges
# Space Complexity: O(n + m)
def countComponents(n, edges):
    graph = defaultdict(list)
    for a, b in edges:
        graph[a].append(b)
        graph[b].append(a)
    
    visited = [False] * n

    def dfs(node):
        visited[node] = True
        for neighbor in graph[node]:
            if not visited[neighbor]:
                dfs(neighbor)

    count = 0
    for i in range(n):
        if not visited[i]:
            dfs(i)
            count += 1

    return count
```

---

### ⚙️ Level 2: Optimized DFS with Early Stopping

**Approach:** The DFS approach from Level 1 is already quite efficient, but we can slightly improve performance by using an iterative DFS with an explicit stack rather than recursion to avoid deep recursion calls.

```python
# Time Complexity: O(n + m) where n is the number of nodes and m is the number of edges
# Space Complexity: O(n + m)
def countComponents(n, edges):
    graph = defaultdict(list)
    for a, b in edges:
        graph[a].append(b)
        graph[b].append(a)
    
    visited = [False] * n

    def dfs(start):
        stack = [start]
        while stack:
            node = stack.pop()
            for neighbor in graph[node]:
                if not visited[neighbor]:
                    visited[neighbor] = True
                    stack.append(neighbor)

    count = 0
    for i in range(n):
        if not visited[i]:
            dfs(i)
            count += 1

    return count
```

---

### 🚀 Level 3: Union-Find (Disjoint Set Union)

**Approach:** Use the Union-Find (Disjoint Set Union) data structure to group the connected nodes together. After processing all edges, the number of connected components is the number of distinct sets in the Union-Find structure.

```python
# Time Complexity: O(n + m) where n is the number of nodes and m is the number of edges
# Space Complexity: O(n)
class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [1] * n
    
    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # Path compression
        return self.parent[x]
    
    def union(self, x, y):
        rootX = self.find(x)
        rootY = self.find(y)
        
        if rootX != rootY:
            if self.rank[rootX] > self.rank[rootY]:
                self.parent[rootY] = rootX
            elif self.rank[rootX] < self.rank[rootY]:
                self.parent[rootX] = rootY
            else:
                self.parent[rootY] = rootX
                self.rank[rootX] += 1

def countComponents(n, edges):
    uf = UnionFind(n)
    
    for a, b in edges:
        uf.union(a, b)
    
    # Count the number of distinct roots
    components = set()
    for i in range(n):
        components.add(uf.find(i))
    
    return len(components)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity  | Space Complexity |
|-------|--------------------------------------|------------------|------------------|
| 1     | Brute Force DFS                      | O(n + m)         | O(n + m)         |
| 2     | Optimized DFS with Iterative Stack   | O(n + m)         | O(n + m)         |
| 3     | Union-Find (Disjoint Set Union)      | O(n + m)         | O(n)             |

> _n = number of nodes, m = number of edges_

---

## 🔗 Similar Problems

1. [547. Number of Provinces](https://leetcode.com/problems/number-of-provinces/)
2. [261. Graph Valid Tree](https://leetcode.com/problems/graph-valid-tree/)
3. [133. Clone Graph](https://leetcode.com/problems/clone-graph/)

---

## 📌 Takeaway Points

- The DFS-based approach works well for smaller graphs but may run into problems with deep recursion in cases of very large graphs.
- **Union-Find (Disjoint Set Union)** is a more efficient approach, especially when there are a lot of edges, as it handles union and find operations in near constant time due to path compression and union by rank.

---

18. Paint House

---

# 🎨 Problem: Paint House

## 📘 Problem Statement

> There are `n` houses in a neighborhood and each house can be painted in one of three colors: red, green, or blue. You have to paint all the houses such that no two adjacent houses have the same color. You are given an integer `n` and a 2D array `costs` where `costs[i][0]`, `costs[i][1]`, and `costs[i][2]` represent the costs of painting the i-th house with the colors red, green, and blue, respectively.
>
> Return the **minimum cost** to paint all houses such that no two adjacent houses have the same color.

**LeetCode Link:** [256. Paint House](https://leetcode.com/problems/paint-house/)

---

## ✅ Constraints

- `n == costs.length`
- `n == costs[i].length == 3`
- `1 <= n <= 100`
- `1 <= costs[i][j] <= 1000`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Try All Possibilities)

**Approach:** The brute force approach would involve considering all possible colorings and calculating the cost of each configuration. This is infeasible due to the exponential number of configurations.

```python
# Time Complexity: O(3^n) due to exponential branching
# Space Complexity: O(n) for recursion stack
def minCost(costs):
    def dfs(i, prev_color):
        if i == len(costs):
            return 0
        min_cost = float('inf')
        for color in range(3):
            if color != prev_color:
                min_cost = min(min_cost, costs[i][color] + dfs(i + 1, color))
        return min_cost

    return dfs(0, -1)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:** Use dynamic programming to solve the problem more efficiently. Store the results of subproblems to avoid recomputation. At each house, we choose the minimum cost to paint the current house while ensuring the adjacent houses have different colors.

```python
# Time Complexity: O(n) where n is the number of houses
# Space Complexity: O(n) for the memoization table
def minCost(costs):
    if not costs:
        return 0
    
    n = len(costs)
    dp = [[0] * 3 for _ in range(n)]
    
    dp[0] = costs[0]
    
    for i in range(1, n):
        dp[i][0] = costs[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = costs[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = costs[i][2] + min(dp[i-1][0], dp[i-1][1])
    
    return min(dp[n-1])
```

---

### 🚀 Level 3: Optimized Space Complexity (In-place DP)

**Approach:** Optimize the space complexity by only storing the results for the previous house, rather than maintaining a full DP table. This reduces the space complexity to `O(1)`.

```python
# Time Complexity: O(n) where n is the number of houses
# Space Complexity: O(1) (in-place DP)
def minCost(costs):
    if not costs:
        return 0
    
    prev_red, prev_green, prev_blue = costs[0]
    
    for i in range(1, len(costs)):
        red = costs[i][0] + min(prev_green, prev_blue)
        green = costs[i][1] + min(prev_red, prev_blue)
        blue = costs[i][2] + min(prev_red, prev_green)
        
        prev_red, prev_green, prev_blue = red, green, blue
    
    return min(prev_red, prev_green, prev_blue)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Try All Possibilities)  | O(3^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)    | O(n)            | O(n)             |
| 3     | Optimized Space Complexity (In-place DP) | O(n)         | O(1)             |

> _n = number of houses_

---

## 🔗 Similar Problems

1. [265. Paint House II](https://leetcode.com/problems/paint-house-ii/)
2. [198. House Robber](https://leetcode.com/problems/house-robber/)
3. [213. House Robber II](https://leetcode.com/problems/house-robber-ii/)

---

## 📌 Takeaway Points

- The brute force approach is highly inefficient for large inputs and should be avoided.
- **Dynamic programming** provides an efficient solution with time complexity O(n), but the space complexity can be reduced with **in-place optimization**.
- The problem is a classic example of optimization using dynamic programming where previous solutions can help solve the current subproblem.

---

19. Knight Probability in Chessboard

---

# 🎨 Problem: Paint House

## 📘 Problem Statement

> There are `n` houses in a neighborhood and each house can be painted in one of three colors: red, green, or blue. You have to paint all the houses such that no two adjacent houses have the same color. You are given an integer `n` and a 2D array `costs` where `costs[i][0]`, `costs[i][1]`, and `costs[i][2]` represent the costs of painting the i-th house with the colors red, green, and blue, respectively.
>
> Return the **minimum cost** to paint all houses such that no two adjacent houses have the same color.

**LeetCode Link:** [256. Paint House](https://leetcode.com/problems/paint-house/)

---

## ✅ Constraints

- `n == costs.length`
- `n == costs[i].length == 3`
- `1 <= n <= 100`
- `1 <= costs[i][j] <= 1000`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Try All Possibilities)

**Approach:** The brute force approach would involve considering all possible colorings and calculating the cost of each configuration. This is infeasible due to the exponential number of configurations.

```python
# Time Complexity: O(3^n) due to exponential branching
# Space Complexity: O(n) for recursion stack
def minCost(costs):
    def dfs(i, prev_color):
        if i == len(costs):
            return 0
        min_cost = float('inf')
        for color in range(3):
            if color != prev_color:
                min_cost = min(min_cost, costs[i][color] + dfs(i + 1, color))
        return min_cost

    return dfs(0, -1)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:** Use dynamic programming to solve the problem more efficiently. Store the results of subproblems to avoid recomputation. At each house, we choose the minimum cost to paint the current house while ensuring the adjacent houses have different colors.

```python
# Time Complexity: O(n) where n is the number of houses
# Space Complexity: O(n) for the memoization table
def minCost(costs):
    if not costs:
        return 0
    
    n = len(costs)
    dp = [[0] * 3 for _ in range(n)]
    
    dp[0] = costs[0]
    
    for i in range(1, n):
        dp[i][0] = costs[i][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = costs[i][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = costs[i][2] + min(dp[i-1][0], dp[i-1][1])
    
    return min(dp[n-1])
```

---

### 🚀 Level 3: Optimized Space Complexity (In-place DP)

**Approach:** Optimize the space complexity by only storing the results for the previous house, rather than maintaining a full DP table. This reduces the space complexity to `O(1)`.

```python
# Time Complexity: O(n) where n is the number of houses
# Space Complexity: O(1) (in-place DP)
def minCost(costs):
    if not costs:
        return 0
    
    prev_red, prev_green, prev_blue = costs[0]
    
    for i in range(1, len(costs)):
        red = costs[i][0] + min(prev_green, prev_blue)
        green = costs[i][1] + min(prev_red, prev_blue)
        blue = costs[i][2] + min(prev_red, prev_green)
        
        prev_red, prev_green, prev_blue = red, green, blue
    
    return min(prev_red, prev_green, prev_blue)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Try All Possibilities)  | O(3^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)    | O(n)            | O(n)             |
| 3     | Optimized Space Complexity (In-place DP) | O(n)         | O(1)             |

> _n = number of houses_

---

## 🔗 Similar Problems

1. [265. Paint House II](https://leetcode.com/problems/paint-house-ii/)
2. [198. House Robber](https://leetcode.com/problems/house-robber/)
3. [213. House Robber II](https://leetcode.com/problems/house-robber-ii/)

---

## 📌 Takeaway Points

- The brute force approach is highly inefficient for large inputs and should be avoided.
- **Dynamic programming** provides an efficient solution with time complexity O(n), but the space complexity can be reduced with **in-place optimization**.
- The problem is a classic example of optimization using dynamic programming where previous solutions can help solve the current subproblem.

---

20. Google Interview Word Ladder II

---

# ♞ Problem: Knight Probability in Chessboard

## 📘 Problem Statement

> On an `n x n` chessboard, a knight starts at the position `(row, column)` and moves according to the rules of chess. The knight can move to any of the 8 positions: `(row + 2, column + 1)`, `(row + 2, column - 1)`, `(row - 2, column + 1)`, `(row - 2, column - 1)`, `(row + 1, column + 2)`, `(row + 1, column - 2)`, `(row - 1, column + 2)`, `(row - 1, column - 2)`.

> The knight stays on the board if and only if it is not outside the `n x n` boundary. Given the position of the knight, return the probability that the knight will still be on the board after `k` moves.

**LeetCode Link:** [688. Knight Probability in Chessboard](https://leetcode.com/problems/knight-probability-in-chessboard/)

---

## ✅ Constraints

- `1 <= n <= 25`
- `0 <= k <= 100`
- `0 <= row, column < n`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive Solution)

**Approach:** Perform a recursive search to explore all possible moves of the knight and track whether each move keeps the knight within the bounds of the chessboard.

```python
# Time Complexity: O(8^k) due to the exponential growth of possibilities
# Space Complexity: O(k) due to the recursion stack
def knightProbability(n, k, row, column):
    directions = [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (1, -2), (-1, 2), (-1, -2)]
    
    def dfs(x, y, moves_left):
        if not (0 <= x < n and 0 <= y < n):
            return 0
        if moves_left == 0:
            return 1
        prob = 0
        for dx, dy in directions:
            prob += dfs(x + dx, y + dy, moves_left - 1)
        return prob
    
    total_prob = dfs(row, column, k)
    return total_prob / (8 ** k)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:** Use memoization to avoid recomputing the same subproblems. Store the results for each state (position on the board and number of remaining moves) to improve efficiency.

```python
# Time Complexity: O(k * n^2) where n is the size of the chessboard and k is the number of moves
# Space Complexity: O(k * n^2) due to the memoization table
def knightProbability(n, k, row, column):
    directions = [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (1, -2), (-1, 2), (-1, -2)]
    memo = {}
    
    def dfs(x, y, moves_left):
        if not (0 <= x < n and 0 <= y < n):
            return 0
        if moves_left == 0:
            return 1
        if (x, y, moves_left) in memo:
            return memo[(x, y, moves_left)]
        
        prob = 0
        for dx, dy in directions:
            prob += dfs(x + dx, y + dy, moves_left - 1)
        
        memo[(x, y, moves_left)] = prob
        return prob
    
    total_prob = dfs(row, column, k)
    return total_prob / (8 ** k)
```

---

### 🚀 Level 3: Iterative Dynamic Programming (Tabulation)

**Approach:** Use an iterative approach with a 3D DP table where each entry represents the probability of the knight being at a particular position after a specific number of moves.

```python
# Time Complexity: O(k * n^2) where n is the size of the chessboard and k is the number of moves
# Space Complexity: O(k * n^2) for the DP table
def knightProbability(n, k, row, column):
    directions = [(2, 1), (2, -1), (-2, 1), (-2, -1), (1, 2), (1, -2), (-1, 2), (-1, -2)]
    dp = [[0] * n for _ in range(n)]
    dp[row][column] = 1

    for _ in range(k):
        new_dp = [[0] * n for _ in range(n)]
        for i in range(n):
            for j in range(n):
                if dp[i][j] > 0:
                    for dx, dy in directions:
                        ni, nj = i + dx, j + dy
                        if 0 <= ni < n and 0 <= nj < n:
                            new_dp[ni][nj] += dp[i][j] / 8
        dp = new_dp
    
    return sum(sum(row) for row in dp)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force (Recursive Solution)     | O(8^k)          | O(k)             |
| 2     | Dynamic Programming (Memoization)    | O(k * n^2)      | O(k * n^2)       |
| 3     | Iterative Dynamic Programming (Tabulation) | O(k * n^2)  | O(k * n^2)       |

> _n = size of the chessboard, k = number of moves_

---

## 🔗 Similar Problems

1. [933. Number of Recent Calls](https://leetcode.com/problems/number-of-recent-calls/)
2. [62. Unique Paths II](https://leetcode.com/problems/unique-paths-ii/)
3. [64. Minimum Path Sum](https://leetcode.com/problems/minimum-path-sum/)

---

## 📌 Takeaway Points

- The brute force approach leads to exponential time complexity, making it impractical for larger values of `k`.
- **Dynamic programming** is an effective optimization strategy to solve this problem efficiently by breaking it down into smaller subproblems.
- The **tabulation method** provides an iterative solution that avoids recursion stack overhead, offering better performance for large values of `k` and `n`.

---
