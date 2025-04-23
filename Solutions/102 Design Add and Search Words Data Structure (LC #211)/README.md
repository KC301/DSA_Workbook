
---

# ➕ Problem: Design Add and Search Words Data Structure

## 📘 Problem Statement

> Design a data structure that supports adding new words and finding if a string matches any previously added word.  
>
> Implement the `WordDictionary` class:
> - `WordDictionary()` Initializes the object.
> - `void addWord(word)` Adds `word` to the data structure.
> - `bool search(word)` Returns `true` if there is any string in the data structure that matches `word`. A word could contain the dot character `'.'` to represent any one letter.

**LeetCode Link:** [211. Design Add and Search Words Data Structure](https://leetcode.com/problems/design-add-and-search-words-data-structure/)

---

```
Example:

Input:
["WordDictionary","addWord","addWord","addWord","search","search","search","search"]
[[],["bad"],["dad"],["mad"],["pad"],["bad"],[".ad"],["b.."]]

Output:
[null,null,null,null,false,true,true,true]
```

---

## ✅ Constraints

- `1 <= word.length <= 25`
- `word` consists of lowercase English letters or `'.'`.
- At most `10⁴` function calls will be made.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force List Matching

**Approach:**  
Store all words in a list. On search, check all words manually and match `.` with any character.

```python
# Time Complexity: insert: O(1), search: O(N * L)
# Space Complexity: O(N * L)
class WordDictionary:
    def __init__(self):
        self.words = []

    def addWord(self, word: str) -> None:
        self.words.append(word)

    def search(self, word: str) -> bool:
        for w in self.words:
            if len(w) != len(word):
                continue
            for i in range(len(word)):
                if word[i] != '.' and word[i] != w[i]:
                    break
            else:
                return True
        return False
```

---

### ⚙️ Level 2: Trie with DFS for Dot Matching

**Approach:**  
Build a Trie, and use DFS when encountering `.` to try all paths.

```python
# Time Complexity: insert: O(n), search: O(26^d) in worst case with many '.'
# Space Complexity: O(N * L)
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False

class WordDictionary:
    def __init__(self):
        self.root = TrieNode()

    def addWord(self, word: str) -> None:
        node = self.root
        for c in word:
            if c not in node.children:
                node.children[c] = TrieNode()
            node = node.children[c]
        node.is_end = True

    def search(self, word: str) -> bool:
        def dfs(node, i):
            if i == len(word):
                return node.is_end
            if word[i] == '.':
                for child in node.children.values():
                    if dfs(child, i + 1):
                        return True
                return False
            if word[i] not in node.children:
                return False
            return dfs(node.children[word[i]], i + 1)

        return dfs(self.root, 0)
```

---

### 🚀 Level 3: Optimized Trie with Early Pruning

**Approach:**  
Same as Level 2 but with early pruning and minimized recursion when `.` is not involved.

```python
# Time Complexity: insert: O(n), search: best case close to O(n)
# Space Complexity: O(N * L)
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False

class WordDictionary:
    def __init__(self):
        self.root = TrieNode()

    def addWord(self, word: str) -> None:
        node = self.root
        for c in word:
            node = node.children.setdefault(c, TrieNode())
        node.is_end = True

    def search(self, word: str) -> bool:
        def dfs(node, i):
            if i == len(word):
                return node.is_end
            c = word[i]
            if c == '.':
                return any(dfs(child, i + 1) for child in node.children.values())
            return c in node.children and dfs(node.children[c], i + 1)
        return dfs(self.root, 0)
```

---

## 🔗 Similar Problems

1. [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)
2. [212. Word Search II](https://leetcode.com/problems/word-search-ii/)
3. [1268. Search Suggestions System](https://leetcode.com/problems/search-suggestions-system/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity (Search) | Space Complexity |
|-------|----------------------------------|---------------------------|------------------|
| 1     | List Brute Force                 | O(N * L)                  | O(N * L)         |
| 2     | Trie with DFS                    | O(26^d) in worst case     | O(N * L)         |
| 3     | Optimized Trie DFS               | Closer to O(n) avg case   | O(N * L)         |

---

## 📌 Takeaway Points

- A trie is perfect for prefix and wildcard string operations.
- DFS helps in handling the `.` wildcard efficiently.
- Optimizing trie nodes and early pruning improves performance especially for large datasets.

---
