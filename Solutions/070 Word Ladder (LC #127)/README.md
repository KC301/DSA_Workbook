
---

# ➕ Problem: Word Ladder

## 📘 Problem Statement

> Given two words, `beginWord` and `endWord`, and a dictionary of words, return the **length of the shortest transformation sequence** from `beginWord` to `endWord**, such that:
> 
> - Only one letter can be changed at a time.
> - Each transformed word must exist in the word list. Note that `beginWord` is not a transformed word.
> 
> Return the number of words in the shortest transformation sequence, including `beginWord` and `endWord`.

**LeetCode Link:** [127. Word Ladder](https://leetcode.com/problems/word-ladder/)

---

```
Example 1:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5
Explanation: As one example, the sequence "hit" -> "hot" -> "dot" -> "dog" -> "cog" is a valid transformation sequence, and there are 5 words in this sequence.

Example 2:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
Output: 0
Explanation: The endWord "cog" is not in the wordList, therefore no possible transformation.

```

---

## ✅ Constraints

- `1 <= beginWord.length <= 10`
- `1 <= endWord.length <= 10`
- `1 <= wordList.length <= 5000`
- `beginWord`, `endWord`, and `wordList[i]` consist of lowercase English letters.
- You may assume that `endWord` is not the same as `beginWord`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: BFS with Queue (Brute Force)

**Approach:**  
We can perform a **Breadth-First Search (BFS)** starting from the `beginWord`. At each step, change one letter and check if it forms a word in the word list. We process all reachable words level by level until we reach the `endWord`.

```python
# Time Complexity: O(N * 26 * M) where N is the length of wordList, M is the length of each word
# Space Complexity: O(N)
from collections import deque

def ladderLength(beginWord, endWord, wordList):
    if endWord not in wordList:
        return 0
    
    word_set = set(wordList)
    queue = deque([(beginWord, 1)])  # (word, current length of sequence)
    
    while queue:
        current_word, length = queue.popleft()
        
        for i in range(len(current_word)):
            for char in 'abcdefghijklmnopqrstuvwxyz':
                new_word = current_word[:i] + char + current_word[i+1:]
                
                if new_word == endWord:
                    return length + 1
                
                if new_word in word_set:
                    word_set.remove(new_word)  # Mark the word as visited
                    queue.append((new_word, length + 1))
    
    return 0
```

---

### ⚙️ Level 2: Optimized BFS with Early Exit

**Approach:**  
This is an optimized version of the BFS where we use a **set** to efficiently check word transformations. We also remove visited words immediately to avoid revisiting them.

```python
# Time Complexity: O(N * 26 * M) where N is the number of words and M is the length of each word
# Space Complexity: O(N)
from collections import deque

def ladderLength(beginWord, endWord, wordList):
    if endWord not in wordList:
        return 0
    
    word_set = set(wordList)
    queue = deque([(beginWord, 1)])  # (word, length of sequence)
    
    while queue:
        word, length = queue.popleft()
        
        for i in range(len(word)):
            for char in 'abcdefghijklmnopqrstuvwxyz':
                new_word = word[:i] + char + word[i+1:]
                
                if new_word == endWord:
                    return length + 1
                
                if new_word in word_set:
                    word_set.remove(new_word)
                    queue.append((new_word, length + 1))
    
    return 0
```

---

### 🚀 Level 3: BFS with Word Transforms and Visited Set

**Approach:**  
This approach ensures that we can return as soon as we reach the `endWord` and makes the BFS process efficient by removing words from the set as soon as we encounter them.

```python
# Time Complexity: O(N * 26 * M) where N is the number of words and M is the length of each word
# Space Complexity: O(N)
from collections import deque

def ladderLength(beginWord, endWord, wordList):
    if endWord not in wordList:
        return 0
    
    word_set = set(wordList)
    queue = deque([(beginWord, 1)])  # Initialize queue with (word, transformation length)
    
    while queue:
        word, length = queue.popleft()
        
        # Try transforming each letter of the current word
        for i in range(len(word)):
            for char in 'abcdefghijklmnopqrstuvwxyz':
                new_word = word[:i] + char + word[i+1:]
                
                if new_word == endWord:
                    return length + 1
                
                if new_word in word_set:
                    word_set.remove(new_word)  # Mark the word as visited
                    queue.append((new_word, length + 1))
    
    return 0
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity       | Space Complexity     |
|-------|------------------------------------|-----------------------|----------------------|
| 1     | BFS with Queue                    | O(N * 26 * M)         | O(N)                 |
| 2     | Optimized BFS with Early Exit     | O(N * 26 * M)         | O(N)                 |
| 3     | BFS with Word Transforms and Visited Set | O(N * 26 * M)     | O(N)                 |

---

## 🔗 Similar Problems

1. [126. Word Ladder II](https://leetcode.com/problems/word-ladder-ii/)
2. [433. Minimum Genetic Mutation](https://leetcode.com/problems/minimum-genetic-mutation/)
3. [1279. Rotate String](https://leetcode.com/problems/rotate-string/)

---

## 📌 Takeaway Points

- **BFS** is ideal for finding the shortest path in problems involving transformations between states.
- Use a **queue** to explore each word level by level, and apply **word transformations** efficiently by iterating through each character.
- **Early exit** and marking words as **visited** (by removing them from the word list) are key to optimizing the algorithm.

---
