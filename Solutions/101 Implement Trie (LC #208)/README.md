
---

# ➕ Problem: Implement Trie (Prefix Tree)

## 📘 Problem Statement

> A **trie (pronounced as "try")** or **prefix tree** is a tree data structure used to efficiently store and retrieve keys in a dataset of strings.  
>  
> Implement the `Trie` class:
>
> - `Trie()` Initializes the trie object.
> - `void insert(String word)` Inserts the string `word` into the trie.
> - `boolean search(String word)` Returns `true` if the string `word` is in the trie (i.e., was inserted before), and `false` otherwise.
> - `boolean startsWith(String prefix)` Returns `true` if there is a previously inserted string that has the prefix `prefix`.

**LeetCode Link:** [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

---

```
Example 1:

Input:
["Trie", "insert", "search", "search", "startsWith", "insert", "search"]
[[], ["apple"], ["apple"], ["app"], ["app"], ["app"], ["app"]]

Output:
[null, null, true, false, true, null, true]
```

---

## ✅ Constraints

- `1 <= word.length, prefix.length <= 2000`
- `word` and `prefix` consist only of lowercase English letters.
- At most `3 * 10⁴` calls will be made to `insert`, `search`, and `startsWith`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force with List of Words

**Approach:**  
Maintain a list of inserted words and check for existence or prefix manually.

```python
# Time Complexity: insert/search/startsWith: O(n)
# Space Complexity: O(N * L) where N is number of words, L is average word length
class Trie:
    def __init__(self):
        self.words = []

    def insert(self, word: str) -> None:
        self.words.append(word)

    def search(self, word: str) -> bool:
        return word in self.words

    def startsWith(self, prefix: str) -> bool:
        return any(w.startswith(prefix) for w in self.words)
```

---

### ⚙️ Level 2: Trie with Dictionary Nodes

**Approach:**  
Use nested dictionaries to represent the trie structure.

```python
# Time Complexity: O(n) for all operations
# Space Complexity: O(N * L)
class Trie:
    def __init__(self):
        self.root = {}

    def insert(self, word: str) -> None:
        node = self.root
        for char in word:
            node = node.setdefault(char, {})
        node['#'] = True

    def search(self, word: str) -> bool:
        node = self.root
        for char in word:
            if char not in node:
                return False
            node = node[char]
        return '#' in node

    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for char in prefix:
            if char not in node:
                return False
            node = node[char]
        return True
```

---

### 🚀 Level 3: Trie with Node Class (Clean OOP)

**Approach:**  
Use a class-based TrieNode with dictionary children and an `is_end` flag.

```python
# Time Complexity: O(n) per operation
# Space Complexity: O(N * L)

class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end = False

class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word: str) -> None:
        node = self.root
        for c in word:
            if c not in node.children:
                node.children[c] = TrieNode()
            node = node.children[c]
        node.is_end = True

    def search(self, word: str) -> bool:
        node = self.root
        for c in word:
            if c not in node.children:
                return False
            node = node.children[c]
        return node.is_end

    def startsWith(self, prefix: str) -> bool:
        node = self.root
        for c in prefix:
            if c not in node.children:
                return False
            node = node.children[c]
        return True
```

---

## 🔗 Similar Problems

1. [211. Design Add and Search Words Data Structure](https://leetcode.com/problems/design-add-and-search-words-data-structure/)
2. [212. Word Search II](https://leetcode.com/problems/word-search-ii/)
3. [648. Replace Words](https://leetcode.com/problems/replace-words/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                     | Time Complexity (all ops) | Space Complexity |
|-------|------------------------------|----------------------------|------------------|
| 1     | List of Words                | O(n)                       | O(N * L)         |
| 2     | Nested Dict-based Trie       | O(n)                       | O(N * L)         |
| 3     | OOP TrieNode Implementation  | O(n)                       | O(N * L)         |

---

## 📌 Takeaway Points

- Tries are powerful for prefix-based lookup.
- Dictionary-based tries are quick and concise, but class-based tries are cleaner for large-scale design.
- Always use a terminal flag (like `is_end`) to mark word completions.

---
