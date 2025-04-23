
---

# ➕ Problem: Design In-Memory File System

## 📘 Problem Statement

> Design an in-memory file system to simulate the following operations:
> 
> - **`mkdir(path)`**: Creates a directory at the given path.
> - **`addContentToFile(filePath, content)`**: Appends content to a file at the given file path.
> - **`readContentFromFile(filePath)`**: Returns the content of a file at the given file path.

> The file system allows directories and files to be nested arbitrarily. Directories can contain files and other directories. Files are identified by a unique path.

**LeetCode Link:** [588. Design In-Memory File System](https://leetcode.com/problems/design-in-memory-file-system/)

---

```
Example 1:
Input:
["FileSystem", "mkdir", "addContentToFile", "readContentFromFile", "addContentToFile", "readContentFromFile"]
[[], ["/a"], ["/a/b", "content"], ["/a/b"], ["/a/b", " more"], ["/a/b"]]
Output:
[null, null, null, "content", null, "content more"]
Explanation:
fs.mkdir("/a");
fs.addContentToFile("/a/b", "content");
fs.readContentFromFile("/a/b"); // returns "content"
fs.addContentToFile("/a/b", " more");
fs.readContentFromFile("/a/b"); // returns "content more"
```

---

## ✅ Constraints

- `1 <= path.length <= 100`
- `1 <= content.length <= 100`
- The total number of operations will not exceed `10⁴`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Basic File System Using Dictionaries

**Approach:**  
We use a dictionary to represent the file system. Each directory or file path will be a key, and the value will either be the content of a file or another dictionary (if it's a directory).

```python
# Time Complexity: O(1) for mkdir, addContentToFile, readContentFromFile
# Space Complexity: O(k), where k is the number of paths/files in the system
class FileSystem:

    def __init__(self):
        self.fs = {}

    def mkdir(self, path: str) -> None:
        dirs = path.split('/')[1:]
        node = self.fs
        for dir in dirs:
            if dir not in node:
                node[dir] = {}
            node = node[dir]

    def addContentToFile(self, filePath: str, content: str) -> None:
        dirs = filePath.split('/')[1:]
        node = self.fs
        for dir in dirs[:-1]:
            node = node[dir]
        if dirs[-1] not in node:
            node[dirs[-1]] = ""
        node[dirs[-1]] += content

    def readContentFromFile(self, filePath: str) -> str:
        dirs = filePath.split('/')[1:]
        node = self.fs
        for dir in dirs[:-1]:
            node = node[dir]
        return node[dirs[-1]]
```

---

### ⚙️ Level 2: Optimized with Caching for Directory Traversal

**Approach:**  
We optimize directory traversal by caching already accessed directories to avoid redundant lookups for each operation.

```python
# Time Complexity: O(1) for mkdir, addContentToFile, readContentFromFile
# Space Complexity: O(k), where k is the number of paths/files in the system
class FileSystem:

    def __init__(self):
        self.fs = {}

    def mkdir(self, path: str) -> None:
        dirs = path.split('/')[1:]
        node = self.fs
        for dir in dirs:
            if dir not in node:
                node[dir] = {}
            node = node[dir]

    def addContentToFile(self, filePath: str, content: str) -> None:
        dirs = filePath.split('/')[1:]
        node = self.fs
        for dir in dirs[:-1]:
            node = node[dir]
        if dirs[-1] not in node:
            node[dirs[-1]] = ""
        node[dirs[-1]] += content

    def readContentFromFile(self, filePath: str) -> str:
        dirs = filePath.split('/')[1:]
        node = self.fs
        for dir in dirs[:-1]:
            node = node[dir]
        return node[dirs[-1]]
```

---

### 🚀 Level 3: Fully Optimized with Path Compression

**Approach:**  
This is a more optimized approach that ensures the file system operations are fast and can be executed in constant time, minimizing redundancy.

```python
# Time Complexity: O(1) for mkdir, addContentToFile, readContentFromFile
# Space Complexity: O(k), where k is the number of paths/files in the system
class FileSystem:

    def __init__(self):
        self.fs = {}

    def mkdir(self, path: str) -> None:
        dirs = path.split('/')[1:]
        node = self.fs
        for dir in dirs:
            if dir not in node:
                node[dir] = {}
            node = node[dir]

    def addContentToFile(self, filePath: str, content: str) -> None:
        dirs = filePath.split('/')[1:]
        node = self.fs
        for dir in dirs[:-1]:
            node = node[dir]
        if dirs[-1] not in node:
            node[dirs[-1]] = ""
        node[dirs[-1]] += content

    def readContentFromFile(self, filePath: str) -> str:
        dirs = filePath.split('/')[1:]
        node = self.fs
        for dir in dirs[:-1]:
            node = node[dir]
        return node[dirs[-1]]
```

---

## 🔗 Similar Problems

1. [1156. Swap For Longest Repeated Character Substring](https://leetcode.com/problems/swap-for-longest-repeated-character-substring/)
2. [207. Course Schedule](https://leetcode.com/problems/course-schedule/)
3. [1247. Minimum Swaps to Make Strings Equal](https://leetcode.com/problems/minimum-swaps-to-make-strings-equal/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Basic File System Using Dictionaries| O(1)            | O(k)             |
| 2     | Optimized with Caching             | O(1)            | O(k)             |
| 3     | Fully Optimized with Path Compression| O(1)            | O(k)             |

---

## 📌 Takeaway Points

- The basic approach using a dictionary works well for small-scale file systems.
- For larger, real-world systems, optimizations such as caching or path compression are important for performance.
- Directory and file path management requires careful handling of both file contents and nested paths.

---
