
---

# ➕ Problem: Word Search II

## 📘 Problem Statement

> Given an `m x n` board of characters and a list of strings `words`, return **all words** on the board.  
> Each word must be constructed from letters of sequentially adjacent cells (horizontally or vertically neighboring).  
> The same letter cell may **not** be used more than once in a word.

**LeetCode Link:** [212. Word Search II](https://leetcode.com/problems/word-search-ii/)

---

```
Example 1:
Input: board = [["o","a","a","n"],
                ["e","t","a","e"],
                ["i","h","k","r"],
                ["i","f","l","v"]], 
       words = ["oath","pea","eat","rain"]

Output: ["eat","oath"]

Example 2:
Input: board = [["a","b"],["c","d"]], 
       words = ["abcb"]

Output: []
```

---

## ✅ Constraints

- `m == board.length`
- `n == board[i].length`
- `1 <= m, n <= 12`
- `board[i][j]` is a lowercase English letter.
- `1 <= words.length <= 3 * 10⁴`
- `1 <= words[i].length <= 10`
- All `words[i]` are unique.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force DFS for Each Word

**Approach:**  
Run a DFS for **each word** from **each cell**, checking if it matches letter-by-letter.

```python
# Time Complexity: O(M * N * W * L)
# Space Complexity: O(W * L)
def findWords(board, words):
    rows, cols = len(board), len(board[0])
    word_set = set(words)
    result = set()

    def dfs(r, c, word, index, visited):
        if index == len(word):
            return True
        if not (0 <= r < rows and 0 <= c < cols) or (r, c) in visited or board[r][c] != word[index]:
            return False

        visited.add((r, c))
        found = (dfs(r+1, c, word, index+1, visited) or
                 dfs(r-1, c, word, index+1, visited) or
                 dfs(r, c+1, word, index+1, visited) or
                 dfs(r, c-1, word, index+1, visited))
        visited.remove((r, c))
        return found

    for word in words:
        for r in range(rows):
            for c in range(cols):
                if dfs(r, c, word, 0, set()):
                    result.add(word)

    return list(result)
```

---

### ⚙️ Level 2: Trie + Backtracking Pruned by Prefix

**Approach:**  
Build a trie from `words`, and for each board cell, DFS only if the prefix is valid.

```python
# Time Complexity: O(M * N * 4^L)
# Space Complexity: O(N * L)
class TrieNode:
    def __init__(self):
        self.children = {}
        self.word = None

def findWords(board, words):
    root = TrieNode()
    for word in words:
        node = root
        for char in word:
            node = node.children.setdefault(char, TrieNode())
        node.word = word

    rows, cols = len(board), len(board[0])
    result = []

    def dfs(r, c, node):
        char = board[r][c]
        if char not in node.children:
            return

        next_node = node.children[char]
        if next_node.word:
            result.append(next_node.word)
            next_node.word = None  # avoid duplicates

        board[r][c] = '#'
        for dr, dc in [(-1,0),(1,0),(0,-1),(0,1)]:
            nr, nc = r+dr, c+dc
            if 0 <= nr < rows and 0 <= nc < cols and board[nr][nc] != '#':
                dfs(nr, nc, next_node)
        board[r][c] = char

    for r in range(rows):
        for c in range(cols):
            dfs(r, c, root)

    return result
```

---

### 🚀 Level 3: Optimized Trie with Pruning and Deletion

**Approach:**  
Enhance Level 2 by removing words and dead branches from the trie during traversal.

```python
# Time Complexity: O(M * N * 4^L)
# Space Complexity: O(N * L)
class TrieNode:
    def __init__(self):
        self.children = {}
        self.word = None

def findWords(board, words):
    root = TrieNode()
    for word in words:
        node = root
        for char in word:
            node = node.children.setdefault(char, TrieNode())
        node.word = word

    rows, cols = len(board), len(board[0])
    result = []

    def dfs(r, c, parent):
        char = board[r][c]
        node = parent.children[char]
        if node.word:
            result.append(node.word)
            node.word = None

        board[r][c] = '#'
        for dr, dc in [(-1,0),(1,0),(0,-1),(0,1)]:
            nr, nc = r+dr, c+dc
            if 0 <= nr < rows and 0 <= nc < cols and board[nr][nc] in node.children:
                dfs(nr, nc, node)
        board[r][c] = char

        if not node.children:
            parent.children.pop(char)

    for r in range(rows):
        for c in range(cols):
            if board[r][c] in root.children:
                dfs(r, c, root)

    return result
```

---

## 🔗 Similar Problems

1. [79. Word Search](https://leetcode.com/problems/word-search/)
2. [211. Design Add and Search Words Data Structure](https://leetcode.com/problems/design-add-and-search-words-data-structure/)
3. [1268. Search Suggestions System](https://leetcode.com/problems/search-suggestions-system/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity         | Space Complexity |
|-------|----------------------------------|--------------------------|------------------|
| 1     | DFS for Each Word                | O(M * N * W * L)         | O(W * L)         |
| 2     | Trie + DFS (Pruned)              | O(M * N * 4^L)           | O(N * L)         |
| 3     | Trie + DFS with Deletion         | O(M * N * 4^L) (faster)  | O(N * L)         |

---

## 📌 Takeaway Points

- Trie significantly reduces redundant DFS by pruning invalid prefixes early.
- Storing `word` in the trie node instead of marking with `is_word` improves clarity.
- Removing matched words from the trie avoids duplicates and unnecessary future searches.

---
