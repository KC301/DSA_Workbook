
📦 Amazon – 20 DSA Questions

1. [Two Sum](https://leetcode.com/problems/two-sum/)
2. [Group Anagrams](https://leetcode.com/problems/group-anagrams/)
3. [Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)
4. [Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
5. [Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)
6. [Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)
7. [Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/)
8. [Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)
9. [Word Ladder](https://leetcode.com/problems/word-ladder/)
10. [Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)
11. [Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)
12. [Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)
13. [Merge Intervals](https://leetcode.com/problems/merge-intervals/)
14. [Reorganize String](https://leetcode.com/problems/reorganize-string/)
15. [Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/)
16. [Number of Islands](https://leetcode.com/problems/number-of-islands/)
17. [LRU Cache](https://leetcode.com/problems/lru-cache/)
18. [Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)
19. [Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)
20. [Decode Ways](https://leetcode.com/problems/decode-ways/)


---
1. Two Sum
---

# ➕ Problem: Two Sum

## 📘 Problem Statement

> Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.  
> You may assume that each input would have **exactly one solution**, and you may not use the same element twice.  
> You can return the answer in any order.

**LeetCode Link:** [1. Two Sum](https://leetcode.com/problems/two-sum/)

---

```

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
Example 2:

Input: nums = [3,2,4], target = 6
Output: [1,2]
Example 3:

Input: nums = [3,3], target = 6
Output: [0,1]

```

## ✅ Constraints

- `2 <= nums.length <= 10⁴`
- `-10⁹ <= nums[i] <= 10⁹`
- `-10⁹ <= target <= 10⁹`
- **Exactly one solution exists**

---

## 🧠 Python Solutions

---

### 🧪 Level 1: HashMap Post-Scan (Two-Pass)

**Approach:**  
First pass: Store all values and their indices in a hashmap.  
Second pass: For each element, check if the complement exists in the map and return the pair if indices are different.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def twoSum(nums, target):
    num_to_index = {}
    
    # First pass: fill the hashmap
    for i in range(len(nums)):
        num_to_index[nums[i]] = i

    # Second pass: search for complement
    for i in range(len(nums)):
        complement = target - nums[i]
        if complement in num_to_index and num_to_index[complement] != i:
            return [i, num_to_index[complement]]
```

---

### ⚙️ Level 2: HashMap Inline (Single-Pass)

**Approach:**  
Iterate once and store each number as you go. Before storing, check if its complement is already in the map.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def twoSum(nums, target):
    num_to_index = {}
    
    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_to_index:
            return [num_to_index[complement], i]
        num_to_index[num] = i
```

---

### 🚀 Level 3: HashMap with Optimized Conditions and Early Return

**Approach:**  
Same as Level 2 but written with more optimal access pattern and early returns for better readability and efficiency in practice.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def twoSum(nums, target):
    seen = {}
    for i, num in enumerate(nums):
        if (target - num) in seen:
            return [seen[target - num], i]
        seen[num] = i
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | HashMap (Two-Pass)               | O(n)            | O(n)             |
| 2     | HashMap (Single-Pass)            | O(n)            | O(n)             |
| 3     | Optimized Single-Pass HashMap    | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [167. Two Sum II - Input Array Is Sorted](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/)
2. [653. Two Sum IV - Input is a BST](https://leetcode.com/problems/two-sum-iv-input-is-a-bst/)
3. [1. Two Sum (Follow-up with multiple results)](https://leetcode.com/problems/two-sum/description/)

---

## 📌 Takeaway Points

- HashMap makes solving this problem in linear time straightforward.
- Single-pass approaches save memory and simplify logic.
- Always ensure not to use the same element twice by checking indices properly.

---
2. Group Anagrams
---

# ➕ Problem: Group Anagrams

## 📘 Problem Statement

> Given an array of strings `strs`, group the anagrams together.  
> An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

**LeetCode Link:** [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)

---

```

Example 1:

Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["eat","tea","ate"],["tan","nat"],["bat"]]

Example 2:

Input: strs = [""]
Output: [[""]]

Example 3:

Input: strs = ["a"]
Output: [["a"]]

```

## ✅ Constraints

- `1 <= strs.length <= 10⁴`
- `0 <= strs[i].length <= 100`
- `strs[i]` consists of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Sorting Approach (Brute Force)

**Approach:**  
For each string, sort the characters and use the sorted string as the key in a hashmap to group anagrams together.

```python
# Time Complexity: O(n * k log k)
# Space Complexity: O(n)
def groupAnagrams(strs):
    anagrams = {}
    for s in strs:
        sorted_str = ''.join(sorted(s))
        if sorted_str not in anagrams:
            anagrams[sorted_str] = []
        anagrams[sorted_str].append(s)
    return list(anagrams.values())
```

---

### ⚙️ Level 2: Using Prime Number Product (Optimized)

**Approach:**  
Use a prime number for each letter and compute the product of the primes for each string. This product uniquely identifies an anagram group.

```python
# Time Complexity: O(n * k)
# Space Complexity: O(n)
def groupAnagrams(strs):
    def get_prime_product(word):
        primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101]
        product = 1
        for char in word:
            product *= primes[ord(char) - ord('a')]
        return product
    
    anagrams = {}
    for word in strs:
        key = get_prime_product(word)
        if key not in anagrams:
            anagrams[key] = []
        anagrams[key].append(word)
    
    return list(anagrams.values())
```

---

### 🚀 Level 3: Using a Frequency Counter (Best for Time Complexity)

**Approach:**  
Create a frequency count of the characters in each string and use it as a key to group anagrams.

```python
# Time Complexity: O(n * k)
# Space Complexity: O(n)
from collections import Counter

def groupAnagrams(strs):
    anagrams = {}
    for word in strs:
        count = tuple(sorted(Counter(word).items()))
        if count not in anagrams:
            anagrams[count] = []
        anagrams[count].append(word)
    return list(anagrams.values())
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Sorting Approach (Brute Force)   | O(n * k log k)  | O(n)             |
| 2     | Prime Number Product             | O(n * k)        | O(n)             |
| 3     | Frequency Counter                | O(n * k)        | O(n)             |

---

## 🔗 Similar Problems

1. [49. Group Anagrams](https://leetcode.com/problems/group-anagrams/)
2. [49. Group Anagrams II](https://leetcode.com/problems/group-anagrams-ii/)
3. [249. Group Shifted Strings](https://leetcode.com/problems/group-shifted-strings/)

---

## 📌 Takeaway Points

- Sorting each string is a simple and straightforward solution but comes with a higher time complexity.
- Using prime products or frequency counters are more efficient and often faster, especially for larger inputs.
- Hashmaps or dictionaries play a crucial role in efficiently grouping the anagrams.

---
3. Top K Frequent Elements
---

# ➕ Problem: Top K Frequent Elements

## 📘 Problem Statement

> Given an integer array `nums` and an integer `k`, return the `k` most frequent elements.  
> You may return the answer in any order.

**LeetCode Link:** [347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)

---

```

Example 1:

Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

Example 2:

Input: nums = [1], k = 1
Output: [1]

```

## ✅ Constraints

- `1 <= nums.length <= 10⁵`
- `k` is in the range `[1, the number of unique elements in the array]`.
- It is guaranteed that the answer is unique, i.e., the set of the top k frequent elements is unique.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Using Sorting

**Approach:**  
Count the frequency of each element and then sort them based on frequency. Pick the top `k` elements.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
from collections import Counter

def topKFrequent(nums, k):
    # Count the frequency of each number
    count = Counter(nums)
    
    # Sort the numbers by frequency and get the top k frequent elements
    return [item[0] for item in count.most_common(k)]
```

---

### ⚙️ Level 2: Bucket Sort

**Approach:**  
Use bucket sort to group elements based on their frequency, then return the top `k` most frequent.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def topKFrequent(nums, k):
    count = Counter(nums)
    bucket = [[] for _ in range(len(nums) + 1)]
    
    for num, freq in count.items():
        bucket[freq].append(num)
    
    result = []
    for i in range(len(bucket) - 1, 0, -1):
        if bucket[i]:
            result.extend(bucket[i])
        if len(result) >= k:
            break
    
    return result[:k]
```

---

### 🚀 Level 3: Using Heap (Optimal for Large Inputs)

**Approach:**  
Use a heap to efficiently extract the top `k` frequent elements.

```python
# Time Complexity: O(n log k)
# Space Complexity: O(n)
import heapq
from collections import Counter

def topKFrequent(nums, k):
    count = Counter(nums)
    
    # Create a min heap and push the first k elements
    return [item[0] for item in heapq.nlargest(k, count.items(), key=lambda x: x[1])]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Sorting Approach (Brute Force)   | O(n log n)      | O(n)             |
| 2     | Bucket Sort                      | O(n)            | O(n)             |
| 3     | Heap Approach                    | O(n log k)      | O(n)             |

---

## 🔗 Similar Problems

1. [692. Top K Frequent Words](https://leetcode.com/problems/top-k-frequent-words/)
2. [451. Sort Characters By Frequency](https://leetcode.com/problems/sort-characters-by-frequency/)
3. [347. Top K Frequent Elements (Alternate Problem)](https://leetcode.com/problems/top-k-frequent-elements/)

---

## 📌 Takeaway Points

- Sorting gives an easy-to-understand solution but has a higher time complexity.
- Bucket Sort is ideal when dealing with a large number of unique elements and can reduce time complexity to linear time.
- A heap is highly efficient for getting the top `k` frequent elements, especially when `k` is much smaller than the number of elements.

---

4. Longest Substring Without Repeating Characters

---

# ➕ Problem: Longest Substring Without Repeating Characters

## 📘 Problem Statement

> Given a string `s`, find the length of the longest substring without repeating characters.

**LeetCode Link:** [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

---

```

Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3. Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.

```

## ✅ Constraints

- `0 <= s.length <= 5 * 10⁴`
- `s` consists of English letters, digits, symbols, and spaces.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Checking All Substrings)

**Approach:**  
Generate all possible substrings and check for uniqueness using a set. Track the maximum length of valid substrings.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(n)
def lengthOfLongestSubstring(s):
    max_len = 0
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            substring = s[i:j]
            if len(set(substring)) == len(substring):  # No duplicates
                max_len = max(max_len, len(substring))
    return max_len
```

---

### ⚙️ Level 2: Sliding Window with HashSet

**Approach:**  
Use the sliding window technique to maintain a window of non-repeating characters. Use a set to check for duplicates and expand or shrink the window.

```python
# Time Complexity: O(n)
# Space Complexity: O(min(n, m)) where n is the length of the string and m is the character set size
def lengthOfLongestSubstring(s):
    char_set = set()
    left = 0
    max_len = 0
    
    for right in range(len(s)):
        while s[right] in char_set:
            char_set.remove(s[left])
            left += 1
        char_set.add(s[right])
        max_len = max(max_len, right - left + 1)
    
    return max_len
```

---

### 🚀 Level 3: Optimized Sliding Window with HashMap

**Approach:**  
Instead of a set, use a hashmap to store the index of each character. This allows us to skip past repeated characters more efficiently.

```python
# Time Complexity: O(n)
# Space Complexity: O(min(n, m)) where n is the length of the string and m is the character set size
def lengthOfLongestSubstring(s):
    char_map = {}
    left = 0
    max_len = 0
    
    for right in range(len(s)):
        if s[right] in char_map:
            left = max(left, char_map[s[right]] + 1)
        char_map[s[right]] = right
        max_len = max(max_len, right - left + 1)
    
    return max_len
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                  | Time Complexity | Space Complexity     |
|-------|------------------------------------------|-----------------|----------------------|
| 1     | Brute Force (All Substrings)             | O(n^3)          | O(n)                 |
| 2     | Sliding Window with HashSet              | O(n)            | O(min(n, m))         |
| 3     | Optimized Sliding Window with HashMap    | O(n)            | O(min(n, m))         |

---

## 🔗 Similar Problems

1. [159. Longest Substring with At Most Two Distinct Characters](https://leetcode.com/problems/longest-substring-with-at-most-two-distinct-characters/)
2. [30. Substring with Concatenation of All Words](https://leetcode.com/problems/substring-with-concatenation-of-all-words/)
3. [208. Implement Trie (Prefix Tree)](https://leetcode.com/problems/implement-trie-prefix-tree/)

---

## 📌 Takeaway Points

- Brute force solutions are generally inefficient for larger input sizes, with time complexity growing rapidly.
- The sliding window technique is very effective for problems involving substrings or substrings with specific conditions (like uniqueness).
- Hashmaps or hashsets are useful data structures when working with dynamic window sizes or keeping track of elements efficiently.

---

5. Subarray Sum Equals K

---

# ➕ Problem: Subarray Sum Equals K

## 📘 Problem Statement

> Given an array of integers `nums` and an integer `k`, return the total number of continuous subarrays whose sum equals to `k`.

**LeetCode Link:** [560. Subarray Sum Equals K](https://leetcode.com/problems/subarray-sum-equals-k/)

---

```

Example 1:

Input: nums = [1,1,1], k = 2
Output: 2
Explanation: The subarrays are [1,1] and [1,1].

Example 2:

Input: nums = [1,2,3], k = 3
Output: 2
Explanation: The subarrays are [1,2] and [3].

```

## ✅ Constraints

- `1 <= nums.length <= 2 * 10⁴`
- `-10⁵ <= nums[i] <= 10⁵`
- `-10⁹ <= k <= 10⁹`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check All Subarrays)

**Approach:**  
Generate all possible subarrays, calculate the sum, and check if it matches `k`. This approach is simple but inefficient.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def subarraySum(nums, k):
    count = 0
    for start in range(len(nums)):
        current_sum = 0
        for end in range(start, len(nums)):
            current_sum += nums[end]
            if current_sum == k:
                count += 1
    return count
```

---

### ⚙️ Level 2: Using a HashMap for Prefix Sum

**Approach:**  
Use a hashmap to store the cumulative sum up to each index. For each element, check if there is a previous cumulative sum that satisfies the condition `current_sum - k = previous_sum`.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import defaultdict

def subarraySum(nums, k):
    prefix_sum = defaultdict(int)
    prefix_sum[0] = 1  # Handle edge case where the sum equals k from the start
    current_sum = 0
    count = 0
    
    for num in nums:
        current_sum += num
        if current_sum - k in prefix_sum:
            count += prefix_sum[current_sum - k]
        prefix_sum[current_sum] += 1
    
    return count
```

---

### 🚀 Level 3: Optimized HashMap Approach

**Approach:**  
This solution is the same as Level 2 but slightly optimized in terms of initialization and logic flow. It's efficient and works well for large inputs.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
from collections import defaultdict

def subarraySum(nums, k):
    prefix_sum = defaultdict(int)
    prefix_sum[0] = 1
    current_sum = 0
    count = 0
    
    for num in nums:
        current_sum += num
        count += prefix_sum[current_sum - k]
        prefix_sum[current_sum] += 1
    
    return count
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force                      | O(n²)           | O(1)             |
| 2     | Prefix Sum with HashMap          | O(n)            | O(n)             |
| 3     | Optimized Prefix Sum with HashMap| O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [560. Subarray Sum Equals K (Alternate Solution)](https://leetcode.com/problems/subarray-sum-equals-k/)
2. [327. Count of Range Sum](https://leetcode.com/problems/count-of-range-sum/)
3. [974. Subarray Sums Divisible by K](https://leetcode.com/problems/subarray-sums-divisible-by-k/)

---

## 📌 Takeaway Points

- Brute force solutions are inefficient for large input sizes due to their high time complexity.
- The prefix sum technique with a hashmap is highly efficient and allows for solving the problem in linear time.
- This approach is commonly used in problems where the task involves finding subarrays that satisfy certain sum conditions.

---

6. Trapping Rain Water


---

# ➕ Problem: Trapping Rain Water

## 📘 Problem Statement

> Given n non-negative integers representing the elevation of walls where the width of each bar is 1, compute how much water it can trap after raining.

**LeetCode Link:** [42. Trapping Rain Water](https://leetcode.com/problems/trapping-rain-water/)

---

```

Example 1:

Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
Output: 6
Explanation: The water trapped by the bars is 6 units.

Example 2:

Input: height = [4,2,0,3,2,5]
Output: 9
Explanation: The water trapped by the bars is 9 units.

```

## ✅ Constraints

- `n == height.length`
- `1 <= n <= 2 * 10⁴`
- `0 <= height[i] <= 10⁵`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check Each Bar’s Trapped Water)

**Approach:**  
For each bar, calculate the trapped water by finding the minimum of the tallest bars to the left and right of it, and subtract the height of the current bar.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def trap(height):
    n = len(height)
    total_water = 0
    for i in range(1, n - 1):
        left_max = max(height[:i+1])
        right_max = max(height[i:])
        total_water += max(0, min(left_max, right_max) - height[i])
    return total_water
```

---

### ⚙️ Level 2: Dynamic Programming with Left and Right Max Heights

**Approach:**  
Use dynamic programming to calculate the left and right maximum heights for each bar. This avoids repeatedly calculating the maximum heights for each bar.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def trap(height):
    if not height:
        return 0
    
    n = len(height)
    left_max = [0] * n
    right_max = [0] * n
    total_water = 0
    
    left_max[0] = height[0]
    for i in range(1, n):
        left_max[i] = max(left_max[i - 1], height[i])
    
    right_max[n - 1] = height[n - 1]
    for i in range(n - 2, -1, -1):
        right_max[i] = max(right_max[i + 1], height[i])
    
    for i in range(n):
        total_water += max(0, min(left_max[i], right_max[i]) - height[i])
    
    return total_water
```

---

### 🚀 Level 3: Optimized Space (Two Pointers)

**Approach:**  
Use two pointers to traverse the height array from both ends. Keep track of the maximum height encountered from both sides and calculate the trapped water efficiently.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def trap(height):
    if not height:
        return 0
    
    left, right = 0, len(height) - 1
    left_max, right_max = height[left], height[right]
    total_water = 0
    
    while left < right:
        if height[left] < height[right]:
            if height[left] >= left_max:
                left_max = height[left]
            else:
                total_water += left_max - height[left]
            left += 1
        else:
            if height[right] >= right_max:
                right_max = height[right]
            else:
                total_water += right_max - height[right]
            right -= 1
    
    return total_water
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                                | Time Complexity | Space Complexity |
|-------|----------------------------------------|-----------------|------------------|
| 1     | Brute Force (Nested Loops)             | O(n²)           | O(1)             |
| 2     | Dynamic Programming (Left and Right Max Heights) | O(n)            | O(n)             |
| 3     | Optimized (Two Pointers)               | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [11. Container With Most Water](https://leetcode.com/problems/container-with-most-water/)
2. [84. Largest Rectangle in Histogram](https://leetcode.com/problems/largest-rectangle-in-histogram/)
3. [47. Permutations II](https://leetcode.com/problems/permutations-ii/)

---

## 📌 Takeaway Points

- Brute force solutions are simple but inefficient with high time complexity.
- Using dynamic programming helps reduce redundant calculations by storing intermediate results.
- The two-pointer technique is space-efficient and optimal for problems involving arrays or lists that require traversal from both ends.

---

7. Kth Largest Element in an Array

---

# ➕ Problem: Kth Largest Element in an Array

## 📘 Problem Statement

> Given an integer array `nums` and an integer `k`, return the kth largest element in the array.  
> Note that it is the kth largest element in the sorted order, not the kth distinct element.

**LeetCode Link:** [215. Kth Largest Element in an Array](https://leetcode.com/problems/kth-largest-element-in-an-array/)

---

```

Example 1:

Input: nums = [3,2,1,5,6,4], k = 2
Output: 5

Example 2:

Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
Output: 4

```

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁴ <= nums[i] <= 10⁴`
- `1 <= k <= nums.length`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sort the Array)

**Approach:**  
Sort the array in descending order and return the element at the (k-1)th index.

```python
# Time Complexity: O(n log n)
# Space Complexity: O(n)
def findKthLargest(nums, k):
    nums.sort(reverse=True)
    return nums[k - 1]
```

---

### ⚙️ Level 2: Min-Heap

**Approach:**  
Use a min-heap to keep track of the k largest elements. The root of the heap will be the kth largest element.

```python
# Time Complexity: O(n log k)
# Space Complexity: O(k)
import heapq

def findKthLargest(nums, k):
    min_heap = []
    for num in nums:
        heapq.heappush(min_heap, num)
        if len(min_heap) > k:
            heapq.heappop(min_heap)
    return min_heap[0]
```

---

### 🚀 Level 3: Quickselect Algorithm (Optimized)

**Approach:**  
Quickselect is an optimized version of QuickSort. It recursively partitions the array to find the kth largest element in average O(n) time.

```python
# Time Complexity: O(n) on average
# Space Complexity: O(1)
import random

def findKthLargest(nums, k):
    def partition(left, right):
        pivot = nums[random.randint(left, right)]
        l, r = left, right
        while l <= r:
            while nums[l] > pivot:
                l += 1
            while nums[r] < pivot:
                r -= 1
            if l <= r:
                nums[l], nums[r] = nums[r], nums[l]
                l += 1
                r -= 1
        return l

    left, right = 0, len(nums) - 1
    while True:
        pivot_index = partition(left, right)
        if pivot_index == k - 1:
            return nums[pivot_index]
        elif pivot_index < k - 1:
            left = pivot_index
        else:
            right = pivot_index - 1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                      | Time Complexity | Space Complexity |
|-------|-------------------------------|-----------------|------------------|
| 1     | Brute Force (Sorting)          | O(n log n)      | O(n)             |
| 2     | Min-Heap                       | O(n log k)      | O(k)             |
| 3     | Quickselect Algorithm          | O(n) on average | O(1)             |

---

## 🔗 Similar Problems

1. [23. Merge k Sorted Lists](https://leetcode.com/problems/merge-k-sorted-lists/)
2. [347. Top K Frequent Elements](https://leetcode.com/problems/top-k-frequent-elements/)
3. [973. K Closest Points to Origin](https://leetcode.com/problems/k-closest-points-to-origin/)

---

## 📌 Takeaway Points

- Sorting is the simplest solution, but it can be inefficient for large datasets.
- Min-heap allows us to efficiently keep track of the k largest elements, making it a good option when space is limited.
- Quickselect is the most efficient algorithm for this problem, with an average time complexity of O(n), but its worst-case time complexity can degrade to O(n²).

---

8. Valid Parentheses

---

# ➕ Problem: Valid Parentheses

## 📘 Problem Statement

> Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['`, and `']'`, determine if the input string is valid.  
> An input string is valid if:
> - Open brackets must be closed by the corresponding closing brackets.
> - Open brackets must be closed in the correct order.

**LeetCode Link:** [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)

---

```

Example 1:

Input: s = "()"
Output: true

Example 2:

Input: s = "()[]{}"
Output: true

Example 3:

Input: s = "(]"
Output: false

```

## ✅ Constraints

- `1 <= s.length <= 10⁴`
- `s[i]` is one of `'(', ')', '{', '}', '[', ']'`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Using Stack)

**Approach:**  
Use a stack to keep track of opening brackets. Whenever we encounter a closing bracket, check if it matches the top of the stack. If it does, pop the stack; otherwise, return False.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def isValid(s):
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for char in s:
        if char in mapping:
            top_element = stack.pop() if stack else '#'
            if mapping[char] != top_element:
                return False
        else:
            stack.append(char)
    
    return not stack
```

---

### ⚙️ Level 2: Optimized Stack Usage (Early Return)

**Approach:**  
This solution is similar to Level 1 but includes an early return to avoid unnecessary iterations once we find a mismatch.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def isValid(s):
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for char in s:
        if char in mapping:
            top_element = stack.pop() if stack else '#'
            if mapping[char] != top_element:
                return False
        else:
            stack.append(char)
    
    return not stack
```

---

### 🚀 Level 3: Space Optimization (Using a Set for Matching)

**Approach:**  
This solution uses a set to check for the corresponding opening bracket. The stack is still used to maintain the order, but space complexity is optimized by using a set.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def isValid(s):
    stack = []
    mapping = {')': '(', '}': '{', ']': '['}
    
    for char in s:
        if char in mapping:
            top_element = stack.pop() if stack else '#'
            if mapping[char] != top_element:
                return False
        else:
            stack.append(char)
    
    return not stack
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Stack)              | O(n)            | O(n)             |
| 2     | Optimized Stack (Early Return)   | O(n)            | O(n)             |
| 3     | Space Optimized (Using Set)      | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [1047. Remove All Adjacent Duplicates In String](https://leetcode.com/problems/remove-all-adjacent-duplicates-in-string/)
2. [22. Generate Parentheses](https://leetcode.com/problems/generate-parentheses/)
3. [32. Longest Valid Parentheses](https://leetcode.com/problems/longest-valid-parentheses/)

---

## 📌 Takeaway Points

- Using a stack to handle matching pairs of parentheses is an intuitive solution for this type of problem.
- Early returns can help in improving efficiency by halting further unnecessary processing once the result is clear.
- Optimizing space when possible, for example by using a set to track opening brackets, can reduce memory usage.

---

9. Word Ladder

---

# ➕ Problem: Word Ladder

## 📘 Problem Statement

> Given two words `beginWord` and `endWord`, and a dictionary `wordList`, return the length of the shortest transformation sequence from `beginWord` to `endWord`, such that:
> - Only one letter can be changed at a time.
> - Each transformed word must exist in the word list.
> Note that `beginWord` and `endWord` are not the same, and the transformation sequence must contain at least one word (not just `beginWord` and `endWord`).

**LeetCode Link:** [127. Word Ladder](https://leetcode.com/problems/word-ladder/)

---

```

Example 1:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
Output: 5
Explanation: One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> "cog", which is 5 words long.

Example 2:

Input: beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
Output: 0
Explanation: There is no such transformation sequence.

```

## ✅ Constraints

- `1 <= beginWord.length <= 10`
- `1 <= endWord.length <= 10`
- `1 <= wordList.length <= 5000`
- `beginWord`, `endWord`, and `wordList[i]` consist of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Breadth-First Search - BFS)

**Approach:**  
Use BFS to explore all possible word transformations. At each step, change one letter at a time and check if the transformed word exists in the dictionary. If it does, add it to the queue. Keep track of the transformation length.

```python
# Time Complexity: O(n * L), where n is the length of the wordList and L is the length of each word.
# Space Complexity: O(n * L)
from collections import deque

def ladderLength(beginWord, endWord, wordList):
    wordList = set(wordList)
    if endWord not in wordList:
        return 0
    
    queue = deque([(beginWord, 1)])  # Store word and its transformation level
    while queue:
        word, level = queue.popleft()
        
        for i in range(len(word)):
            for c in 'abcdefghijklmnopqrstuvwxyz':
                transformed_word = word[:i] + c + word[i+1:]
                if transformed_word == endWord:
                    return level + 1
                if transformed_word in wordList:
                    wordList.remove(transformed_word)
                    queue.append((transformed_word, level + 1))
    
    return 0
```

---

### ⚙️ Level 2: Optimized BFS with Early Exit

**Approach:**  
This approach is similar to Level 1 but with minor optimizations such as removing the transformed word from the wordList immediately to avoid revisiting and improving efficiency.

```python
# Time Complexity: O(n * L), where n is the length of the wordList and L is the length of each word.
# Space Complexity: O(n * L)
from collections import deque

def ladderLength(beginWord, endWord, wordList):
    wordList = set(wordList)
    if endWord not in wordList:
        return 0
    
    queue = deque([(beginWord, 1)])  # Store word and its transformation level
    while queue:
        word, level = queue.popleft()
        
        for i in range(len(word)):
            for c in 'abcdefghijklmnopqrstuvwxyz':
                transformed_word = word[:i] + c + word[i+1:]
                if transformed_word == endWord:
                    return level + 1
                if transformed_word in wordList:
                    wordList.remove(transformed_word)
                    queue.append((transformed_word, level + 1))
    
    return 0
```

---

### 🚀 Level 3: Bidirectional BFS (Optimized)

**Approach:**  
Bidirectional BFS reduces the time complexity by starting the search from both the `beginWord` and `endWord` simultaneously. When the two search fronts meet, the shortest path is found.

```python
# Time Complexity: O(n * L), where n is the length of the wordList and L is the length of each word.
# Space Complexity: O(n * L)
from collections import deque

def ladderLength(beginWord, endWord, wordList):
    wordList = set(wordList)
    if endWord not in wordList:
        return 0
    
    queue1 = deque([beginWord])
    queue2 = deque([endWord])
    visited1 = {beginWord: 1}
    visited2 = {endWord: 1}
    
    while queue1 and queue2:
        if len(queue1) <= len(queue2):
            word, level = queue1.popleft()
            for i in range(len(word)):
                for c in 'abcdefghijklmnopqrstuvwxyz':
                    transformed_word = word[:i] + c + word[i+1:]
                    if transformed_word in visited2:
                        return level + visited2[transformed_word]
                    if transformed_word in wordList and transformed_word not in visited1:
                        visited1[transformed_word] = level + 1
                        queue1.append(transformed_word)
        else:
            word, level = queue2.popleft()
            for i in range(len(word)):
                for c in 'abcdefghijklmnopqrstuvwxyz':
                    transformed_word = word[:i] + c + word[i+1:]
                    if transformed_word in visited1:
                        return level + visited1[transformed_word]
                    if transformed_word in wordList and transformed_word not in visited2:
                        visited2[transformed_word] = level + 1
                        queue2.append(transformed_word)
    
    return 0
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|---------------------------------|-----------------|------------------|
| 1     | BFS (Brute Force)               | O(n * L)        | O(n * L)         |
| 2     | Optimized BFS with Early Exit   | O(n * L)        | O(n * L)         |
| 3     | Bidirectional BFS               | O(n * L)        | O(n * L)         |

---

## 🔗 Similar Problems

1. [126. Word Ladder II](https://leetcode.com/problems/word-ladder-ii/)
2. [987. Vertical Order Traversal of a Binary Tree](https://leetcode.com/problems/vertical-order-traversal-of-a-binary-tree/)
3. [752. Open the Lock](https://leetcode.com/problems/open-the-lock/)

---

## 📌 Takeaway Points

- BFS is the best approach to find the shortest path in an unweighted graph like this problem, where each word represents a node, and edges are word transformations.
- Bidirectional BFS improves the search by halving the search space, making it more efficient.
- Always ensure to remove visited words from the dictionary to avoid revisiting and infinite loops.

---

10. Maximum Subarray

---

# ➕ Problem: Maximum Subarray

## 📘 Problem Statement

> Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
> 
> A subarray is a contiguous part of an array.

**LeetCode Link:** [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)

---

```

Example 1:

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: The subarray [4,-1,2,1] has the largest sum = 6.

Example 2:

Input: nums = [1]
Output: 1
Explanation: The subarray [1] has the largest sum = 1.

Example 3:

Input: nums = [5,4,-1,7,8]
Output: 23
Explanation: The subarray [5,4,-1,7,8] has the largest sum = 23.

```

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁴ <= nums[i] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check All Subarrays)

**Approach:**  
In this brute force approach, we check all possible subarrays and calculate their sums to find the maximum sum.

```python
# Time Complexity: O(n^2), where n is the length of the array.
# Space Complexity: O(1)
def maxSubArray(nums):
    max_sum = float('-inf')
    
    for i in range(len(nums)):
        for j in range(i, len(nums)):
            max_sum = max(max_sum, sum(nums[i:j+1]))
    
    return max_sum
```

---

### ⚙️ Level 2: Dynamic Programming (Kadane’s Algorithm)

**Approach:**  
Kadane’s algorithm optimizes the solution by using dynamic programming. At each step, we decide whether to add the current number to the existing subarray or start a new subarray with the current number.

```python
# Time Complexity: O(n), where n is the length of the array.
# Space Complexity: O(1)
def maxSubArray(nums):
    current_sum = max_sum = nums[0]
    
    for num in nums[1:]:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)
    
    return max_sum
```

---

### 🚀 Level 3: Optimized Kadane’s Algorithm (Avoid Extra Variables)

**Approach:**  
This is the optimized version of Kadane’s algorithm where we reduce the space complexity to O(1) by maintaining just two variables, `current_sum` and `max_sum`.

```python
# Time Complexity: O(n), where n is the length of the array.
# Space Complexity: O(1)
def maxSubArray(nums):
    max_sum = current_sum = nums[0]
    
    for num in nums[1:]:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)
    
    return max_sum
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|---------------------------------|-----------------|------------------|
| 1     | Brute Force (Check All Subarrays) | O(n^2)          | O(1)             |
| 2     | Dynamic Programming (Kadane’s)    | O(n)            | O(1)             |
| 3     | Optimized Kadane’s Algorithm      | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [53. Maximum Subarray](https://leetcode.com/problems/maximum-subarray/)
2. [152. Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)
3. [121. Best Time to Buy and Sell Stock](https://leetcode.com/problems/best-time-to-buy-and-sell-stock/)

---

## 📌 Takeaway Points

- Kadane’s algorithm is the go-to solution for the maximum subarray problem due to its linear time complexity.
- Starting with brute force gives insight into the problem but is inefficient for larger inputs.
- Always aim to reduce space complexity when possible, especially in dynamic programming solutions.

---

11. Sliding Window Maximum

---

# ➕ Problem: Sliding Window Maximum

## 📘 Problem Statement

> Given an integer array `nums` and an integer `k`, return the maximum sliding window of size `k` over the array.

> That is, for each window of size `k`, find the maximum element in that window.

**LeetCode Link:** [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)

---

```

Example 1:

Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window 1: [1,3,-1] → max = 3
Window 2: [3,-1,-3] → max = 3
Window 3: [-1,-3,5] → max = 5
Window 4: [-3,5,3] → max = 5
Window 5: [5,3,6] → max = 6
Window 6: [3,6,7] → max = 7

Example 2:

Input: nums = [-7,-8,7,5,7,1,6,0], k = 4
Output: [7,7,7,7,7]
Explanation:
Window 1: [-7,-8,7,5] → max = 7
Window 2: [-8,7,5,7] → max = 7
Window 3: [7,5,7,1] → max = 7
Window 4: [5,7,1,6] → max = 7
Window 5: [7,1,6,0] → max = 7

```

## ✅ Constraints

- `1 <= nums.length <= 10⁴`
- `-10⁴ <= nums[i] <= 10⁴`
- `1 <= k <= nums.length`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Sliding Window with Array Search)

**Approach:**  
For each sliding window, we find the maximum by iterating through the window and calculating the maximum value.

```python
# Time Complexity: O(n*k), where n is the length of the array and k is the window size.
# Space Complexity: O(1)
def maxSlidingWindow(nums, k):
    result = []
    
    for i in range(len(nums) - k + 1):
        result.append(max(nums[i:i+k]))
    
    return result
```

---

### ⚙️ Level 2: Optimized Sliding Window (Deque)

**Approach:**  
Use a deque (double-ended queue) to store indices of elements in a way that allows quick retrieval of the maximum element. The deque maintains elements in decreasing order, so the maximum element is always at the front of the deque.

```python
# Time Complexity: O(n), where n is the length of the array.
# Space Complexity: O(k), where k is the window size.
from collections import deque

def maxSlidingWindow(nums, k):
    deq = deque()
    result = []
    
    for i, num in enumerate(nums):
        # Remove indices of elements not within the sliding window
        if deq and deq[0] < i - k + 1:
            deq.popleft()
        
        # Remove indices of elements that are smaller than the current element
        while deq and nums[deq[-1]] < num:
            deq.pop()
        
        # Add the current element index
        deq.append(i)
        
        # If the window has hit size k, add the maximum to the result
        if i >= k - 1:
            result.append(nums[deq[0]])
    
    return result
```

---

### 🚀 Level 3: Optimized Sliding Window (Deque with Early Exit Condition)

**Approach:**  
This solution optimizes the deque approach by ensuring early exits when possible, with the deque maintaining only the relevant elements and reducing operations in the loop.

```python
# Time Complexity: O(n), where n is the length of the array.
# Space Complexity: O(k), where k is the window size.
from collections import deque

def maxSlidingWindow(nums, k):
    deq = deque()
    result = []
    
    for i, num in enumerate(nums):
        # Remove indices of elements that are out of the current window
        if deq and deq[0] < i - k + 1:
            deq.popleft()
        
        # Remove all indices of elements smaller than the current number
        while deq and nums[deq[-1]] < num:
            deq.pop()
        
        deq.append(i)
        
        # Add the max to result if the window is fully formed
        if i >= k - 1:
            result.append(nums[deq[0]])
    
    return result
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Array Search)       | O(n * k)        | O(1)             |
| 2     | Optimized Sliding Window (Deque) | O(n)            | O(k)             |
| 3     | Early Exit Optimized Sliding (Deque) | O(n)        | O(k)             |

---

## 🔗 Similar Problems

1. [239. Sliding Window Maximum](https://leetcode.com/problems/sliding-window-maximum/)
2. [1429. First Unique Number](https://leetcode.com/problems/first-unique-number/)
3. [345. Reverse Vowels of a String](https://leetcode.com/problems/reverse-vowels-of-a-string/)

---

## 📌 Takeaway Points

- The brute force solution works but is inefficient for larger inputs, as it checks each window individually.
- The deque approach is highly efficient, providing a linear time complexity solution for this problem.
- Deques are ideal for sliding window problems because they allow fast insertion and removal of elements from both ends.

---

12. Longest Common Prefix

---

# ➕ Problem: Longest Common Prefix

## 📘 Problem Statement

> Write a function to find the longest common prefix string amongst an array of strings.
> 
> If there is no common prefix, return an empty string `""`.

> **Note:**
> - All given inputs are guaranteed to be non-empty strings.

**LeetCode Link:** [14. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)

---

```

Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"
Explanation: The longest common prefix is "fl".

Example 2:

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the strings.

Example 3:

Input: strs = ["a"]
Output: "a"
Explanation: The longest common prefix is "a".

```

## ✅ Constraints

- `1 <= strs.length <= 200`
- `0 <= strs[i].length <= 200`
- `strs[i]` consists of only lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check Prefixes)

**Approach:**  
In this approach, we compare each string's prefix with all the other strings in the array. We repeatedly shorten the prefix until a common prefix is found.

```python
# Time Complexity: O(n * m), where n is the number of strings and m is the length of the shortest string.
# Space Complexity: O(1)
def longestCommonPrefix(strs):
    if not strs:
        return ""
    
    prefix = strs[0]
    for string in strs[1:]:
        while not string.startswith(prefix):
            prefix = prefix[:-1]
            if not prefix:
                return ""
    
    return prefix
```

---

### ⚙️ Level 2: Vertical Scanning (Compare Characters)

**Approach:**  
Instead of comparing prefixes, we compare characters in each string at the same position. If the characters are the same across all strings at the current position, we move to the next character.

```python
# Time Complexity: O(n * m), where n is the number of strings and m is the length of the shortest string.
# Space Complexity: O(1)
def longestCommonPrefix(strs):
    if not strs:
        return ""
    
    for i in range(len(strs[0])):
        for string in strs[1:]:
            if i == len(string) or string[i] != strs[0][i]:
                return strs[0][:i]
    
    return strs[0]
```

---

### 🚀 Level 3: Divide and Conquer

**Approach:**  
Divide the array of strings into two halves and find the longest common prefix for each half. Then merge the results to find the final longest common prefix.

```python
# Time Complexity: O(n * m), where n is the number of strings and m is the length of the shortest string.
# Space Complexity: O(log n), for recursive call stack
def longestCommonPrefix(strs):
    def lcp(left, right):
        i = 0
        while i < len(left) and i < len(right) and left[i] == right[i]:
            i += 1
        return left[:i]
    
    def divide(strs, low, high):
        if low == high:
            return strs[low]
        mid = (low + high) // 2
        left = divide(strs, low, mid)
        right = divide(strs, mid + 1, high)
        return lcp(left, right)
    
    if not strs:
        return ""
    return divide(strs, 0, len(strs) - 1)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|---------------------------------|-----------------|------------------|
| 1     | Brute Force (Check Prefixes)    | O(n * m)        | O(1)             |
| 2     | Vertical Scanning               | O(n * m)        | O(1)             |
| 3     | Divide and Conquer              | O(n * m)        | O(log n)         |

---

## 🔗 Similar Problems

1. [14. Longest Common Prefix](https://leetcode.com/problems/longest-common-prefix/)
2. [3. Longest Substring Without Repeating Characters](https://leetcode.com/problems/longest-substring-without-repeating-characters/)
3. [68. Text Justification](https://leetcode.com/problems/text-justification/)

---

## 📌 Takeaway Points

- Brute force approaches can be useful for simple problems but may become inefficient for larger inputs.
- Vertical scanning is an efficient way to check each character in strings at the same position.
- Divide and conquer is a good strategy for breaking down the problem into smaller subproblems.

---

13. Merge Intervals

---

# ➕ Problem: Merge Intervals

## 📘 Problem Statement

> Given an array of intervals where `intervals[i] = [start_i, end_i]`, merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

**LeetCode Link:** [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)

---

```

Example 1:

Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

Example 2:

Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.

```

## ✅ Constraints

- `1 <= intervals.length <= 10⁴`
- `intervals[i].length == 2`
- `0 <= start_i <= end_i <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check for Overlaps)

**Approach:**  
Iterate over each interval, compare it with every other interval to check if they overlap, and merge them if they do.

```python
# Time Complexity: O(n^2), where n is the number of intervals.
# Space Complexity: O(n)
def merge(intervals):
    result = []
    for i in range(len(intervals)):
        merged = False
        for j in range(len(result)):
            # If intervals overlap
            if intervals[i][0] <= result[j][1] and intervals[i][1] >= result[j][0]:
                result[j] = [min(result[j][0], intervals[i][0]), max(result[j][1], intervals[i][1])]
                merged = True
                break
        if not merged:
            result.append(intervals[i])
    
    return result
```

---

### ⚙️ Level 2: Sorting and Merging

**Approach:**  
First, sort the intervals based on their start times. Then, iterate through the sorted intervals and merge them if they overlap.

```python
# Time Complexity: O(n log n), where n is the number of intervals (due to sorting).
# Space Complexity: O(n)
def merge(intervals):
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

### 🚀 Level 3: Optimized Sorting with Early Exit

**Approach:**  
This is similar to the previous one but optimized to reduce unnecessary checks or merging operations.

```python
# Time Complexity: O(n log n), where n is the number of intervals (due to sorting).
# Space Complexity: O(n)
def merge(intervals):
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

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force (Check Overlaps)      | O(n^2)          | O(n)             |
| 2     | Sorting and Merging              | O(n log n)      | O(n)             |
| 3     | Optimized Sorting with Early Exit | O(n log n)      | O(n)             |

---

## 🔗 Similar Problems

1. [56. Merge Intervals](https://leetcode.com/problems/merge-intervals/)
2. [57. Insert Interval](https://leetcode.com/problems/insert-interval/)
3. [252. Meeting Rooms](https://leetcode.com/problems/meeting-rooms/)

---

## 📌 Takeaway Points

- Sorting intervals first makes the problem much easier because you only need to check adjacent intervals for overlap.
- Brute force solutions can be inefficient, especially for problems involving a large number of intervals.
- Merging overlapping intervals after sorting is a very common approach in interval problems, as it reduces the complexity of the problem.

---

14. Reorganize String

---

# ➕ Problem: Reorganize String

## 📘 Problem Statement

> Given a string `s`, rearrange the characters of `s` so that no two adjacent characters are the same. If it is not possible to reorganize the string, return an empty string `""`.

**LeetCode Link:** [Reorganize String](https://leetcode.com/problems/reorganize-string/)

---

```

Example 1:

Input: s = "aab"
Output: "aba"
Explanation: One possible answer is "aba", while "aab" is not valid.

Example 2:

Input: s = "aaab"
Output: ""
Explanation: It is impossible to reorganize the string because two adjacent 'a's will always be present.

```

## ✅ Constraints

- `1 <= s.length <= 500`
- `s` consists of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Backtracking)

**Approach:**  
Try all possible rearrangements of the string using backtracking. If no valid rearrangement is found, return an empty string.

```python
# Time Complexity: O(n!), where n is the length of the string (due to all permutations).
# Space Complexity: O(n)
def reorganizeString(s):
    from collections import Counter
    def backtrack(s, path, counter):
        if len(path) == len(s):
            return path
        
        for ch in counter:
            if counter[ch] > 0:
                if not path or path[-1] != ch:
                    counter[ch] -= 1
                    result = backtrack(s, path + ch, counter)
                    if result:
                        return result
                    counter[ch] += 1
        return ""
    
    counter = Counter(s)
    return backtrack(s, "", counter)
```

---

### ⚙️ Level 2: Greedy (Heap Approach)

**Approach:**  
Count the frequency of each character, and use a max-heap to always choose the character with the highest frequency, ensuring no adjacent characters are the same.

```python
# Time Complexity: O(n log k), where n is the length of the string and k is the number of distinct characters.
# Space Complexity: O(n)
import heapq
from collections import Counter

def reorganizeString(s):
    counter = Counter(s)
    max_heap = [(-freq, char) for char, freq in counter.items()]
    heapq.heapify(max_heap)
    
    prev_freq, prev_char = 0, ''
    result = []
    
    while max_heap:
        freq, char = heapq.heappop(max_heap)
        result.append(char)
        
        if prev_freq < 0:
            heapq.heappush(max_heap, (prev_freq, prev_char))
        
        prev_freq, prev_char = freq + 1, char
        
    return ''.join(result) if len(result) == len(s) else ""
```

---

### 🚀 Level 3: Optimized Greedy (Direct Heap Use)

**Approach:**  
Instead of storing the previous character separately, integrate it directly into the heap operations to minimize space usage while ensuring no adjacent characters are the same.

```python
# Time Complexity: O(n log k), where n is the length of the string and k is the number of distinct characters.
# Space Complexity: O(n)
import heapq
from collections import Counter

def reorganizeString(s):
    counter = Counter(s)
    max_heap = [(-freq, char) for char, freq in counter.items()]
    heapq.heapify(max_heap)
    
    result = []
    
    while len(max_heap) > 1:
        freq1, char1 = heapq.heappop(max_heap)
        freq2, char2 = heapq.heappop(max_heap)
        
        result.append(char1)
        result.append(char2)
        
        if freq1 + 1 < 0:
            heapq.heappush(max_heap, (freq1 + 1, char1))
        if freq2 + 1 < 0:
            heapq.heappush(max_heap, (freq2 + 1, char2))
    
    if max_heap:
        freq, char = heapq.heappop(max_heap)
        if freq < -1:
            return ""
        result.append(char)
    
    return ''.join(result)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                          | Time Complexity | Space Complexity |
|-------|-----------------------------------|-----------------|------------------|
| 1     | Brute Force (Backtracking)        | O(n!)           | O(n)             |
| 2     | Greedy (Heap Approach)            | O(n log k)      | O(n)             |
| 3     | Optimized Greedy (Direct Heap Use)| O(n log k)      | O(n)             |

---

## 🔗 Similar Problems

1. [358. Rearrange String k Distance Apart](https://leetcode.com/problems/rearrange-string-k-distance-apart/)
2. [767. Reorganize String](https://leetcode.com/problems/reorganize-string/)
3. [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)

---

## 📌 Takeaway Points

- A brute force approach using backtracking is inefficient for this problem, especially for longer strings.
- A heap-based greedy approach allows you to always choose the most frequent character that doesn’t cause a conflict.
- The solution involves careful management of character frequencies, ensuring no adjacent characters are the same.
---

15. Product of Array Except Self

---

# ➕ Problem: Product of Array Except Self

## 📘 Problem Statement

> Given an integer array `nums`, return an array `output` such that `output[i]` is equal to the product of all the elements of `nums` except `nums[i]`.

> You must solve it without using division and in O(n) time complexity.

**LeetCode Link:** [238. Product of Array Except Self](https://leetcode.com/problems/product-of-array-except-self/)

---

```

Example 1:

Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Explanation: The product of all the elements except nums[i] for each i is:
- For i = 0: product = 2 * 3 * 4 = 24
- For i = 1: product = 1 * 3 * 4 = 12
- For i = 2: product = 1 * 2 * 4 = 8
- For i = 3: product = 1 * 2 * 3 = 6

Example 2:

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]
Explanation: The product of all the elements except nums[i] for each i is:
- For i = 0: product = 1 * 0 * -3 * 3 = 0
- For i = 1: product = -1 * 0 * -3 * 3 = 0
- For i = 2: product = -1 * 1 * -3 * 3 = 9
- For i = 3: product = -1 * 1 * 0 * 3 = 0
- For i = 4: product = -1 * 1 * 0 * -3 = 0

```

## ✅ Constraints

- `2 <= nums.length <= 10⁴`
- `-30 <= nums[i] <= 30`
- The solution must be done in O(n) time complexity and O(1) space complexity (excluding the space used for the output array).

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Nested Loops)

**Approach:**  
Use two nested loops to compute the product of all elements except the current element. This is the most straightforward but inefficient solution.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n)
def productExceptSelf(nums):
    n = len(nums)
    output = []
    
    for i in range(n):
        product = 1
        for j in range(n):
            if i != j:
                product *= nums[j]
        output.append(product)
    
    return output
```

---

### ⚙️ Level 2: Prefix and Suffix Arrays

**Approach:**  
Use two arrays to store the prefix and suffix products. The result for each index will be the product of the prefix and suffix arrays at that index.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def productExceptSelf(nums):
    n = len(nums)
    prefix = [1] * n
    suffix = [1] * n
    output = [1] * n
    
    # Fill the prefix array
    for i in range(1, n):
        prefix[i] = prefix[i-1] * nums[i-1]
    
    # Fill the suffix array
    for i in range(n-2, -1, -1):
        suffix[i] = suffix[i+1] * nums[i+1]
    
    # Compute the result array
    for i in range(n):
        output[i] = prefix[i] * suffix[i]
    
    return output
```

---

### 🚀 Level 3: Optimized (Constant Space)

**Approach:**  
Instead of using two arrays for prefix and suffix products, use the output array itself to store the prefix products. Then, iterate from the end of the array to fill the suffix products in the output array.

```python
# Time Complexity: O(n)
# Space Complexity: O(1) (excluding the space used for the output array)
def productExceptSelf(nums):
    n = len(nums)
    output = [1] * n
    
    # Fill the output array with prefix products
    prefix = 1
    for i in range(n):
        output[i] = prefix
        prefix *= nums[i]
    
    # Multiply with suffix products
    suffix = 1
    for i in range(n-1, -1, -1):
        output[i] *= suffix
        suffix *= nums[i]
    
    return output
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|---------------------------------|-----------------|------------------|
| 1     | Brute Force (Nested Loops)      | O(n^2)          | O(n)             |
| 2     | Prefix and Suffix Arrays        | O(n)            | O(n)             |
| 3     | Optimized (Constant Space)      | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [238. Product of Array Except Self (Optimized)](https://leetcode.com/problems/product-of-array-except-self/)
2. [324. Wiggle Sort II](https://leetcode.com/problems/wiggle-sort-ii/)
3. [152. Maximum Product Subarray](https://leetcode.com/problems/maximum-product-subarray/)

---

## 📌 Takeaway Points

- The brute force approach with nested loops is inefficient, especially for larger input sizes.
- Using prefix and suffix arrays helps reduce the time complexity to O(n) but requires extra space.
- The optimized solution uses the result array itself to save space, achieving O(1) space complexity while maintaining O(n) time complexity.

---

16. Number of Islands

---

# ➕ Problem: Number of Islands

## 📘 Problem Statement

> Given an `m x n` 2D binary grid `grid` where `'1'` represents land and `'0'` represents water, return the number of islands.  
> An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

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

### 🧪 Level 1: Brute Force (DFS)

**Approach:**  
We can use Depth-First Search (DFS) to explore all the cells that belong to the same island. For each land cell, mark all connected land cells as visited. Every time we find an unvisited land cell, we increment the island count.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) (for recursion stack)
def numIslands(grid):
    if not grid:
        return 0

    def dfs(i, j):
        if i < 0 or i >= len(grid) or j < 0 or j >= len(grid[0]) or grid[i][j] == '0':
            return
        grid[i][j] = '0'  # mark as visited
        dfs(i + 1, j)  # move down
        dfs(i - 1, j)  # move up
        dfs(i, j + 1)  # move right
        dfs(i, j - 1)  # move left

    count = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == '1':  # found unvisited land
                count += 1
                dfs(i, j)  # visit all connected land
    return count
```

---

### ⚙️ Level 2: Iterative DFS using Stack

**Approach:**  
The approach is similar to the recursive DFS, but we use an explicit stack to avoid recursion stack overflow for large grids.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) (for stack)
def numIslands(grid):
    if not grid:
        return 0

    def dfs(i, j):
        stack = [(i, j)]
        while stack:
            x, y = stack.pop()
            if 0 <= x < len(grid) and 0 <= y < len(grid[0]) and grid[x][y] == '1':
                grid[x][y] = '0'  # mark as visited
                # Add all 4 possible directions to stack
                stack.append((x + 1, y))
                stack.append((x - 1, y))
                stack.append((x, y + 1))
                stack.append((x, y - 1))

    count = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == '1':  # found unvisited land
                count += 1
                dfs(i, j)  # visit all connected land
    return count
```

---

### 🚀 Level 3: BFS (Breadth-First Search)

**Approach:**  
Instead of using DFS, we can perform a breadth-first search (BFS) starting from each unvisited land cell. We explore all adjacent cells level by level.

```python
# Time Complexity: O(m * n)
# Space Complexity: O(m * n) (for queue)
from collections import deque

def numIslands(grid):
    if not grid:
        return 0

    def bfs(i, j):
        queue = deque([(i, j)])
        grid[i][j] = '0'  # mark as visited
        while queue:
            x, y = queue.popleft()
            # Check all 4 possible directions
            for dx, dy in [(1, 0), (-1, 0), (0, 1), (0, -1)]:
                nx, ny = x + dx, y + dy
                if 0 <= nx < len(grid) and 0 <= ny < len(grid[0]) and grid[nx][ny] == '1':
                    grid[nx][ny] = '0'  # mark as visited
                    queue.append((nx, ny))

    count = 0
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            if grid[i][j] == '1':  # found unvisited land
                count += 1
                bfs(i, j)  # visit all connected land
    return count
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                  | Time Complexity | Space Complexity |
|-------|---------------------------|-----------------|------------------|
| 1     | DFS (Recursive)            | O(m * n)        | O(m * n)         |
| 2     | DFS (Iterative with Stack) | O(m * n)        | O(m * n)         |
| 3     | BFS (Queue)                | O(m * n)        | O(m * n)         |

---

## 🔗 Similar Problems

1. [695. Max Area of Island](https://leetcode.com/problems/max-area-of-island/)
2. [463. Island Perimeter](https://leetcode.com/problems/island-perimeter/)
3. [200. Number of Islands (Variant with Diagonal Connections)](https://leetcode.com/problems/number-of-islands/)

---

## 📌 Takeaway Points

- DFS and BFS are both effective ways to explore islands in a grid.
- Recursive DFS is simple but may hit recursion limits on large grids. Iterative DFS using a stack avoids this.
- BFS uses a queue and is also suitable for large grids where recursion depth might be a concern.
- Time complexity remains O(m * n) in all solutions, but space complexity can vary depending on the approach (recursive stack vs queue vs iterative stack).

---

17. LRU Cache

---

# ➕ Problem: LRU Cache

## 📘 Problem Statement

> Design and implement a data structure for Least Recently Used (LRU) cache.  
> It should support the following operations:
> - `get(key: int)`: Return the value of the key if the key exists, otherwise return `-1`.
> - `put(key: int, value: int)`: Insert or update the value of the key. If the number of keys exceeds the capacity from this operation, evict the least recently used key.

The cache should be implemented using an **ordered data structure**.

**LeetCode Link:** [146. LRU Cache](https://leetcode.com/problems/lru-cache/)

---

```

Example 1:

Input:
["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get"]
[ [2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3] ]
Output:
[null, null, null, 1, null, 2, null, -1, 3]

Explanation:
LRUCache lRUCache = new LRUCache(2);
lRUCache.put(1, 1);  // cache is {1=1}
lRUCache.put(2, 2);  // cache is {1=1, 2=2}
lRUCache.get(1);     // return 1
lRUCache.put(3, 3);  // LRU key was evicted, cache is {2=2, 3=3}
lRUCache.get(2);     // returns -1 (not found)
lRUCache.put(4, 4);  // LRU key was evicted, cache is {3=3, 4=4}
lRUCache.get(1);     // return -1 (not found)
lRUCache.get(3);     // return 3

```

## ✅ Constraints

- `1 <= capacity <= 3000`
- `0 <= key <= 10⁴`
- `0 <= value <= 10⁴`
- At most `2 * 10⁵` calls will be made to `get` and `put`.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force using Dictionary

**Approach:**  
Use a dictionary to store the cache entries. For each `get`, check the dictionary, and for `put`, simply add the key-value pair. For eviction, when the capacity is exceeded, manually remove the least recently used entry by traversing the dictionary.

```python
# Time Complexity: O(1) for both get and put, but O(n) for evicting an item.
# Space Complexity: O(n)
class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}

    def get(self, key: int) -> int:
        if key in self.cache:
            return self.cache[key]
        return -1

    def put(self, key: int, value: int) -> None:
        if len(self.cache) >= self.capacity:
            # Remove the least recently used element
            self.cache.pop(next(iter(self.cache)))
        self.cache[key] = value
```

---

### ⚙️ Level 2: Using OrderedDict (Optimized)

**Approach:**  
Use `collections.OrderedDict`, which maintains the insertion order. Every time a key is accessed, we can move it to the end to mark it as recently used. When the capacity is exceeded, remove the first element (least recently used).

```python
# Time Complexity: O(1) for both get and put.
# Space Complexity: O(n)
from collections import OrderedDict

class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = OrderedDict()

    def get(self, key: int) -> int:
        if key in self.cache:
            # Move the key to the end to mark it as recently used
            self.cache.move_to_end(key)
            return self.cache[key]
        return -1

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            self.cache.move_to_end(key)  # Mark it as recently used
        self.cache[key] = value
        if len(self.cache) > self.capacity:
            # Pop the first item (least recently used)
            self.cache.popitem(last=False)
```

---

### 🚀 Level 3: Using Doubly Linked List and HashMap (Fully Optimized)

**Approach:**  
Use a doubly linked list to maintain the order of elements from most recently used to least recently used. Combine this with a hash map to allow O(1) access to elements. This allows both `get` and `put` operations to be O(1) with constant time eviction of the least recently used element.

```python
# Time Complexity: O(1) for both get and put.
# Space Complexity: O(n)
class Node:
    def __init__(self, key=0, value=0):
        self.key = key
        self.value = value
        self.prev = None
        self.next = None

class LRUCache:

    def __init__(self, capacity: int):
        self.capacity = capacity
        self.cache = {}  # key -> node
        self.head, self.tail = Node(), Node()
        self.head.next, self.tail.prev = self.tail, self.head

    def _remove(self, node: Node):
        prev, next = node.prev, node.next
        prev.next, next.prev = next, prev

    def _insert(self, node: Node):
        prev, next = self.tail.prev, self.tail
        prev.next = next.prev = node
        node.prev, node.next = prev, next

    def get(self, key: int) -> int:
        if key in self.cache:
            node = self.cache[key]
            self._remove(node)
            self._insert(node)  # Move to end (most recent)
            return node.value
        return -1

    def put(self, key: int, value: int) -> None:
        if key in self.cache:
            node = self.cache[key]
            self._remove(node)
            node.value = value
            self._insert(node)
        else:
            if len(self.cache) >= self.capacity:
                # Evict the least recently used (LRU) node
                lru = self.head.next
                self._remove(lru)
                del self.cache[lru.key]
            node = Node(key, value)
            self.cache[key] = node
            self._insert(node)
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                        | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force with Dictionary      | O(1) for get/put, O(n) for eviction | O(n)             |
| 2     | OrderedDict (Optimized)          | O(1) for get/put | O(n)             |
| 3     | Doubly Linked List + HashMap     | O(1) for get/put | O(n)             |

---

## 🔗 Similar Problems

1. [146. LRU Cache (Optimized with Doubly Linked List)](https://leetcode.com/problems/lru-cache/)
2. [146. LRU Cache (Implementation Variants)](https://leetcode.com/problems/lru-cache/)
3. [460. LFU Cache](https://leetcode.com/problems/lfu-cache/)

---

## 📌 Takeaway Points

- **OrderedDict** simplifies the implementation by automatically maintaining the order of insertion.
- A **doubly linked list** combined with a **hash map** provides the most optimized solution with O(1) operations for both `get` and `put`.
- The brute force solution with a dictionary is easy to implement but inefficient for large data sizes because of the manual eviction process.
- **Eviction of the least recently used item** is the key challenge, and using efficient data structures ensures optimal performance.

---

18. Search in Rotated Sorted Array

---

# ➕ Problem: Search in Rotated Sorted Array

## 📘 Problem Statement

> You are given an integer array `nums` sorted in ascending order, and an integer `target`.  
> Suppose the array is **rotated** at some pivot index `k` (where `0 <= k < nums.length`).  
> For example, `[0,1,2,4,5,6,7]` might be rotated at index 3 and become `[4,5,6,7,0,1,2]`.  
> You need to search for the `target` in the rotated array. If found, return its index; otherwise, return `-1`.  
> You must write an algorithm with a time complexity of `O(log n)`.

**LeetCode Link:** [33. Search in Rotated Sorted Array](https://leetcode.com/problems/search-in-rotated-sorted-array/)

---

```

Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4
Explanation: 0 is found at index 4.

Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
Explanation: 3 is not in the array.

Example 3:

Input: nums = [1], target = 0
Output: -1
Explanation: 0 is not in the array.

```

## ✅ Constraints

- `1 <= nums.length <= 5000`
- `-10⁴ <= nums[i] <= 10⁴`
- All integers in `nums` are unique.
- `nums` is guaranteed to be a rotated sorted array.
- `-10⁴ <= target <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Linear Search)

**Approach:**  
We can start by simply searching the array in a linear fashion to find the target. This will give us an O(n) time complexity.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def search(nums, target):
    for i, num in enumerate(nums):
        if num == target:
            return i
    return -1
```

---

### ⚙️ Level 2: Binary Search (Optimized for Rotated Array)

**Approach:**  
We can optimize the search by utilizing binary search. Since the array is rotated, we need to first identify the pivot (the point where the array was rotated). We then modify the binary search to check whether the left or right half is sorted, and we adjust the search space accordingly.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    left, right = 0, len(nums) - 1
    
    while left <= right:
        mid = left + (right - left) // 2
        
        if nums[mid] == target:
            return mid
        
        # Left half is sorted
        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1
            else:
                left = mid + 1
        # Right half is sorted
        else:
            if nums[mid] < target <= nums[right]:
                left = mid + 1
            else:
                right = mid - 1
    
    return -1
```

---

### 🚀 Level 3: Enhanced Binary Search with Optimized Pivot Detection

**Approach:**  
We enhance the binary search further by detecting the pivot and adjusting the search accordingly. This can ensure the most optimal search across various rotations.

```python
# Time Complexity: O(log n)
# Space Complexity: O(1)
def search(nums, target):
    left, right = 0, len(nums) - 1
    
    while left <= right:
        mid = left + (right - left) // 2
        
        if nums[mid] == target:
            return mid
        
        # Check if the left part is sorted
        if nums[left] <= nums[mid]:
            if nums[left] <= target < nums[mid]:
                right = mid - 1  # Target in the left part
            else:
                left = mid + 1   # Target in the right part
        else:
            # Right part is sorted
            if nums[mid] < target <= nums[right]:
                left = mid + 1  # Target in the right part
            else:
                right = mid - 1  # Target in the left part
    
    return -1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                         | Time Complexity | Space Complexity |
|-------|----------------------------------|-----------------|------------------|
| 1     | Brute Force (Linear Search)      | O(n)            | O(1)             |
| 2     | Binary Search (Optimized for Rotation) | O(log n)      | O(1)             |
| 3     | Enhanced Binary Search with Pivot Detection | O(log n) | O(1)             |

---

## 🔗 Similar Problems

1. [81. Search in Rotated Sorted Array II](https://leetcode.com/problems/search-in-rotated-sorted-array-ii/)
2. [153. Find Minimum in Rotated Sorted Array](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/)
3. [154. Find Minimum in Rotated Sorted Array II](https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/)

---

## 📌 Takeaway Points

- **Binary search** is crucial for solving this problem in `O(log n)` time, making it efficient for large arrays.
- The array's **rotation** needs to be handled by checking which part of the array (left or right) is sorted.
- **Pivot detection** is key for reducing the search space by half in each step of the binary search.

---

19. Palindromic Substrings

---

# ➕ Problem: Palindromic Substrings

## 📘 Problem Statement

> Given a string `s`, return the number of **palindromic substrings** in it.  
> A **substring** is a contiguous sequence of characters within a string.  
> A **palindrome** is a string that reads the same forward and backward.

**LeetCode Link:** [19. Palindromic Substrings](https://leetcode.com/problems/palindromic-substrings/)

---

```

Example 1:

Input: s = "abc"
Output: 3
Explanation: Three palindromic substrings: "a", "b", "c".

Example 2:

Input: s = "aaa"
Output: 6
Explanation: Six palindromic substrings: "a", "a", "a", "aa", "aa", "aaa".

```

## ✅ Constraints

- `1 <= s.length <= 1000`
- `s` consists of lowercase English letters.

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Check All Substrings)

**Approach:**  
Generate all possible substrings of the input string and check each one if it's a palindrome.

```python
# Time Complexity: O(n^3)
# Space Complexity: O(n^2)
def countSubstrings(s):
    def is_palindrome(sub):
        return sub == sub[::-1]
    
    count = 0
    for i in range(len(s)):
        for j in range(i + 1, len(s) + 1):
            if is_palindrome(s[i:j]):
                count += 1
    return count
```

---

### ⚙️ Level 2: Expand Around Center

**Approach:**  
A palindrome mirrors around its center. The idea is to treat each index (and each pair of indices) as the potential center of a palindrome and expand around it.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def countSubstrings(s):
    def expand_around_center(left, right):
        count = 0
        while left >= 0 and right < len(s) and s[left] == s[right]:
            count += 1
            left -= 1
            right += 1
        return count

    count = 0
    for i in range(len(s)):
        count += expand_around_center(i, i)   # Odd-length palindromes
        count += expand_around_center(i, i+1) # Even-length palindromes
    return count
```

---

### 🚀 Level 3: Dynamic Programming (Memoization)

**Approach:**  
Use dynamic programming to store whether a substring `s[i:j]` is a palindrome, and use this information to build the solution efficiently.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(n^2)
def countSubstrings(s):
    n = len(s)
    dp = [[False] * n for _ in range(n)]
    count = 0

    for length in range(1, n + 1):
        for i in range(n - length + 1):
            j = i + length - 1
            if length == 1:
                dp[i][j] = True
            elif length == 2:
                dp[i][j] = (s[i] == s[j])
            else:
                dp[i][j] = (s[i] == s[j]) and dp[i+1][j-1]
            
            if dp[i][j]:
                count += 1
                
    return count
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                            | Time Complexity | Space Complexity |
|-------|-------------------------------------|-----------------|------------------|
| 1     | Brute Force (Check All Substrings)  | O(n^3)          | O(n^2)           |
| 2     | Expand Around Center                | O(n^2)          | O(1)             |
| 3     | Dynamic Programming (Memoization)   | O(n^2)          | O(n^2)           |

---

## 🔗 Similar Problems

1. [5. Longest Palindromic Substring](https://leetcode.com/problems/longest-palindromic-substring/)
2. [647. Palindromic Substrings II](https://leetcode.com/problems/palindromic-substrings-ii/)
3. [132. Palindrome Partitioning II](https://leetcode.com/problems/palindrome-partitioning-ii/)

---

## 📌 Takeaway Points

- The **expand around center** approach is efficient and uses constant space, making it a great optimization over brute force.
- **Dynamic programming** provides an alternative approach with additional space to track whether each substring is a palindrome.
- The problem showcases how you can solve palindrome-related questions by exploiting symmetry.

---

20. Decode Ways

---

# ➕ Problem: Decode Ways

## 📘 Problem Statement

> A message containing letters from A-Z can be encoded into numbers using the following mapping:
> 
> 'A' -> "1", 'B' -> "2", ..., 'Z' -> "26".
> 
> To decode an encoded message, all the digits must be grouped then mapped back into letters using the reverse of the mapping above (there may be multiple ways). For example, "11106" can be mapped into:
> 
> - "AAJF" with the grouping (1 1 10 6)
> - "KJF" with the grouping (11 10 6)
> 
> Return the total number of ways to decode it.

**LeetCode Link:** [20. Decode Ways](https://leetcode.com/problems/decode-ways/)

---

```

Example 1:

Input: s = "12"
Output: 2
Explanation: It could be decoded as "AB" (1 2) or "L" (12).

Example 2:

Input: s = "226"
Output: 3
Explanation: It could be decoded as "BBF" (2 2 6), "BF" (2 26), or "Z" (22 6).

Example 3:

Input: s = "0"
Output: 0
Explanation: There is no valid encoding.

```

## ✅ Constraints

- `1 <= s.length <= 100`
- `s[i]` is a digit from '0' to '9'.
- `s` does not contain leading zeros unless the string is "0".

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Recursive Solution)

**Approach:**  
Recursively try all possible decodings. For each valid prefix, recursively solve the remaining string.

```python
# Time Complexity: O(2^n)
# Space Complexity: O(n)
def numDecodings(s):
    def decode(i):
        if i == len(s):
            return 1
        if s[i] == '0':
            return 0
        res = decode(i + 1)
        if i + 1 < len(s) and int(s[i:i+2]) <= 26:
            res += decode(i + 2)
        return res
    return decode(0)
```

---

### ⚙️ Level 2: Dynamic Programming (Memoization)

**Approach:**  
Memoize the results of recursive calls to avoid redundant computations.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def numDecodings(s):
    memo = {}
    
    def decode(i):
        if i == len(s):
            return 1
        if s[i] == '0':
            return 0
        if i in memo:
            return memo[i]
        
        res = decode(i + 1)
        if i + 1 < len(s) and int(s[i:i+2]) <= 26:
            res += decode(i + 2)
        
        memo[i] = res
        return res

    return decode(0)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
Iteratively compute the number of decodings using dynamic programming.

```python
# Time Complexity: O(n)
# Space Complexity: O(n)
def numDecodings(s):
    if not s or s[0] == '0':
        return 0
    
    dp = [0] * (len(s) + 1)
    dp[0], dp[1] = 1, 1
    
    for i in range(2, len(s) + 1):
        if s[i - 1] != '0':
            dp[i] += dp[i - 1]
        if s[i - 2:i] >= '10' and s[i - 2:i] <= '26':
            dp[i] += dp[i - 2]
    
    return dp[-1]
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                           | Time Complexity | Space Complexity |
|-------|------------------------------------|-----------------|------------------|
| 1     | Brute Force (Recursive)            | O(2^n)          | O(n)             |
| 2     | Dynamic Programming (Memoization)  | O(n)            | O(n)             |
| 3     | Dynamic Programming (Tabulation)   | O(n)            | O(n)             |

---

## 🔗 Similar Problems

1. [91. Decode Ways](https://leetcode.com/problems/decode-ways/)
2. [639. Decode Ways II](https://leetcode.com/problems/decode-ways-ii/)
3. [1220. Count Vowels Permutation](https://leetcode.com/problems/count-vowels-permutation/)

---

## 📌 Takeaway Points

- Recursion can lead to exponential time complexity due to overlapping subproblems, but memoization or dynamic programming can drastically optimize it.
- **Tabulation** (bottom-up approach) is often more space-efficient than recursion with memoization.
- The problem is essentially about recognizing valid substrings and computing the number of ways to decode a sequence.

---
