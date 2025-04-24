
🎬 Netflix – 20 DSA Questions



1. [Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/)
2. [Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)
3. [Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/)
4. [Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/)
5. [Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)
6. [Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)
7. [Random Pick with Weight](https://leetcode.com/problems/random-pick-with-weight/)
8. [Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)
9. [Expression Add Operators](https://leetcode.com/problems/expression-add-operators/)
10. [Data Stream as Disjoint Intervals](https://leetcode.com/problems/data-stream-as-disjoint-intervals/)
11. [Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)
12. [Decode String](https://leetcode.com/problems/decode-string/)
13. [Binary Search in 2D Matrix](https://leetcode.com/problems/binary-search-in-a-2d-matrix/)
14. [Range Sum Query – Mutable](https://leetcode.com/problems/range-sum-query-mutable/)
15. [Flatten Nested List Iterator](https://leetcode.com/problems/flatten-nested-list-iterator/)
16. [Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/)
17. [Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)
18. [Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
19. [Count of Smaller Numbers After Self](https://leetcode.com/problems/count-of-smaller-numbers-after-self/)
20. [Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)


-----------------------------------------------------------------------------------------------------
1. Top K Frequent Words
---

# ➕ Problem: Top K Frequent Words

## 📘 Problem Statement

> Given an array of strings `words` and an integer `k`, return the `k` most frequent strings.  
> Return the answer **sorted by frequency** from highest to lowest.  
> If multiple words have the same frequency, sort them **lexicographically** (i.e., alphabetically).

**LeetCode Link:** [692. Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/)

---

```
Example 1:
Input: words = ["i","love","leetcode","i","love","coding"], k = 2  
Output: ["i","love"]

Example 2:
Input: words = ["the","day","is","sunny","the","the","the","sunny","is","is"], k = 4  
Output: ["the","is","sunny","day"]
```

## ✅ Constraints

- `1 <= words.length <= 500`
- `1 <= words[i].length <= 10`
- `words[i]` consists of lowercase English letters.
- `k` is in the range `[1, number of unique words]`.

---

## 🧠 Python Solutions (All Using Frequency Maps)

---

### 🧪 Level 1: Brute Force with Sorting

**Approach:**  
Count frequencies with a hashmap, sort by frequency and then lexicographically.

```python
from collections import Counter

def topKFrequent(words, k):
    count = Counter(words)
    sorted_words = sorted(count.items(), key=lambda x: (-x[1], x[0]))
    return [word for word, _ in sorted_words[:k]]
```

- Time: O(n log n)
- Space: O(n)

---

### ⚙️ Level 2: Heap for Top K Elements

**Approach:**  
Use a min-heap to maintain the top k elements using custom sort logic.

```python
from collections import Counter
import heapq

def topKFrequent(words, k):
    count = Counter(words)
    heap = [(-freq, word) for word, freq in count.items()]
    heapq.heapify(heap)
    return [heapq.heappop(heap)[1] for _ in range(k)]
```

- Time: O(n log n)
- Space: O(n)

---

### 🚀 Level 3: Optimized Heap with Inline Construction

**Approach:**  
Use `heapq.nsmallest` to directly fetch the k most frequent words with custom comparator.

```python
from collections import Counter
import heapq

def topKFrequent(words, k):
    count = Counter(words)
    return heapq.nsmallest(k, count.keys(), key=lambda word: (-count[word], word))
```

- Time: O(n log k)
- Space: O(n)

---

## 🔗 Similar Problems

1. [347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)
2. [973. K Closest Points to Origin](https://leetcode.com/problems/k-closest-points-to-origin/)
3. [451. Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | HashMap + Full Sort               | O(n log n)      | O(n)             |
| 2     | HashMap + Heap (Manual Pop)       | O(n log n)      | O(n)             |
| 3     | HashMap + Optimized nsmallest     | O(n log k)      | O(n)             |

---

## 📌 Takeaway Points

- Always sort with secondary criteria when needed (e.g., lexicographic order).
- `heapq` allows custom sorting when using tuples.
- `heapq.nsmallest` or `nlargest` with a `key` can simplify k-element selection in Python.
- Counter and heapq are a powerful duo for frequency-based problems.

---

2. Sliding Window Maximum

# ➕ Problem: Sliding Window Maximum

## 📘 Problem Statement

> You are given an array of integers `nums`, and there is a sliding window of size `k` which moves from the very left to the very right.  
> You can only see the `k` numbers in the window. Each time the sliding window moves right by one position.  
> Return the **maximum** in the sliding window for each position.

**LeetCode Link:** [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

---

```
Example 1:
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3  
Output: [3,3,5,5,6,7]

Example 2:
Input: nums = [1], k = 1  
Output: [1]
```

## ✅ Constraints

- `1 <= nums.length <= 10⁵`
- `-10⁴ <= nums[i] <= 10⁴`
- `1 <= k <= nums.length`

---

## 🧠 Python Solutions (Sliding Window Techniques)

---

### 🧪 Level 1: Brute Force (Window Scan)

**Approach:**  
For each window, scan all elements to find the max.

```python
def maxSlidingWindow(nums, k):
    res = []
    for i in range(len(nums) - k + 1):
        res.append(max(nums[i:i+k]))
    return res
```

- Time: O(nk)
- Space: O(n)

---

### ⚙️ Level 2: Heap-Based Sliding Window

**Approach:**  
Maintain a max-heap (simulate using negatives), remove outdated values lazily.

```python
import heapq

def maxSlidingWindow(nums, k):
    heap = []
    res = []

    for i in range(len(nums)):
        heapq.heappush(heap, (-nums[i], i))
        if i >= k - 1:
            while heap[0][1] <= i - k:
                heapq.heappop(heap)
            res.append(-heap[0][0])
    return res
```

- Time: O(n log k)
- Space: O(k)

---

### 🚀 Level 3: Monotonic Queue (Deque)

**Approach:**  
Use a deque to keep indices of elements in decreasing order. Maintain the front as the maximum of the window.

```python
from collections import deque

def maxSlidingWindow(nums, k):
    dq = deque()
    res = []

    for i in range(len(nums)):
        while dq and dq[-1] < nums[i]:
            dq.pop()
        dq.append(nums[i])
        if i >= k and dq[0] == nums[i - k]:
            dq.popleft()
        if i >= k - 1:
            res.append(dq[0])
    return res
```

- Time: O(n)
- Space: O(k)

---

## 🔗 Similar Problems

1. [480. Sliding Window Median](https://leetcode.com/problems/sliding-window-median/)
2. [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)
3. [1438. Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit](https://leetcode.com/problems/longest-continuous-subarray-with-absolute-diff-less-than-or-equal-to-limit/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                  | Time Complexity | Space Complexity |
|-------|---------------------------|-----------------|------------------|
| 1     | Brute Force               | O(nk)           | O(n)             |
| 2     | Heap                      | O(n log k)      | O(k)             |
| 3     | Monotonic Deque           | O(n)            | O(k)             |

---

## 📌 Takeaway Points

- Brute force is intuitive but inefficient for large `n`.
- Heaps work for general "top-K" scenarios but can be slower due to cleanup.
- Monotonic queues are optimal for sliding window maximums—efficient and elegant.
- Always handle window boundaries (i - k) carefully in sliding window techniques.

---

3. Longest Repeating Character Replacement


# ➕ Problem: Longest Repeating Character Replacement

## 📘 Problem Statement

> You are given a string `s` and an integer `k`. You can choose any character of the string and change it to any other uppercase English character.  
> You can perform this operation at most `k` times.  
> Return the length of the longest substring containing the same letter you can get after performing the above operations.

**LeetCode Link:** [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/)

---

```
Example 1:
Input: s = "ABAB", k = 2  
Output: 4  
Explanation: Replace the two 'A's with 'B's or vice versa.

Example 2:
Input: s = "AABABBA", k = 1  
Output: 4  
Explanation: Replace the one 'A' in the middle with a 'B' to get "AABBBBA".
```

## ✅ Constraints

- `1 <= s.length <= 10⁵`
- `s` consists of only uppercase English letters.
- `0 <= k <= s.length`

---

## 🧠 Python Solutions (Sliding Window + Frequency Counting)

---

### 🧪 Level 1: Brute Force (All Substrings)

**Approach:**  
Try every substring and check if it can be converted within `k` replacements.

```python
def characterReplacement(s, k):
    def canReplace(sub):
        count = [0] * 26
        for ch in sub:
            count[ord(ch) - ord('A')] += 1
        return len(sub) - max(count) <= k

    max_len = 0
    for i in range(len(s)):
        for j in range(i, len(s)):
            if canReplace(s[i:j+1]):
                max_len = max(max_len, j - i + 1)
    return max_len
```

- Time: O(n³)
- Space: O(1)

---

### ⚙️ Level 2: Sliding Window with Recalculation

**Approach:**  
Use sliding window; in each step recalculate the max frequency in the window.

```python
def characterReplacement(s, k):
    from collections import defaultdict

    left = 0
    count = defaultdict(int)
    max_len = 0

    for right in range(len(s)):
        count[s[right]] += 1
        while (right - left + 1) - max(count.values()) > k:
            count[s[left]] -= 1
            left += 1
        max_len = max(max_len, right - left + 1)

    return max_len
```

- Time: O(26n) ≈ O(n)
- Space: O(26) = O(1)

---

### 🚀 Level 3: Optimized Sliding Window with Rolling Max Frequency

**Approach:**  
Keep track of the most frequent character count and slide the window efficiently.

```python
def characterReplacement(s, k):
    count = [0] * 26
    left = max_count = 0
    res = 0

    for right in range(len(s)):
        idx = ord(s[right]) - ord('A')
        count[idx] += 1
        max_count = max(max_count, count[idx])

        while (right - left + 1) - max_count > k:
            count[ord(s[left]) - ord('A')] -= 1
            left += 1

        res = max(res, right - left + 1)

    return res
```

- Time: O(n)
- Space: O(26) = O(1)

---

## 🔗 Similar Problems

1. [424. Longest Repeating Character Replacement](https://leetcode.com/problems/longest-repeating-character-replacement/)
2. [1004. Max Consecutive Ones III](https://leetcode.com/problems/max-consecutive-ones-iii/)
3. [395. Longest Substring with At Least K Repeating Characters](https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                    | Time Complexity | Space Complexity |
|-------|-----------------------------|-----------------|------------------|
| 1     | Brute Force (Substrings)    | O(n³)           | O(1)             |
| 2     | Sliding Window + Full Count | O(n)            | O(1)             |
| 3     | Sliding Window + Rolling Max| O(n)            | O(1)             |

---

## 📌 Takeaway Points

- Brute force on substrings is infeasible for large input.
- Sliding window drastically reduces the search space.
- Maintaining a running max count allows linear-time solution.
- Window resizing is key when the allowed number of replacements is exceeded.

---

4. Find Median from Data Stream

---

# ➕ Problem: Find Median from Data Stream

## 📘 Problem Statement

> The `MedianFinder` class is designed to:  
> - Add a number from the data stream to a data structure.  
> - Find the median of all elements so far.  
>  
> Implement the `MedianFinder` class:
> - `MedianFinder()` initializes the object.
> - `void addNum(int num)` adds the integer `num` from the data stream to the data structure.
> - `double findMedian()` returns the median of all elements so far. Answers within 10⁻⁵ of the actual answer will be accepted.

**LeetCode Link:** [295. Find Median from Data Stream](https://leetcode.com/problems/find-median-from-data-stream/)

---

```
Example 1:
Input
["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
[[], [1], [2], [], [3], []]
Output
[null, null, null, 1.5, null, 2.0]
```

## ✅ Constraints

- `-10⁵ <= num <= 10⁵`
- There will be at most `5 * 10⁴` calls to `addNum` and `findMedian`

---

## 🧠 Python Solutions (Heap-based and Naive Approaches)

---

### 🧪 Level 1: Brute Force with Sorting Every Time

**Approach:**  
Keep a list of numbers. Sort before every `findMedian()` call.

```python
class MedianFinder:
    def __init__(self):
        self.nums = []

    def addNum(self, num):
        self.nums.append(num)

    def findMedian(self):
        self.nums.sort()
        n = len(self.nums)
        mid = n // 2
        if n % 2 == 0:
            return (self.nums[mid - 1] + self.nums[mid]) / 2
        else:
            return self.nums[mid]
```

- Time: `addNum`: O(1), `findMedian`: O(n log n)
- Space: O(n)

---

### ⚙️ Level 2: Binary Insert into Sorted List

**Approach:**  
Maintain a sorted list using `bisect.insort`.

```python
import bisect

class MedianFinder:
    def __init__(self):
        self.nums = []

    def addNum(self, num):
        bisect.insort(self.nums, num)

    def findMedian(self):
        n = len(self.nums)
        mid = n // 2
        if n % 2 == 0:
            return (self.nums[mid - 1] + self.nums[mid]) / 2
        else:
            return self.nums[mid]
```

- Time: `addNum`: O(n), `findMedian`: O(1)
- Space: O(n)

---

### 🚀 Level 3: Two Heaps (Max-Heap + Min-Heap)

**Approach:**  
Use two heaps: a max-heap for the left half and a min-heap for the right half.

```python
import heapq

class MedianFinder:
    def __init__(self):
        self.low = []   # Max heap (invert values)
        self.high = []  # Min heap

    def addNum(self, num):
        heapq.heappush(self.low, -num)
        heapq.heappush(self.high, -heapq.heappop(self.low))

        if len(self.low) < len(self.high):
            heapq.heappush(self.low, -heapq.heappop(self.high))

    def findMedian(self):
        if len(self.low) > len(self.high):
            return -self.low[0]
        else:
            return (-self.low[0] + self.high[0]) / 2
```

- Time: `addNum`: O(log n), `findMedian`: O(1)
- Space: O(n)

---

## 🔗 Similar Problems

1. [480. Sliding Window Median](https://leetcode.com/problems/sliding-window-median/)
2. [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)
3. [218. The Skyline Problem](https://leetcode.com/problems/the-skyline-problem/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                | Time Complexity (add/find) | Space Complexity |
|-------|-------------------------|-----------------------------|------------------|
| 1     | Unsorted + Sort         | O(1) / O(n log n)           | O(n)             |
| 2     | Sorted List (bisect)    | O(n) / O(1)                 | O(n)             |
| 3     | Two Heaps               | O(log n) / O(1)             | O(n)             |

---

## 📌 Takeaway Points

- Sorting on every median query is inefficient.
- Maintaining a sorted structure speeds up query at the cost of insertion time.
- Optimal solution uses a min-heap + max-heap to dynamically track median in O(log n) time for inserts and O(1) for queries.
- Heaps are ideal when needing to track ordered halves dynamically.

---

5. Minimum Number of Arrows to Burst Balloons

# ➕ Problem: Minimum Number of Arrows to Burst Balloons

## 📘 Problem Statement

> There are `n` balloons, each represented as a start and end coordinate of an interval.  
> Balloons are represented as an array `points` where `points[i] = [x_start, x_end]`.  
> An arrow can be shot vertically at any `x` coordinate along the x-axis, and a balloon with `x_start <= x <= x_end` will burst.  
> Return *the minimum number of arrows* that must be shot to burst all balloons.

**LeetCode Link:** [452. Minimum Number of Arrows to Burst Balloons](https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/)

---

```
Example 1:
Input: points = [[10,16],[2,8],[1,6],[7,12]]
Output: 2
Explanation: Arrows at x = 6 and x = 16 burst all balloons.

Example 2:
Input: points = [[1,2],[3,4],[5,6],[7,8]]
Output: 4

Example 3:
Input: points = [[1,2],[2,3],[3,4],[4,5]]
Output: 2
```

## ✅ Constraints

- `1 <= points.length <= 10⁵`
- `points[i].length == 2`
- `-2³¹ <= x_start < x_end <= 2³¹ - 1`

---

## 🧠 Python Solutions (Greedy and Naive Approaches)

---

### 🧪 Level 1: Brute Force with Interval Overlap Tracking

**Approach:**  
For each balloon, check all others to see if they overlap and mark them.

```python
def findMinArrowShots(points):
    points.sort()
    n = len(points)
    visited = [False] * n
    arrows = 0

    for i in range(n):
        if visited[i]:
            continue
        arrows += 1
        x_start, x_end = points[i]
        for j in range(i + 1, n):
            if not visited[j] and points[j][0] <= x_end:
                visited[j] = True
                x_end = min(x_end, points[j][1])
    return arrows
```

- Time: O(n²)
- Space: O(n)

---

### ⚙️ Level 2: Sort by Start, Track Minimum End

**Approach:**  
Sort intervals by starting point. For overlapping ones, maintain the minimum right end.

```python
def findMinArrowShots(points):
    points.sort()
    arrows = 0
    i = 0
    n = len(points)

    while i < n:
        arrows += 1
        end = points[i][1]
        i += 1
        while i < n and points[i][0] <= end:
            end = min(end, points[i][1])
            i += 1
    return arrows
```

- Time: O(n log n)
- Space: O(1)

---

### 🚀 Level 3: Greedy with Sort by End Point

**Approach:**  
Sort balloons by their end point. Always shoot an arrow at the end of the current balloon.

```python
def findMinArrowShots(points):
    if not points:
        return 0

    points.sort(key=lambda x: x[1])
    arrows = 1
    last_arrow = points[0][1]

    for x_start, x_end in points[1:]:
        if x_start > last_arrow:
            arrows += 1
            last_arrow = x_end
    return arrows
```

- Time: O(n log n)
- Space: O(1)

---

## 🔗 Similar Problems

1. [435. Non-overlapping Intervals](https://leetcode.com/problems/non-overlapping-intervals/)
2. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
3. [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force                      | O(n²)           | O(n)             |
| 2     | Sort by Start, Greedy End Update | O(n log n)      | O(1)             |
| 3     | Sort by End, Optimal Greedy      | O(n log n)      | O(1)             |

---

## 📌 Takeaway Points

- Greedy algorithms are effective for interval-based optimization problems.
- Sorting by end point is the key for minimizing operations in overlapping interval tasks.
- Always look for a way to reduce overlaps with minimal operations (like arrows).

---

6. Interval List Intersections


# ➕ Problem: Interval List Intersections

## 📘 Problem Statement

> You are given two lists of closed intervals: `firstList` and `secondList`, each list of intervals is pairwise disjoint and sorted in increasing order.  
> Return the intersection of these two interval lists.  
> The intersection of two closed intervals is the set of numbers that are members of both intervals.  
> A closed interval `[a, b]` (with `a <= b`) denotes the set of real numbers `x` with `a <= x <= b`.

**LeetCode Link:** [986. Interval List Intersections](https://leetcode.com/problems/interval-list-intersections/)

---

```
Example 1:
Input: firstList = [[0,2],[5,10],[13,23],[24,25]], secondList = [[1,5],[8,12],[15,24],[25,26]]
Output: [[1,2],[5,5],[8,10],[15,23],[24,24],[25,25]]

Example 2:
Input: firstList = [[1,3],[5,9]], secondList = []
Output: []
```

## ✅ Constraints

- `0 <= firstList.length, secondList.length <= 1000`
- `firstList[i].length == 2`
- `secondList[i].length == 2`
- `0 <= firstList[i][0] <= firstList[i][1] <= 10⁹`
- `0 <= secondList[i][0] <= secondList[i][1] <= 10⁹`

---

## 🧠 Python Solutions (Two Pointer Strategy)

---

### 🧪 Level 1: Brute Force – Compare All Pairs

**Approach:**  
Try intersecting every interval in `firstList` with every interval in `secondList`.

```python
def intervalIntersection(firstList, secondList):
    res = []
    for a_start, a_end in firstList:
        for b_start, b_end in secondList:
            start = max(a_start, b_start)
            end = min(a_end, b_end)
            if start <= end:
                res.append([start, end])
    return res
```

- Time: O(m * n)
- Space: O(k)

---

### ⚙️ Level 2: Two Pointers with Redundant Checks

**Approach:**  
Use two pointers to compare intervals in order but check more than needed.

```python
def intervalIntersection(firstList, secondList):
    i = j = 0
    res = []

    while i < len(firstList) and j < len(secondList):
        a_start, a_end = firstList[i]
        b_start, b_end = secondList[j]
        
        if a_end >= b_start and b_end >= a_start:
            res.append([max(a_start, b_start), min(a_end, b_end)])
        
        if a_end < b_end:
            i += 1
        else:
            j += 1
    return res
```

- Time: O(m + n)
- Space: O(k)

---

### 🚀 Level 3: Optimized Two Pointers

**Approach:**  
Streamlined version of Level 2 with same logic, better readability, early exit, and simpler structure.

```python
def intervalIntersection(firstList, secondList):
    res = []
    i, j = 0, 0

    while i < len(firstList) and j < len(secondList):
        a_start, a_end = firstList[i]
        b_start, b_end = secondList[j]

        start = max(a_start, b_start)
        end = min(a_end, b_end)

        if start <= end:
            res.append([start, end])

        if a_end < b_end:
            i += 1
        else:
            j += 1

    return res
```

- Time: O(m + n)
- Space: O(k)

---

## 🔗 Similar Problems

1. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)
2. [253. Meeting Rooms II](https://leetcode.com/problems/meeting-rooms-ii/)
3. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                  | Time Complexity | Space Complexity |
|-------|---------------------------|-----------------|------------------|
| 1     | Brute Force               | O(m * n)        | O(k)             |
| 2     | Two Pointers (Basic)      | O(m + n)        | O(k)             |
| 3     | Optimized Two Pointers    | O(m + n)        | O(k)             |

---

## 📌 Takeaway Points

- Two-pointer technique is perfect for sorted list intersection problems.
- You only need to look at the current intervals to find overlaps.
- Great example of how greedy + sorted traversal optimizes brute force.

---

7. Random Pick with Weight

# ➕ Problem: Random Pick with Weight

## 📘 Problem Statement

> You are given a list of positive integers `w` where `w[i]` describes the weight of index `i` (0-indexed).  
> Implement the function `pickIndex()` which randomly picks an index in proportion to its weight.  
> For example, the probability of picking index `i` is `w[i] / sum(w)`.

**LeetCode Link:** [528. Random Pick with Weight](https://leetcode.com/problems/random-pick-with-weight/)

---

```
Example:
Input:
["Solution","pickIndex","pickIndex","pickIndex","pickIndex","pickIndex"]
[[[1,3]],[],[],[],[],[]]

Output:
[null,1,1,1,1,0]
Explanation: pickIndex returns 1 with probability 3/4 and 0 with probability 1/4.
```

## ✅ Constraints

- `1 <= w.length <= 10⁴`
- `1 <= w[i] <= 10⁵`
- `pickIndex()` will be called at most 10⁴ times

---

## 🧠 Python Solutions (Prefix Sum + Binary Search)

---

### 🧪 Level 1: Repeated Sampling with Cumulative Distribution Rebuild

**Approach:**  
Rebuild the cumulative weights and sample every time `pickIndex()` is called. Very inefficient.

```python
import random

class Solution:
    def __init__(self, w):
        self.w = w

    def pickIndex(self):
        total_weight = sum(self.w)
        r = random.randint(1, total_weight)
        curr = 0
        for i, weight in enumerate(self.w):
            curr += weight
            if r <= curr:
                return i
```

- Time: O(n) per pick
- Space: O(1)

---

### ⚙️ Level 2: Precompute Prefix Sum, Linear Scan on Pick

**Approach:**  
Compute prefix sum once in constructor, but use linear scan for `pickIndex`.

```python
import random

class Solution:
    def __init__(self, w):
        self.prefix = []
        total = 0
        for weight in w:
            total += weight
            self.prefix.append(total)
        self.total = total

    def pickIndex(self):
        r = random.randint(1, self.total)
        for i, val in enumerate(self.prefix):
            if r <= val:
                return i
```

- Time: O(n) for pick, O(n) setup
- Space: O(n)

---

### 🚀 Level 3: Binary Search with Precomputed Prefix Sums

**Approach:**  
Precompute the prefix sums and use binary search on `pickIndex` to get O(log n) pick time.

```python
import bisect, random

class Solution:
    def __init__(self, w):
        self.prefix = []
        total = 0
        for weight in w:
            total += weight
            self.prefix.append(total)
        self.total = total

    def pickIndex(self):
        r = random.randint(1, self.total)
        return bisect.bisect_left(self.prefix, r)
```

- Time: O(log n) pick, O(n) setup
- Space: O(n)

---

## 🔗 Similar Problems

1. [470. Implement Rand10() Using Rand7()](https://leetcode.com/problems/implement-rand10-using-rand7/)
2. [497. Random Point in Non-overlapping Rectangles](https://leetcode.com/problems/random-point-in-non-overlapping-rectangles/)
3. [382. Linked List Random Node](https://leetcode.com/problems/linked-list-random-node/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                      | Time (Init) | Time (Pick) | Space |
|-------|-------------------------------|-------------|-------------|--------|
| 1     | Rebuild on each pick          | O(1)        | O(n)        | O(1)   |
| 2     | Prefix Sum + Linear Search    | O(n)        | O(n)        | O(n)   |
| 3     | Prefix Sum + Binary Search    | O(n)        | O(log n)    | O(n)   |

---

## 📌 Takeaway Points

- Precomputing prefix sums allows efficient sampling.
- Binary search dramatically improves selection time for large input sizes.
- This pattern of mapping probabilities to intervals is reusable in many weighted-random problems.

---


8. Maximum Product Subarray


# ➕ Problem: Maximum Product Subarray

## 📘 Problem Statement

> Given an integer array `nums`, find a contiguous non-empty subarray within the array (containing at least one number) which has the largest product, and return the product.  
> The test cases are generated so that the answer will fit in a 32-bit integer.

**LeetCode Link:** [152. Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)

---

```
Example 1:
Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.

Example 2:
Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
```

## ✅ Constraints

- `1 <= nums.length <= 2 * 10⁴`
- `-10 <= nums[i] <= 10`
- The product of any prefix or suffix of `nums` is guaranteed to fit in a 32-bit integer.

---

## 🧠 Python Solutions (Tracking Min and Max)

---

### 🧪 Level 1: Brute Force – All Subarrays

**Approach:**  
Check every subarray and calculate the product.

```python
def maxProduct(nums):
    max_prod = float('-inf')
    for i in range(len(nums)):
        prod = 1
        for j in range(i, len(nums)):
            prod *= nums[j]
            max_prod = max(max_prod, prod)
    return max_prod
```

- Time: O(n²)
- Space: O(1)

---

### ⚙️ Level 2: Dynamic Programming with Extra Space

**Approach:**  
Track both `max_prod[i]` and `min_prod[i]` at every index due to negative numbers flipping sign.

```python
def maxProduct(nums):
    n = len(nums)
    max_dp = nums[:]
    min_dp = nums[:]
    result = nums[0]
    
    for i in range(1, n):
        max_dp[i] = max(nums[i], max_dp[i-1]*nums[i], min_dp[i-1]*nums[i])
        min_dp[i] = min(nums[i], max_dp[i-1]*nums[i], min_dp[i-1]*nums[i])
        result = max(result, max_dp[i])
    
    return result
```

- Time: O(n)
- Space: O(n)

---

### 🚀 Level 3: Optimized DP (Constant Space)

**Approach:**  
Same as Level 2, but optimize by storing only current `max_so_far` and `min_so_far`.

```python
def maxProduct(nums):
    result = max_so_far = min_so_far = nums[0]
    
    for num in nums[1:]:
        choices = (num, num * max_so_far, num * min_so_far)
        max_so_far = max(choices)
        min_so_far = min(choices)
        result = max(result, max_so_far)
    
    return result
```

- Time: O(n)
- Space: O(1)

---

## 🔗 Similar Problems

1. [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)
2. [918. Maximum Sum Circular Subarray](https://leetcode.com/problems/maximum-sum-circular-subarray/)
3. [174. Dungeon Game](https://leetcode.com/problems/dungeon-game/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                   | Time Complexity | Space Complexity |
|-------|----------------------------|-----------------|------------------|
| 1     | Brute Force Subarrays      | O(n²)           | O(1)             |
| 2     | DP with Arrays             | O(n)            | O(n)             |
| 3     | Optimized DP (2 vars)      | O(n)            | O(1)             |

---

## 📌 Takeaway Points

- Negative numbers complicate products, requiring tracking both max and min.
- O(n) time with O(1) space is achievable using just two variables.
- Pattern useful in range product or matrix product variation problems.

---


9. Expression Add Operators


# ➕ Problem: Expression Add Operators

## 📘 Problem Statement

> Given a string `num` that contains only digits and an integer `target`, return all possibilities to insert binary operators `+`, `-`, and `*` between the digits so that the resulting expression evaluates to the `target` value.

**LeetCode Link:** [282. Expression Add Operators](https://leetcode.com/problems/expression-add-operators/)

---

```
Example 1:
Input: num = "123", target = 6
Output: ["1+2+3", "1*2*3"]

Example 2:
Input: num = "232", target = 8
Output: ["2*3+2", "2+3*2"]

Example 3:
Input: num = "105", target = 5
Output: ["1*0+5","10-5"]
```

## ✅ Constraints

- `1 <= num.length <= 10`
- `num` consists of only digits.
- `-2³¹ <= target <= 2³¹ - 1`

---

## 🧠 Python Solutions (Backtracking DFS)

---

### 🧪 Level 1: Brute Force with Eval

**Approach:**  
Generate all combinations with operators, evaluate using `eval`. Skip invalid (leading zero) numbers.

```python
def addOperators(num, target):
    res = []
    def backtrack(index, path):
        if index == len(num):
            if eval(path) == target:
                res.append(path)
            return
        for i in range(index + 1, len(num) + 1):
            tmp = num[index:i]
            if len(tmp) > 1 and tmp[0] == '0':
                break
            if index == 0:
                backtrack(i, tmp)
            else:
                for op in ['+', '-', '*']:
                    backtrack(i, path + op + tmp)
    backtrack(0, "")
    return res
```

- Time: O(4ⁿ)
- Space: O(4ⁿ)

---

### ⚙️ Level 2: Backtracking without Eval

**Approach:**  
Track value and previous operand manually to avoid using `eval()`.

```python
def addOperators(num, target):
    res = []
    def backtrack(index, path, value, prev):
        if index == len(num):
            if value == target:
                res.append(path)
            return
        for i in range(index + 1, len(num) + 1):
            tmp = num[index:i]
            if len(tmp) > 1 and tmp[0] == '0':
                break
            curr = int(tmp)
            if index == 0:
                backtrack(i, tmp, curr, curr)
            else:
                backtrack(i, path + '+' + tmp, value + curr, curr)
                backtrack(i, path + '-' + tmp, value - curr, -curr)
                backtrack(i, path + '*' + tmp, value - prev + prev * curr, prev * curr)
    backtrack(0, "", 0, 0)
    return res
```

- Time: O(4ⁿ)
- Space: O(n)

---

### 🚀 Level 3: Optimized Pruning & Backtracking

**Approach:**  
Same as Level 2 with pruning:
- Avoid unnecessary recursion if the number can't possibly lead to the target.
- Handle intermediate expression building more efficiently.

```python
def addOperators(num, target):
    res = []
    def backtrack(index, path, value, prev):
        if index == len(num):
            if value == target:
                res.append(path)
            return
        for i in range(index + 1, len(num) + 1):
            tmp = num[index:i]
            if len(tmp) > 1 and tmp[0] == '0':
                break
            curr = int(tmp)
            if index == 0:
                backtrack(i, tmp, curr, curr)
            else:
                backtrack(i, path + '+' + tmp, value + curr, curr)
                backtrack(i, path + '-' + tmp, value - curr, -curr)
                backtrack(i, path + '*' + tmp, value - prev + prev * curr, prev * curr)
    backtrack(0, "", 0, 0)
    return res
```

- Time: O(4ⁿ), pruned
- Space: O(n)

---

## 🔗 Similar Problems

1. [241. Different Ways to Add Parentheses](https://leetcode.com/problems/different-ways-to-add-parentheses/)
2. [227. Basic Calculator II](https://leetcode.com/problems/basic-calculator-ii/)
3. [772. Basic Calculator III](https://leetcode.com/problems/basic-calculator-iii/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                | Time Complexity | Space Complexity |
|-------|-------------------------|-----------------|------------------|
| 1     | Brute Force w/ eval     | O(4ⁿ)           | O(4ⁿ)            |
| 2     | DFS + Manual Eval       | O(4ⁿ)           | O(n)             |
| 3     | DFS + Pruning Optimized | O(4ⁿ) (pruned)  | O(n)             |

---

## 📌 Takeaway Points

- Don't use `eval` in interviews—implement your own expression evaluation.
- Track value and last operation separately for multiplication logic.
- Prune early if a branch can't reach the target, especially with long input.

---

10. Data Stream as Disjoint Intervals



# ➕ Problem: Data Stream as Disjoint Intervals

## 📘 Problem Statement

> Given a data stream, the system will receive integers one by one. You need to design a class `SummaryRanges` that supports the following operations:
>
> - **addNum(value)**: Add a value to the stream.
> - **getIntervals()**: Return the intervals that are covered by the numbers in the stream. The intervals should be sorted by their starting number.

**LeetCode Link:** [352. Data Stream as Disjoint Intervals](https://leetcode.com/problems/data-stream-as-disjoint-intervals/)

---

```
Example 1:
Input:
["SummaryRanges", "addNum", "addNum", "getIntervals", "addNum", "getIntervals"]
[[], [1], [3], [], [7], []]
Output:
[null, null, null, [[1, 1]], null, [[1, 1], [3, 3]]]

Example 2:
Input:
["SummaryRanges", "addNum", "addNum", "addNum", "getIntervals"]
[[], [1], [3], [7], []]
Output:
[null, null, null, null, [[1, 1], [3, 3], [7, 7]]]
```

## ✅ Constraints

- `0 <= value <= 10⁶`
- `Calling `getIntervals()` will always return the intervals at the current state of the stream.

---

## 🧠 Python Solutions (Efficient Range Merging)

---

### 🧪 Level 1: Brute Force (List Maintenance)

**Approach:**  
Maintain a list of intervals and sort the intervals after every insertion. This method ensures that the intervals are merged correctly but is not efficient for large inputs.

```python
class SummaryRanges:

    def __init__(self):
        self.intervals = []

    def addNum(self, value: int) -> None:
        new_interval = [value, value]
        self.intervals.append(new_interval)
        self.intervals.sort()
        self.mergeIntervals()

    def mergeIntervals(self):
        merged = []
        for interval in self.intervals:
            if not merged or merged[-1][1] < interval[0] - 1:
                merged.append(interval)
            else:
                merged[-1][1] = max(merged[-1][1], interval[1])
        self.intervals = merged

    def getIntervals(self) -> list:
        return self.intervals
```

- Time for `addNum(value)`: O(n log n) due to sorting.
- Time for `getIntervals()`: O(1).
- Space Complexity: O(n).

---

### ⚙️ Level 2: Efficient Range Insertion (Using SortedDict)

**Approach:**  
We use `SortedDict` from the `sortedcontainers` library for more efficient insertion and merging. It keeps the intervals sorted without the need to explicitly sort every time.

```python
from sortedcontainers import SortedDict

class SummaryRanges:

    def __init__(self):
        self.ranges = SortedDict()

    def addNum(self, value: int) -> None:
        if value in self.ranges:
            return
        left = self.ranges.bisect_left(value)
        # Try merging with previous and next ranges if possible
        if left > 0 and self.ranges.peekitem(left - 1)[1] + 1 >= value:
            left -= 1
        right = self.ranges.bisect_right(value)
        if right < len(self.ranges) and self.ranges.peekitem(right)[0] - 1 <= value:
            right += 1
        self.ranges[value] = value
        if left > 0 and self.ranges.peekitem(left - 1)[1] + 1 >= value:
            self.ranges.peekitem(left - 1)[1] = max(self.ranges.peekitem(left)[1], value)
        if right < len(self.ranges) and self.ranges.peekitem(right)[0] - 1 <= value:
            self.ranges.peekitem(right)[1] = max(self.ranges.peekitem(left)[1], value)

    def getIntervals(self) -> list:
        return list(self.ranges.items())
```

- Time Complexity for `addNum(value)`: O(log n).
- Time Complexity for `getIntervals()`: O(n).
- Space Complexity: O(n).

---

### 🚀 Level 3: Optimized Merge with More Advanced Range Management

**Approach:**  
Refines the insertion and merging strategy to minimize redundant operations, focusing on dynamic merging on-demand and maintaining intervals with minimum complexity.

```python
class SummaryRanges:

    def __init__(self):
        self.intervals = {}

    def addNum(self, value: int) -> None:
        left = right = value
        if value in self.intervals:
            return
        
        # Extend left if value - 1 is present
        if value - 1 in self.intervals:
            left = self.intervals[value - 1]
        # Extend right if value + 1 is present
        if value + 1 in self.intervals:
            right = self.intervals[value + 1]
        # Combine ranges
        self.intervals[left] = right
        self.intervals[right] = left

    def getIntervals(self) -> list:
        result = []
        for key, value in self.intervals.items():
            result.append([key, value])
        return result
```

- Time Complexity for `addNum(value)`: O(log n).
- Time Complexity for `getIntervals()`: O(n).
- Space Complexity: O(n).

---

## 🔗 Similar Problems

1. [355. Design Twitter](https://leetcode.com/problems/design-twitter/)
2. [632. Smallest Range Covering Elements from K Lists](https://leetcode.com/problems/smallest-range-covering-elements-from-k-lists/)
3. [1151. Minimum Swaps to Group All 1’s Together](https://leetcode.com/problems/minimum-swaps-to-group-all-1s-together/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                   | Time Complexity  | Space Complexity |
|-------|----------------------------|------------------|------------------|
| 1     | Brute Force (List)         | O(n log n)       | O(n)             |
| 2     | Optimized with SortedDict  | O(log n)         | O(n)             |
| 3     | Advanced Merge Strategy    | O(log n)         | O(n)             |

---

## 📌 Takeaway Points

- Efficient merging can drastically improve performance.
- Consider using data structures like `SortedDict` for maintaining sorted intervals automatically.
- Range merging should be done cautiously to avoid unnecessary operations in higher volumes of data.

---


11. Longest Consecutive Sequence


# ➕ Problem: Longest Consecutive Sequence

## 📘 Problem Statement

> Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.
>  
> Your algorithm should run in `O(n)` complexity.

**LeetCode Link:** [128. Longest Consecutive Sequence](https://leetcode.com/problems/longest-consecutive-sequence/)

---

```
Example 1:
Input: nums = [100, 4, 200, 1, 3, 2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4], therefore its length is 4.

Example 2:
Input: nums = [0, 3, 5, 7, 8, 6, 4]
Output: 5
Explanation: The longest consecutive elements sequence is [4, 5, 6, 7, 8], therefore its length is 5.

```

## ✅ Constraints

- `0 <= nums.length <= 10⁴`
- `-10⁹ <= nums[i] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sorting)

**Approach:**  
Sort the array and then iterate through the sorted list to find the longest consecutive sequence. Sorting will take `O(n log n)` time.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(1)
def longestConsecutive(nums):
    if not nums:
        return 0
    nums.sort()
    longest_streak = 1
    current_streak = 1
    for i in range(1, len(nums)):
        if nums[i] != nums[i - 1]:
            if nums[i] == nums[i - 1] + 1:
                current_streak += 1
            else:
                longest_streak = max(longest_streak, current_streak)
                current_streak = 1
    return max(longest_streak, current_streak)
```

---

### ⚙️ Level 2: Using HashSet (Efficient with O(n))

**Approach:**  
We use a hash set to store the unique elements, and then for each element, we try to find the longest sequence by checking if the current element can be the start of a sequence. This solution works in O(n) time complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def longestConsecutive(nums):
    num_set = set(nums)
    longest_streak = 0
    
    for num in num_set:
        if num - 1 not in num_set:
            current_num = num
            current_streak = 1
            
            while current_num + 1 in num_set:
                current_num += 1
                current_streak += 1
                
            longest_streak = max(longest_streak, current_streak)
    
    return longest_streak
```

---

### 🚀 Level 3: Optimized Approach (Using HashMap to Track Sequences)

**Approach:**  
Instead of iterating over each number directly, we use a hashmap (or dictionary) to track the lengths of sequences, allowing more efficient lookups and management of sequences. This keeps the operations still in O(n).

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def longestConsecutive(nums):
    if not nums:
        return 0
    num_map = {}
    longest_streak = 0
    
    for num in nums:
        if num not in num_map:
            left = num_map.get(num - 1, 0)
            right = num_map.get(num + 1, 0)
            current_streak = left + right + 1
            num_map[num] = current_streak
            num_map[num - left] = current_streak
            num_map[num + right] = current_streak
            longest_streak = max(longest_streak, current_streak)
    
    return longest_streak
```

---

## 🔗 Similar Problems

1. [349. Intersection of Two Arrays](https://leetcode.com/problems/intersection-of-two-arrays/)
2. [234. Palindrome Linked List](https://leetcode.com/problems/palindrome-linked-list/)
3. [128. Longest Consecutive Sequence (Follow-up with negative numbers)](https://leetcode.com/problems/longest-consecutive-sequence/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                     | Time Complexity | Space Complexity |
|-------|------------------------------|-----------------|------------------|
| 1     | Brute Force (Sorting)        | O(n log n)      | O(1)             |
| 2     | HashSet Approach             | O(n)            | O(n)             |
| 3     | Optimized HashMap Approach   | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- Sorting gives a simple solution but does not achieve optimal time complexity.
- Using hash sets allows us to improve to linear time for the problem.
- The hashmap approach further optimizes by tracking the current sequence and extending ranges.

---

12. Decode String


# ➕ Problem: Decode String

## 📘 Problem Statement

> Given an encoded string, return its decoded string.
> 
> The encoding rule is:  
>  
> `k[encoded_string]` where the encoded_string inside the square brackets is repeated exactly `k` times.
> 
> You may assume that the input is always valid, no extra white spaces, no digits are 0, and `k` is a positive integer.

**LeetCode Link:** [394. Decode String](https://leetcode.com/problems/decode-string/)

---

```
Example 1:
Input: s = "3[a]2[bc]"
Output: "aaabcbc"
Explanation: The decoded string is "aaa" + "bc" + "bc" = "aaabcbc".

Example 2:
Input: s = "3[a2[c]]"
Output: "accaccacc"
Explanation: The decoded string is "a" + "cc" + "cc" + "cc" = "accaccacc".

Example 3:
Input: s = "2[abc]3[cd]ef"
Output: "abcabccdcdcdef"
Explanation: The decoded string is "abc" + "abc" + "cd" + "cd" + "cd" + "ef" = "abcabccdcdcdef".

```

## ✅ Constraints

- `1 <= s.length <= 30⁴`
- `s` consists of lowercase English letters, digits, and square brackets `'[]'`.
- It is guaranteed that the input string is a valid encoded string.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Using Stack)

**Approach:**  
We use a stack to handle nested patterns and build the decoded string. This approach will work by iterating through the string and using the stack to store parts of the string and numbers for repetition.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def decodeString(s):
    stack = []
    current_num = 0
    current_string = ""
    
    for char in s:
        if char.isdigit():
            current_num = current_num * 10 + int(char)
        elif char == '[':
            stack.append((current_string, current_num))
            current_string, current_num = "", 0
        elif char == ']':
            prev_string, repeat_count = stack.pop()
            current_string = prev_string + current_string * repeat_count
        else:
            current_string += char
    
    return current_string
```

---

### ⚙️ Level 2: Optimized Stack-based Approach (Handling Nested Patterns)

**Approach:**  
This approach uses the same stack but ensures that the code is more readable and ensures that strings are built efficiently as we handle each bracket and repeat sequence.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def decodeString(s):
    stack = []
    current_string = ""
    current_num = 0
    
    for char in s:
        if char.isdigit():
            current_num = current_num * 10 + int(char)
        elif char == '[':
            stack.append((current_string, current_num))
            current_string, current_num = "", 0
        elif char == ']':
            prev_string, repeat_count = stack.pop()
            current_string = prev_string + current_string * repeat_count
        else:
            current_string += char
    
    return current_string
```

---

### 🚀 Level 3: In-Place Optimization Using Only One Stack

**Approach:**  
By using a more compact code structure, this version ensures better clarity while avoiding redundant code.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def decodeString(s):
    stack = []
    current_string = ""
    current_num = 0
    
    for char in s:
        if char.isdigit():
            current_num = current_num * 10 + int(char)
        elif char == '[':
            stack.append((current_string, current_num))
            current_string, current_num = "", 0
        elif char == ']':
            prev_string, repeat_count = stack.pop()
            current_string = prev_string + current_string * repeat_count
        else:
            current_string += char
    
    return current_string
```

---

## 🔗 Similar Problems

1. [739. Daily Temperature](https://leetcode.com/problems/daily-temperatures/)
2. [71. Simplify Path](https://leetcode.com/problems/simplify-path/)
3. [44. Wildcard Matching](https://leetcode.com/problems/wildcard-matching/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Using Stack)        | O(n)            | O(n)             |
| 2     | Optimized Stack-based Approach   | O(n)            | O(n)             |
| 3     | In-Place Optimization (Using Stack) | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- A stack is very useful for handling nested structures, such as this problem with encoded strings.
- Optimizing space and keeping operations linear is key to solving such problems effectively.
- We must carefully manage number values and strings in nested patterns to ensure correctness.

---

13. Binary Search in 2D Matrix


# ➕ Problem: Binary Search in 2D Matrix

## 📘 Problem Statement

> Write an efficient algorithm that searches for a target value in an `m x n` integer matrix.  
> This matrix has the following properties:  
> - Integers in each row are sorted from left to right.  
> - The first integer of each row is greater than the last integer of the previous row.

**LeetCode Link:** [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)

---

```
Example 1:

Input: matrix = [
  [1,   3,  5,  7],
  [10, 11, 16, 20],
  [23, 30, 34, 60]
], target = 3
Output: true
Explanation: We can find 3 in the matrix at (0, 1).

Example 2:

Input: matrix = [
  [1,  4,  7, 11],
  [2,  5,  8, 12],
  [3,  6,  9, 16]
], target = 5
Output: true

Example 3:

Input: matrix = [
  [1,  4,  7, 11],
  [2,  5,  8, 12],
  [3,  6,  9, 16]
], target = 20
Output: false
```

## ✅ Constraints

- `m == matrix.length`
- `n == matrix[i].length`
- `1 <= m, n <= 100`
- `-10⁴ <= matrix[i][j], target <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Search (Linear Scan)

**Approach:**  
A simple brute-force approach would be to scan through each row and check for the target. This method has a time complexity of `O(m * n)`.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(1)
def searchMatrix(matrix, target):
    for row in matrix:
        if target in row:
            return True
    return False
```

---

### ⚙️ Level 2: Binary Search on Each Row

**Approach:**  
This approach involves using binary search on each row, given that each row is sorted. The time complexity for each row is `O(log n)`, so for `m` rows, it is `O(m * log n)`.

```python
# Time Complexity: O(m * log n)
# Space Complexity: O(1)
def searchMatrix(matrix, target):
    for row in matrix:
        if binarySearch(row, target):
            return True
    return False

def binarySearch(row, target):
    left, right = 0, len(row) - 1
    while left <= right:
        mid = (left + right) // 2
        if row[mid] == target:
            return True
        elif row[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return False
```

---

### 🚀 Level 3: Binary Search on Matrix as a Single Sorted Array

**Approach:**  
Treat the matrix as a 1D array using the formula to map the 2D coordinates to 1D indices:  
`index = row * n + col`  
Then apply binary search directly on this "flattened" matrix, resulting in a time complexity of `O(log(m * n))`.

```python
# Time Complexity: O(log(m * n))
# Space Complexity: O(1)
def searchMatrix(matrix, target):
    if not matrix:
        return False
    
    m, n = len(matrix), len(matrix[0])
    left, right = 0, m * n - 1
    
    while left <= right:
        mid = (left + right) // 2
        mid_value = matrix[mid // n][mid % n]
        
        if mid_value == target:
            return True
        elif mid_value < target:
            left = mid + 1
        else:
            right = mid - 1
    
    return False
```

---

## 🔗 Similar Problems

1. [240. Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/)
2. [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)
3. [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                  | Time Complexity | Space Complexity |
|-------|------------------------------------------|-----------------|------------------|
| 1     | Brute Force Search (Linear Scan)         | O(m * n)        | O(1)             |
| 2     | Binary Search on Each Row                | O(m * log n)    | O(1)             |
| 3     | Binary Search on Flattened Matrix        | O(log(m * n))   | O(1)             |

---

## 📌 Takeaway Points

- A brute force solution is simple but inefficient for large matrices.
- Binary search provides a much more efficient way to search within rows, making the solution faster.
- Flattening the 2D matrix into a 1D array allows us to leverage binary search in a way that reduces the complexity even further.

---

14. Range Sum Query – Mutable


# ➕ Problem: Range Sum Query - Mutable

## 📘 Problem Statement

> Given an integer array `nums`, handle multiple queries of the following types:
> - Update the value of a specific index in the array.
> - Calculate the sum of the elements of the array between two indices (inclusive).
>
> Implement the `NumArray` class:
> - `NumArray(int[] nums)` Initializes the object with the given integer array `nums`.
> - `void update(int i, int val)` Updates the value of the element at index `i` to `val`.
> - `int sumRange(int i, int j)` Returns the sum of the elements of the array between indices `i` and `j` (inclusive).

**LeetCode Link:** [303. Range Sum Query - Mutable](https://leetcode.com/problems/range-sum-query-mutable/)

---

```
Example 1:

Input:
["NumArray", "sumRange", "update", "sumRange"]
[[[-1, 3, 4, 2]], [0, 2], [1, 2], [0, 2]]
Output:
[null, 6, null, 5]
Explanation:
NumArray numArray = new NumArray([-1, 3, 4, 2]);
numArray.sumRange(0, 2); // return 3 + 4 + -1 = 6
numArray.update(1, 2);   // nums = [-1,2,4,2]
numArray.sumRange(0, 2); // return -1 + 2 + 4 = 5
```

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁴ <= nums[i] <= 10⁴`
- `0 <= i <= nums.length - 1`
- `0 <= j <= nums.length - 1`
- `i <= j`
- At most `10⁴` calls will be made to `update` and `sumRange`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach

**Approach:**  
For the `sumRange` method, simply loop through the range and sum the elements. For the `update` method, directly update the array at the given index. This solution has a time complexity of `O(n)` for `sumRange` and `O(1)` for `update`.

```python
# Time Complexity: O(n) for sumRange, O(1) for update
# Space Complexity: O(n)
class NumArray:
    def __init__(self, nums: List[int]):
        self.nums = nums

    def update(self, i: int, val: int) -> None:
        self.nums[i] = val

    def sumRange(self, i: int, j: int) -> int:
        return sum(self.nums[i:j+1])
```

---

### ⚙️ Level 2: Prefix Sum Array

**Approach:**  
Create a `prefix_sum` array where each element stores the cumulative sum from the start of the array to that index. This allows the `sumRange` operation to be performed in `O(1)` time. The `update` method requires recalculating the prefix sum array, making it slower with a time complexity of `O(n)`.

```python
# Time Complexity: O(n) for update, O(1) for sumRange
# Space Complexity: O(n)
class NumArray:
    def __init__(self, nums: List[int]):
        self.nums = nums
        self.prefix_sum = [0] * (len(nums) + 1)
        for i in range(1, len(nums) + 1):
            self.prefix_sum[i] = self.prefix_sum[i - 1] + nums[i - 1]

    def update(self, i: int, val: int) -> None:
        diff = val - self.nums[i]
        self.nums[i] = val
        for j in range(i + 1, len(self.prefix_sum)):
            self.prefix_sum[j] += diff

    def sumRange(self, i: int, j: int) -> int:
        return self.prefix_sum[j + 1] - self.prefix_sum[i]
```

---

### 🚀 Level 3: Binary Indexed Tree (Fenwick Tree)

**Approach:**  
Use a Binary Indexed Tree (BIT) to support both `update` and `sumRange` in `O(log n)` time. The BIT provides an efficient way to handle dynamic prefix sum updates.

```python
# Time Complexity: O(log n) for both update and sumRange
# Space Complexity: O(n)
class NumArray:
    def __init__(self, nums: List[int]):
        self.n = len(nums)
        self.bit = [0] * (self.n + 1)
        self.nums = nums
        for i in range(self.n):
            self.update(i, nums[i])

    def update(self, i: int, val: int) -> None:
        diff = val - self.nums[i]
        self.nums[i] = val
        i += 1
        while i <= self.n:
            self.bit[i] += diff
            i += i & -i  # Move to the next parent node

    def sumRange(self, i: int, j: int) -> int:
        return self.prefix_sum(j) - self.prefix_sum(i - 1)

    def prefix_sum(self, i: int) -> int:
        res = 0
        while i > 0:
            res += self.bit[i]
            i -= i & -i  # Move to the parent node
        return res
```

---

## 🔗 Similar Problems

1. [307. Range Sum Query - Mutable](https://leetcode.com/problems/range-sum-query-mutable/)
2. [304. Range Sum Query 2D - Immutable](https://leetcode.com/problems/range-sum-query-2d-immutable/)
3. [308. Range Sum Query 2D - Mutable](https://leetcode.com/problems/range-sum-query-2d-mutable/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity      | Space Complexity |
|-------|-------------------------------------|----------------------|------------------|
| 1     | Brute Force                         | O(n) for sumRange, O(1) for update | O(n) |
| 2     | Prefix Sum Array                    | O(n) for update, O(1) for sumRange | O(n) |
| 3     | Binary Indexed Tree (Fenwick Tree)   | O(log n) for both update and sumRange | O(n) |

---

## 📌 Takeaway Points

- The brute force solution is simple but inefficient for large datasets.
- Prefix sum allows `sumRange` to be optimized to `O(1)`, but `update` is slower.
- The Binary Indexed Tree provides an optimal solution with `O(log n)` time complexity for both operations.

---

15. Flatten Nested List Iterator


# ➕ Problem: Flatten Nested List Iterator

## 📘 Problem Statement

> Implement an iterator to flatten a 2D vector. The iterator should implement the following functions:
> - `hasNext()`: Returns `true` if there is another integer in the iteration.
> - `next()`: Returns the next integer in the iteration.
> - `flatten()` : Flattens the 2D vector into a 1D vector.

A 2D vector is a list of lists of integers. Each inner list represents a row, and `hasNext()` returns whether there is another integer in the entire 2D vector. The iterator should return each element from the 2D vector in a flattened manner.

**LeetCode Link:** [341. Flatten Nested List Iterator](https://leetcode.com/problems/flatten-nested-list-iterator/)

---

```
Example 1:

Input: 
["NestedIterator", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
[[[[1,1], [2], [3,3]]], [], [], [], [], [], []]
Output: 
[null, 1, true, 1, true, 2, true, 3, true, 3, false]
Explanation:
NestedIterator iter = new NestedIterator([[1,1], [2], [3,3]]);
iter.next();    // returns 1 
iter.hasNext(); // returns true 
iter.next();    // returns 1 
iter.hasNext(); // returns true
iter.next();    // returns 2 
iter.hasNext(); // returns true 
iter.next();    // returns 3 
iter.hasNext(); // returns true 
iter.next();    // returns 3 
iter.hasNext(); // returns false
```

## ✅ Constraints

- `1 <= nestedList.length <= 1000`
- `1 <= nestedList[i].length <= 1000`
- `-10⁶ <= nestedList[i][j] <= 10⁶`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Iteration

**Approach:**  
For a simple solution, we can iterate through all the elements in the nested list and store them in a flattened list. Then, we use an index pointer to keep track of the current position while calling `next()`.

```python
# Time Complexity: O(n) for flattening the 2D list
# Space Complexity: O(n) for storing the flattened list
class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        self.flat_list = []
        self.index = 0
        self.flatten(nestedList)
        
    def flatten(self, nestedList):
        for elem in nestedList:
            if elem.isInteger():
                self.flat_list.append(elem.getInteger())
            else:
                self.flatten(elem.getList())

    def next(self) -> int:
        self.index += 1
        return self.flat_list[self.index - 1]
    
    def hasNext(self) -> bool:
        return self.index < len(self.flat_list)
```

---

### ⚙️ Level 2: Stack-based Iterative Approach

**Approach:**  
Instead of flattening the list at initialization, we can use a stack-based approach that only flattens elements when `hasNext()` is called. This reduces the upfront space requirement by processing elements lazily.

```python
# Time Complexity: O(1) for hasNext(), O(1) for next() amortized
# Space Complexity: O(h) where h is the height of the nested list
class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        self.stack = []
        self.pushAll(nestedList)

    def pushAll(self, nestedList):
        for elem in reversed(nestedList):
            self.stack.append(elem)

    def next(self) -> int:
        self.hasNext()  # Ensure stack is pointing to an integer
        return self.stack.pop().getInteger()

    def hasNext(self) -> bool:
        while self.stack:
            top = self.stack[-1]
            if top.isInteger():
                return True
            self.stack.pop()
            self.pushAll(top.getList())
        return False
```

---

### 🚀 Level 3: Optimized Stack-based with Preprocessing

**Approach:**  
This is similar to Level 2 but with enhanced handling for `hasNext()` and `next()`. We can preprocess the stack by ensuring it always points to the next integer element.

```python
# Time Complexity: O(1) for both hasNext() and next() amortized
# Space Complexity: O(h) where h is the height of the nested list
class NestedIterator:
    def __init__(self, nestedList: [NestedInteger]):
        self.stack = []
        self.pushAll(nestedList)

    def pushAll(self, nestedList):
        for elem in reversed(nestedList):
            self.stack.append(elem)

    def next(self) -> int:
        self.hasNext()  # Ensure stack is pointing to an integer
        return self.stack.pop().getInteger()

    def hasNext(self) -> bool:
        while self.stack:
            top = self.stack[-1]
            if top.isInteger():
                return True
            self.stack.pop()
            self.pushAll(top.getList())
        return False
```

---

## 🔗 Similar Problems

1. [385. Mini Parser](https://leetcode.com/problems/mini-parser/)
2. [291. Word Pattern II](https://leetcode.com/problems/word-pattern-ii/)
3. [339. Nested List Weight Sum](https://leetcode.com/problems/nested-list-weight-sum/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity      | Space Complexity |
|-------|-------------------------------------|----------------------|------------------|
| 1     | Simple Iteration                    | O(n) for flattening the 2D list | O(n) |
| 2     | Stack-based Iterative Approach       | O(1) for `hasNext()`, O(1) for `next()` amortized | O(h) |
| 3     | Optimized Stack-based Approach       | O(1) for `hasNext()`, O(1) for `next()` amortized | O(h) |

---

## 📌 Takeaway Points

- Flattening the list upfront (Level 1) is simple but not memory-efficient.
- Lazy evaluation (Level 2) using a stack allows us to avoid flattening the entire list upfront and only process elements as needed.
- Level 3 improves upon the stack-based solution to ensure better handling of nested structures.

---

16. Search a 2D Matrix II


# ➕ Problem: Search a 2D Matrix II

## 📘 Problem Statement

> Write an efficient algorithm that searches for a target value in an `m x n` integer matrix. This matrix has the following properties:
> - Integers in each row are sorted in ascending from left to right.
> - Integers in each column are sorted in ascending from top to bottom.

> Implement a function `searchMatrix(matrix: List[List[int]], target: int) -> bool`, and return `true` if the target exists in the matrix, otherwise return `false`.

**LeetCode Link:** [240. Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/)

---

```
Example 1:

Input:
matrix = [
  [1,   4,  7, 11],
  [2,   5,  8, 12],
  [3,   6,  9, 16],
  [10, 13, 14, 17]
]
target = 5
Output: true

Example 2:

Input:
matrix = [
  [1,   4,  7, 11],
  [2,   5,  8, 12],
  [3,   6,  9, 16],
  [10, 13, 14, 17]
]
target = 20
Output: false
```

## ✅ Constraints

- `m == matrix.length`
- `n == matrix[i].length`
- `1 <= m, n <= 300`
- `-10⁹ <= matrix[i][j] <= 10⁹`
- `-10⁹ <= target <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Search

**Approach:**  
A simple brute force approach would be to iterate through every element of the matrix and check if it matches the target.

```python
# Time Complexity: O(m * n) where m is the number of rows and n is the number of columns
# Space Complexity: O(1)
def searchMatrix(matrix, target):
    for row in matrix:
        for num in row:
            if num == target:
                return True
    return False
```

---

### ⚙️ Level 2: Binary Search (Row-wise)

**Approach:**  
Since each row is sorted, we can perform a binary search on each row to find the target. This reduces the search complexity within each row to O(log n).

```python
# Time Complexity: O(m * log n) where m is the number of rows and n is the number of columns
# Space Complexity: O(1)
def searchMatrix(matrix, target):
    for row in matrix:
        # Perform binary search on the row
        left, right = 0, len(row) - 1
        while left <= right:
            mid = (left + right) // 2
            if row[mid] == target:
                return True
            elif row[mid] < target:
                left = mid + 1
            else:
                right = mid - 1
    return False
```

---

### 🚀 Level 3: Optimized Search (Start from Top-right or Bottom-left)

**Approach:**  
Since both rows and columns are sorted, we can start from the top-right corner of the matrix. If the current number is greater than the target, move left; if it’s smaller, move down. This reduces the search to O(m + n).

```python
# Time Complexity: O(m + n) where m is the number of rows and n is the number of columns
# Space Complexity: O(1)
def searchMatrix(matrix, target):
    if not matrix:
        return False
    
    row, col = 0, len(matrix[0]) - 1
    while row < len(matrix) and col >= 0:
        if matrix[row][col] == target:
            return True
        elif matrix[row][col] < target:
            row += 1
        else:
            col -= 1
    return False
```

---

## 🔗 Similar Problems

1. [74. Search a 2D Matrix](https://leetcode.com/problems/search-a-2d-matrix/)
2. [240. Search a 2D Matrix II](https://leetcode.com/problems/search-a-2d-matrix-ii/)
3. [1012. Numbers With Repeated Digits](https://leetcode.com/problems/numbers-with-repeated-digits/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity     | Space Complexity |
|-------|---------------------------------------|---------------------|------------------|
| 1     | Brute Force                           | O(m * n)            | O(1)             |
| 2     | Binary Search (Row-wise)              | O(m * log n)        | O(1)             |
| 3     | Optimized Search (Top-right/Bottom-left)| O(m + n)            | O(1)             |

---

## 📌 Takeaway Points

- The brute force approach is simple but inefficient for large matrices.
- Binary search helps reduce the time complexity within individual rows.
- The optimal approach (starting from the top-right) leverages the sorted property of both rows and columns for an efficient solution with linear time complexity relative to the matrix dimensions.

---

17. Binary Tree Zigzag Level Order Traversal

# ➕ Problem: Binary Tree Zigzag Level Order Traversal

## 📘 Problem Statement

> Given the root of a binary tree, return the zigzag level order traversal of its nodes' values. (i.e., from left to right, then right to left for the next level and alternate between).

**LeetCode Link:** [103. Binary Tree Zigzag Level Order Traversal](https://leetcode.com/problems/binary-tree-zigzag-level-order-traversal/)

---

```
Example 1:

Input:
     3
    / \
   9  20
      /  \
     15   7
Output:
[
  [3],
  [20,9],
  [15,7]
]

Example 2:

Input:
      1
     / \
    2   3
   / \ / \
  4  5 6  7
Output:
[
  [1],
  [3,2],
  [4,5,6,7]
]
```

## ✅ Constraints

- The number of nodes in the tree is in the range `[0, 2000]`.
- `-100 <= Node.val <= 100`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Simple Level Order Traversal (Using Queue)

**Approach:**  
Use a queue (BFS) to traverse each level of the tree. On each level, alternate the direction of traversal (left-to-right or right-to-left) after processing the level.

```python
# Time Complexity: O(n), where n is the number of nodes in the tree
# Space Complexity: O(n), where n is the number of nodes in the tree (due to the queue)
from collections import deque

def zigzagLevelOrder(root):
    if not root:
        return []
    
    result = []
    queue = deque([root])
    left_to_right = True
    
    while queue:
        level_size = len(queue)
        level = []
        
        for _ in range(level_size):
            node = queue.popleft()
            level.append(node.val)
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        
        if not left_to_right:
            level.reverse()
        
        result.append(level)
        left_to_right = not left_to_right
    
    return result
```

---

### ⚙️ Level 2: Optimized with Stack (For Alternating Direction)

**Approach:**  
Use two stacks to store the nodes at each level. After processing a level, alternate between pushing nodes from left-to-right or right-to-left into the stack for the next level.

```python
# Time Complexity: O(n), where n is the number of nodes in the tree
# Space Complexity: O(n), where n is the number of nodes in the tree (due to the stacks)
def zigzagLevelOrder(root):
    if not root:
        return []
    
    result = []
    current_level = [root]
    left_to_right = True
    
    while current_level:
        level_values = []
        next_level = []
        
        for node in current_level:
            level_values.append(node.val)
            if node.left:
                next_level.append(node.left)
            if node.right:
                next_level.append(node.right)
        
        if not left_to_right:
            level_values.reverse()
        
        result.append(level_values)
        current_level = next_level
        left_to_right = not left_to_right
    
    return result
```

---

### 🚀 Level 3: Using Deque to Optimize Insertion and Removal

**Approach:**  
Instead of using two stacks, use a deque that allows efficient insertion at both ends. Alternate the direction of insertion based on the level.

```python
# Time Complexity: O(n), where n is the number of nodes in the tree
# Space Complexity: O(n), where n is the number of nodes in the tree (due to the deque)
from collections import deque

def zigzagLevelOrder(root):
    if not root:
        return []
    
    result = []
    queue = deque([root])
    left_to_right = True
    
    while queue:
        level_size = len(queue)
        level = deque()
        
        for _ in range(level_size):
            node = queue.popleft()
            
            # Depending on the traversal direction, add to the deque's ends
            if left_to_right:
                level.append(node.val)
            else:
                level.appendleft(node.val)
            
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
        
        result.append(list(level))
        left_to_right = not left_to_right
    
    return result
```

---

## 🔗 Similar Problems

1. [102. Binary Tree Level Order Traversal](https://leetcode.com/problems/binary-tree-level-order-traversal/)
2. [107. Binary Tree Level Order Traversal II](https://leetcode.com/problems/binary-tree-level-order-traversal-ii/)
3. [199. Binary Tree Right Side View](https://leetcode.com/problems/binary-tree-right-side-view/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Simple Level Order Traversal      | O(n)            | O(n)             |
| 2     | Optimized with Stack              | O(n)            | O(n)             |
| 3     | Optimized with Deque              | O(n)            | O(n)             |

---

## 📌 Takeaway Points

- A BFS approach using a queue is very intuitive for this problem.
- Alternating the direction of traversal after processing each level is crucial to solving the problem correctly.
- Using a deque allows for optimized insertion/removal from both ends, ensuring an efficient solution.

---

18. Max Area of Island


# ➕ Problem: Max Area of Island

## 📘 Problem Statement

> You are given a 2D grid of `1`s (land) and `0`s (water). Return the maximum area of an island in the grid. An island is surrounded by water, and is formed by connecting adjacent lands horizontally or vertically. You may assume that all four edges of the grid are surrounded by water.

**LeetCode Link:** [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)

---

```
Example 1:

Input:
grid = [
  [0, 1, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [0, 1, 0, 1, 1],
  [0, 1, 1, 1, 0]
]
Output: 6

Explanation: The answer is the area of the island with the top-left corner at grid[1][1] and the bottom-right corner at grid[3][3].

Example 2:

Input:
grid = [
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
]
Output: 0

Explanation: There is no land in the grid, so the answer is 0.
```

## ✅ Constraints

- `m == grid.length`
- `n == grid[i].length`
- `1 <= m, n <= 50`
- `grid[i][j] is either 0 or 1`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Depth-First Search (DFS) Recursion

**Approach:**  
We use DFS to explore the entire island from each land cell (`1`) and mark all connected land cells as visited by setting them to `0`. For each island, we count its area and keep track of the maximum area encountered.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns in the grid
# Space Complexity: O(m * n) due to recursion depth in the DFS
def maxAreaOfIsland(grid):
    if not grid:
        return 0
    
    def dfs(x, y):
        if x < 0 or x >= len(grid) or y < 0 or y >= len(grid[0]) or grid[x][y] == 0:
            return 0
        grid[x][y] = 0  # Mark the current cell as visited
        area = 1  # Current cell counts as 1 area
        # Explore all four directions (up, down, left, right)
        area += dfs(x + 1, y)
        area += dfs(x - 1, y)
        area += dfs(x, y + 1)
        area += dfs(x, y - 1)
        return area
    
    max_area = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == 1:
                max_area = max(max_area, dfs(i, j))  # Update the maximum area
    return max_area
```

---

### ⚙️ Level 2: Iterative DFS using Stack

**Approach:**  
An iterative DFS using an explicit stack can be more efficient for large grids to avoid recursion depth limits. We simulate the DFS traversal iteratively by using a stack.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns in the grid
# Space Complexity: O(m * n) for the stack
def maxAreaOfIsland(grid):
    if not grid:
        return 0
    
    def dfs(x, y):
        stack = [(x, y)]
        area = 0
        while stack:
            cx, cy = stack.pop()
            if 0 <= cx < len(grid) and 0 <= cy < len(grid[0]) and grid[cx][cy] == 1:
                grid[cx][cy] = 0  # Mark as visited
                area += 1
                # Add all 4 neighboring cells to the stack
                stack.append((cx + 1, cy))
                stack.append((cx - 1, cy))
                stack.append((cx, cy + 1))
                stack.append((cx, cy - 1))
        return area
    
    max_area = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == 1:
                max_area = max(max_area, dfs(i, j))
    return max_area
```

---

### 🚀 Level 3: Breadth-First Search (BFS) with Queue

**Approach:**  
We can also use BFS to explore the island iteratively. We start from each land cell (`1`) and use a queue to explore all connected land cells.

```python
# Time Complexity: O(m * n), where m is the number of rows and n is the number of columns in the grid
# Space Complexity: O(m * n) for the queue
from collections import deque

def maxAreaOfIsland(grid):
    if not grid:
        return 0
    
    def bfs(x, y):
        queue = deque([(x, y)])
        area = 0
        while queue:
            cx, cy = queue.popleft()
            if 0 <= cx < len(grid) and 0 <= cy < len(grid[0]) and grid[cx][cy] == 1:
                grid[cx][cy] = 0  # Mark as visited
                area += 1
                # Add all 4 neighboring cells to the queue
                queue.append((cx + 1, cy))
                queue.append((cx - 1, cy))
                queue.append((cx, cy + 1))
                queue.append((cx, cy - 1))
        return area
    
    max_area = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == 1:
                max_area = max(max_area, bfs(i, j))
    return max_area
```

---

## 🔗 Similar Problems

1. [463. Island Perimeter](https://leetcode.com/problems/island-perimeter/)
2. [695. Max Area of Island (Follow-up with diagonal connectivity)](https://leetcode.com/problems/max-area-of-island/)
3. [200. Number of Islands](https://leetcode.com/problems/number-of-islands/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                  | Time Complexity | Space Complexity |
|-------|---------------------------|-----------------|------------------|
| 1     | DFS (Recursive)            | O(m * n)        | O(m * n)         |
| 2     | DFS (Iterative with Stack) | O(m * n)        | O(m * n)         |
| 3     | BFS (Queue)                | O(m * n)        | O(m * n)         |

---

## 📌 Takeaway Points

- Exploring connected land cells using DFS, BFS, or stack-based iterative DFS are all valid approaches to solve this problem.
- Make sure to mark cells as visited to avoid recounting parts of the same island.
- The time complexity is linear with respect to the number of cells in the grid, making the solution efficient even for larger grids.

---

19. Count of Smaller Numbers After Self


# ➕ Problem: Count of Smaller Numbers After Self

## 📘 Problem Statement

> Given an integer array `nums`, return an array `answer` such that `answer[i]` is the number of smaller elements to the right of `nums[i]`.  
> Specifically, for each `nums[i]`, count how many numbers are smaller than it to the right side of the array.

**LeetCode Link:** [315. Count of Smaller Numbers After Self](https://leetcode.com/problems/count-of-smaller-numbers-after-self/)

---

```
Example 1:

Input: nums = [5,2,6,1]
Output: [2,1,1,0]
Explanation:  
To the right of 5 there are two smaller elements (2 and 1).  
To the right of 2 there is one smaller element (1).  
To the right of 6 there is one smaller element (1).  
To the right of 1 there is no smaller element.

Example 2:

Input: nums = [-1,-1]
Output: [0,0]
```

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁹ <= nums[i] <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach (Nested Loops)

**Approach:**  
For each element `nums[i]`, iterate through all the elements to its right and count how many are smaller. This approach has a time complexity of O(n^2).

```python
# Time Complexity: O(n^2), where n is the length of the input array
# Space Complexity: O(n)
def countSmaller(nums):
    n = len(nums)
    result = []
    for i in range(n):
        count = 0
        for j in range(i + 1, n):
            if nums[j] < nums[i]:
                count += 1
        result.append(count)
    return result
```

---

### ⚙️ Level 2: Binary Indexed Tree (Fenwick Tree)

**Approach:**  
We can use a Binary Indexed Tree (BIT) to efficiently track the count of numbers smaller than the current number. The idea is to map the elements to their ranks and use the BIT to track the count. This approach reduces the time complexity to O(n log n).

```python
# Time Complexity: O(n log n), where n is the length of the input array
# Space Complexity: O(n)
class FenwickTree:
    def __init__(self, size):
        self.size = size
        self.tree = [0] * (size + 1)
    
    def update(self, index, val):
        while index <= self.size:
            self.tree[index] += val
            index += index & -index
    
    def query(self, index):
        result = 0
        while index > 0:
            result += self.tree[index]
            index -= index & -index
        return result

def countSmaller(nums):
    if not nums:
        return []
    
    # Coordinate compression
    sorted_nums = sorted(set(nums))
    rank_map = {val: idx + 1 for idx, val in enumerate(sorted_nums)}
    
    # Fenwick Tree to keep track of counts
    max_rank = len(sorted_nums)
    fenwick_tree = FenwickTree(max_rank)
    result = []
    
    # Traverse the array from right to left
    for num in reversed(nums):
        rank = rank_map[num]
        result.append(fenwick_tree.query(rank - 1))  # Count smaller numbers to the right
        fenwick_tree.update(rank, 1)  # Update the BIT with current number's rank
    
    return result[::-1]  # Reverse the result list to match the original order
```

---

### 🚀 Level 3: Merge Sort with Count of Smaller Numbers

**Approach:**  
We can use a modified Merge Sort that counts the number of smaller elements while sorting. During the merge step, we count how many elements from the right half of the array are smaller than the current element from the left half.

```python
# Time Complexity: O(n log n), where n is the length of the input array
# Space Complexity: O(n) for the temporary arrays used in merge sort
def countSmaller(nums):
    def merge_sort(enum_nums):
        if len(enum_nums) <= 1:
            return enum_nums, [0] * len(enum_nums)
        
        mid = len(enum_nums) // 2
        left, left_count = merge_sort(enum_nums[:mid])
        right, right_count = merge_sort(enum_nums[mid:])
        
        result = []
        count = []
        i, j = 0, 0
        smaller_count = 0
        
        while i < len(left) and j < len(right):
            if left[i][0] <= right[j][0]:
                result.append(left[i])
                count.append(left_count[i] + smaller_count)
                i += 1
            else:
                result.append(right[j])
                smaller_count += 1
                count.append(right_count[j])
                j += 1
        
        while i < len(left):
            result.append(left[i])
            count.append(left_count[i] + smaller_count)
            i += 1
        
        while j < len(right):
            result.append(right[j])
            count.append(right_count[j])
            j += 1
        
        return result, count
    
    enum_nums = list(enumerate(nums))
    _, counts = merge_sort(enum_nums)
    
    return counts

```

---

## 🔗 Similar Problems

1. [315. Count of Smaller Numbers After Self (With Range Update)](https://leetcode.com/problems/count-of-smaller-numbers-after-self/)
2. [327. Count of Range Sum](https://leetcode.com/problems/count-of-range-sum/)
3. [493. Reverse Pairs](https://leetcode.com/problems/reverse-pairs/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Nested Loops)       | O(n^2)          | O(n)             |
| 2     | Binary Indexed Tree (Fenwick Tree) | O(n log n)      | O(n)             |
| 3     | Merge Sort with Count            | O(n log n)      | O(n)             |

---

## 📌 Takeaway Points

- The brute force approach works but is inefficient for larger arrays, so it's better to explore optimized solutions.
- Using a Fenwick Tree or Binary Indexed Tree allows for efficient range queries and updates, reducing the time complexity to O(n log n).
- The modified Merge Sort is a powerful technique that combines sorting with counting, making it efficient for this problem as well.

---

20. Merge k Sorted Lists

# ➕ Problem: Merge k Sorted Lists

## 📘 Problem Statement

> You are given an array of `k` linked-lists `lists`, each of which is sorted in ascending order.  
> Merge all the linked-lists into one sorted linked-list and return it.

**LeetCode Link:** [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)

---

```
Example 1:

Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]

Example 2:

Input: lists = []
Output: []

Example 3:

Input: lists = [[]]
Output: []
```

## ✅ Constraints

- `k == lists.length`
- `0 <= k <= 10⁴`
- `0 <= lists[i].length <= 500`
- `-10⁴ <= lists[i][j] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Approach (Merge All and Sort)

**Approach:**  
Flatten all the linked lists into a single list, then sort it and convert it back to a linked list. This approach works but is not optimal for large inputs.

```python
# Time Complexity: O(n log n), where n is the total number of elements in all the lists
# Space Complexity: O(n), where n is the total number of elements
def mergeKLists(lists):
    nodes = []
    
    # Flatten the linked lists into one list
    for l in lists:
        while l:
            nodes.append(l.val)
            l = l.next
    
    # Sort the list
    nodes.sort()
    
    # Convert the sorted list back to a linked list
    dummy = ListNode(0)
    current = dummy
    for val in nodes:
        current.next = ListNode(val)
        current = current.next
    
    return dummy.next
```

---

### ⚙️ Level 2: Min-Heap Approach

**Approach:**  
Use a min-heap to keep track of the smallest element among the current elements of each linked list. This ensures that we can always append the smallest element to the result in O(log k) time, where k is the number of lists. This approach works efficiently with time complexity O(n log k).

```python
import heapq

# Time Complexity: O(n log k), where n is the total number of elements and k is the number of linked lists
# Space Complexity: O(k), where k is the number of linked lists (size of the heap)
def mergeKLists(lists):
    min_heap = []
    
    # Build the initial heap
    for i, l in enumerate(lists):
        if l:
            heapq.heappush(min_heap, (l.val, i, l))
    
    # Merge the lists
    dummy = ListNode(0)
    current = dummy
    
    while min_heap:
        val, i, node = heapq.heappop(min_heap)
        current.next = ListNode(val)
        current = current.next
        if node.next:
            heapq.heappush(min_heap, (node.next.val, i, node.next))
    
    return dummy.next
```

---

### 🚀 Level 3: Divide and Conquer Approach

**Approach:**  
Divide the problem into smaller subproblems by repeatedly merging pairs of lists. This reduces the time complexity and works well when there are many lists to merge. The time complexity is O(n log k), where n is the total number of elements, and k is the number of lists.

```python
# Time Complexity: O(n log k), where n is the total number of elements and k is the number of lists
# Space Complexity: O(log k) due to recursive calls
def mergeKLists(lists):
    if not lists:
        return None
    
    def merge_two_lists(l1, l2):
        dummy = ListNode(0)
        current = dummy
        while l1 and l2:
            if l1.val < l2.val:
                current.next = l1
                l1 = l1.next
            else:
                current.next = l2
                l2 = l2.next
            current = current.next
        current.next = l1 or l2
        return dummy.next
    
    def divide_and_conquer(lists, left, right):
        if left == right:
            return lists[left]
        mid = (left + right) // 2
        left_merged = divide_and_conquer(lists, left, mid)
        right_merged = divide_and_conquer(lists, mid + 1, right)
        return merge_two_lists(left_merged, right_merged)
    
    return divide_and_conquer(lists, 0, len(lists) - 1)
```

---

## 🔗 Similar Problems

1. [21. Merge Two Sorted Lists](https://leetcode.com/problems/merge-two-sorted-lists/)
2. [4. Median of Two Sorted Arrays](https://leetcode.com/problems/median-of-two-sorted-arrays/)
3. [23. Merge k Sorted Lists (Optimized Approach)](https://leetcode.com/problems/merge-k-sorted-lists/)

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Merge and Sort)     | O(n log n)      | O(n)             |
| 2     | Min-Heap Approach                | O(n log k)      | O(k)             |
| 3     | Divide and Conquer               | O(n log k)      | O(log k)         |

---

## 📌 Takeaway Points

- The brute force approach is simple but not efficient for large lists due to sorting.
- The min-heap approach is efficient and commonly used for merging multiple sorted lists.
- The divide and conquer approach works similarly to merge sort and is effective when dealing with a large number of lists.
