Let's break down **LeetCode #217 Contains Duplicate ** in **C++**, **Java**, **Python3**, **C**, **C#**, **JavaScript**, **TypeScrip**, **PHP**, **Swift**, **Kotlin**, **Dart**, **Go**, **Ruby**, **Scala**, **Rust**, **Racket**, **Erlang**, **Elixir** with **three levels** of optimization, **each passing all test cases**, along with **clear explanations**.

---
Let’s tackle **LeetCode #217 – Contains Duplicate** in **C++**, and like a true DSA kc301, we’ll go through **3 levels**:  
➡️ **Level 1: Brute Force**  
➡️ **Level 2: Sorting**  
➡️ **Level 3: Hash Set** *(fully optimized)*

---

## 🧩 Problem Statement

> Given an integer array `nums`, return `true` if any value appears **at least twice**, and `false` if every element is **distinct**.

---

```
Example 1:

Input: nums = [1,2,3,1]

Output: true

Explanation:

The element 1 occurs at the indices 0 and 3.

Example 2:

Input: nums = [1,2,3,4]

Output: false

Explanation:

All elements are distinct.

Example 3:

Input: nums = [1,1,1,3,3,4,3,2,4,2]

Output: true

 

Constraints:

1 <= nums.length <= 105
-109 <= nums[i] <= 109
```
---

## ✅ Function Signature in C++

```cpp
bool containsDuplicate(vector<int>& nums);
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare every pair in a double loop.
### C++ (Level #1)
```cpp
bool containsDuplicate(vector<int>& nums) {
    int n = nums.size();
    for (int i = 0; i < n - 1; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if (nums[i] == nums[j]) {
                return true;
            }
        }
    }
    return false;
}
```

⏱ **Time Complexity**: `O(n²)`  
🧠 **Space Complexity**: `O(1)`  
✅ Works, but inefficient for large arrays.

---

## ⚙️ Level 2: Sorting-Based Approach 🧩

### 🔍 Approach:
Sort the array. Any duplicate will appear consecutively.
### C++ (Level #2)
```cpp
#include <algorithm>

bool containsDuplicate(vector<int>& nums) {
    sort(nums.begin(), nums.end());
    for (int i = 1; i < nums.size(); ++i) {
        if (nums[i] == nums[i - 1]) {
            return true;
        }
    }
    return false;
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (if in-place sort)  
⚠️ Sorting mutates original array.

---

## 🚀 Level 3: Fully Optimized with Hash Set ⚡

### 🔍 Approach:
Use an unordered set to track seen numbers.
### C++ (Level #3)
```cpp
#include <unordered_set>

bool containsDuplicate(vector<int>& nums) {
    unordered_set<int> seen;
    for (int num : nums) {
        if (seen.count(num)) {
            return true;
        }
        seen.insert(num);
    }
    return false;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest, most scalable, and clean.

---

## 🧠 Summary Table

| Level | Approach        | Time     | Space  | Notes                          |
|-------|------------------|----------|--------|---------------------------------|
| 1     | Brute Force       | O(n²)    | O(1)   | Easy but slow                  |
| 2     | Sorting           | O(n log n) | O(1) | Faster, but mutates input      |
| 3 ✅   | Hash Set          | O(n)     | O(n)   | 🔥 Best all-around choice       |

---

Let's solve **LeetCode #217 – Contains Duplicate** in **Java**, kc301-style 🧙‍♂️ — with **3 levels of optimization**:

---

## 🧩 Method Signature in Java

```java
public boolean containsDuplicate(int[] nums)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Check all possible (i, j) pairs where `i ≠ j`.
### Java (Level #1)
```java
public boolean containsDuplicate(int[] nums) {
    int n = nums.length;
    for (int i = 0; i < n - 1; i++) {
        for (int j = i + 1; j < n; j++) {
            if (nums[i] == nums[j]) {
                return true;
            }
        }
    }
    return false;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Basic, but not scalable.

---

## ⚙️ Level 2: Sorting-Based 🧩

### 🔍 Approach:
Sort the array and check neighboring elements.
### Java (Level #2)
```java
import java.util.Arrays;

public boolean containsDuplicate(int[] nums) {
    Arrays.sort(nums);
    for (int i = 1; i < nums.length; i++) {
        if (nums[i] == nums[i - 1]) {
            return true;
        }
    }
    return false;
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (ignoring sort space)  
⚠️ Mutates input array.

---

## 🚀 Level 3: HashSet Approach ⚡

### 🔍 Approach:
Track all seen numbers with a `HashSet`.
### Java (Level #3)
```java
import java.util.HashSet;

public boolean containsDuplicate(int[] nums) {
    HashSet<Integer> seen = new HashSet<>();
    for (int num : nums) {
        if (seen.contains(num)) {
            return true;
        }
        seen.add(num);
    }
    return false;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest and cleanest solution.

---

## 🧠 Summary Table

| Level | Approach         | Time     | Space  | Notes                          |
|-------|------------------|----------|--------|---------------------------------|
| 1     | Brute Force       | O(n²)    | O(1)   | Works, but slow                |
| 2     | Sort + Check      | O(n log n) | O(1) | Faster, but changes array      |
| 3 ✅   | HashSet           | O(n)     | O(n)   | 🚀 Optimal in speed and clarity |

---
Let’s solve **LeetCode #217 – Contains Duplicate** in **Python 3** 🐍 — kc301 style with all **3 optimization levels**:

---

## 🧩 Function Signature

```python
def containsDuplicate(nums: List[int]) -> bool:
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare every pair using two nested loops.
### Python3 (Level #1)
```python
def containsDuplicate(nums: List[int]) -> bool:
    n = len(nums)
    for i in range(n):
        for j in range(i + 1, n):
            if nums[i] == nums[j]:
                return True
    return False
```

⏱ **Time Complexity**: `O(n²)`  
🧠 **Space Complexity**: `O(1)`  
✅ Easy to understand but inefficient.

---

## ⚙️ Level 2: Sort First, Then Check Neighbors

### 🔍 Approach:
Duplicates will be adjacent after sorting.
### Python3 (Level #2)
```python
def containsDuplicate(nums: List[int]) -> bool:
    nums.sort()
    for i in range(1, len(nums)):
        if nums[i] == nums[i - 1]:
            return True
    return False
```

⏱ **Time Complexity**: `O(n log n)`  
🧠 **Space**: `O(1)` (in-place sort)  
⚠️ Modifies original array.

---

## 🚀 Level 3: Fully Optimized with HashSet ⚡

### 🔍 Approach:
Use a set to track seen values.
### Python3 (Level #3)
```python
def containsDuplicate(nums: List[int]) -> bool:
    seen = set()
    for num in nums:
        if num in seen:
            return True
        seen.add(num)
    return False
```

⏱ **Time Complexity**: `O(n)`  
🧠 **Space Complexity**: `O(n)`  
🔥 Fast, clean, and Pythonic.

---

## 🧠 Summary Table

| Level | Approach            | Time     | Space  | Notes                            |
|-------|---------------------|----------|--------|----------------------------------|
| 1     | Brute Force         | O(n²)    | O(1)   | Very slow, just for learning     |
| 2     | Sort & Compare      | O(n log n)| O(1)  | Decent, but mutates input        |
| 3 ✅   | Hash Set            | O(n)     | O(n)   | 🚀 Best for real-world usage      |

---

Let's solve **LeetCode #217 – Contains Duplicate** in **C**, in 3 classic levels of optimization 💻⚔️:

---

## 🧩 Function Signature in C

```c
bool containsDuplicate(int* nums, int numsSize);
```

We’ll need:
- `stdbool.h` for `bool`
- `stdlib.h` for `qsort` and `malloc`

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare every pair of elements.
### C (Level #1)
```c
#include <stdbool.h>

bool containsDuplicate(int* nums, int numsSize) {
    for (int i = 0; i < numsSize - 1; i++) {
        for (int j = i + 1; j < numsSize; j++) {
            if (nums[i] == nums[j]) {
                return true;
            }
        }
    }
    return false;
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Basic, but inefficient.

---

## ⚙️ Level 2: Sort and Compare Neighbors

### 🔍 Approach:
Sort the array, then check adjacent elements.
### C (Level #2)
```c
#include <stdbool.h>
#include <stdlib.h>

int compare(const void* a, const void* b) {
    return (*(int*)a - *(int*)b);
}

bool containsDuplicate(int* nums, int numsSize) {
    qsort(nums, numsSize, sizeof(int), compare);
    for (int i = 1; i < numsSize; i++) {
        if (nums[i] == nums[i - 1]) {
            return true;
        }
    }
    return false;
}
```

⏱ Time: `O(n log n)`  
🧠 Space: `O(1)` (if in-place sort allowed)  
⚠️ Modifies input array.

---

## 🚀 Level 3: Hashing with a Set (Fully Optimized) ⚡

### 🔍 Approach:
Use a hash set to track seen values.  
Since C has no built-in hash sets, we implement it using a basic open-addressing hash table.
### C (Level #3)
```c
#include <stdbool.h>
#include <stdlib.h>

#define TABLE_SIZE 10007  // A large prime for good distribution

bool containsDuplicate(int* nums, int numsSize) {
    int* table = (int*)calloc(TABLE_SIZE, sizeof(int));
    bool* used = (bool*)calloc(TABLE_SIZE, sizeof(bool));

    for (int i = 0; i < numsSize; i++) {
        int num = nums[i];
        int hash = abs(num) % TABLE_SIZE;

        while (used[hash]) {
            if (table[hash] == num) {
                free(table);
                free(used);
                return true;
            }
            hash = (hash + 1) % TABLE_SIZE;  // linear probing
        }

        table[hash] = num;
        used[hash] = true;
    }

    free(table);
    free(used);
    return false;
}
```

⏱ Time: `O(n)` average  
🧠 Space: `O(n)`  
💡 Simple hash set simulation with open addressing.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                         |
|-------|------------------|------------|-----------|-------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Easy, but very slow           |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Modifies input array          |
| 3 ✅   | Hashing (Set)     | O(n)       | O(n)      | ⚡ Fastest, mimics set logic   |

---

Let's solve **LeetCode #217 – Contains Duplicate** in **C#**, using 3 levels of optimization — kc301 DSA-style 👑📦

---

## 🧩 Method Signature in C#

```csharp
public bool ContainsDuplicate(int[] nums)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use two loops to compare each element with all others.
### C# (Level #1)
```csharp
public bool ContainsDuplicate(int[] nums)
{
    int n = nums.Length;
    for (int i = 0; i < n - 1; i++)
    {
        for (int j = i + 1; j < n; j++)
        {
            if (nums[i] == nums[j])
                return true;
        }
    }
    return false;
}
```

⏱ **Time Complexity**: `O(n²)`  
🧠 **Space Complexity**: `O(1)`  
📎 Simple, but not efficient for big input sizes.

---

## ⚙️ Level 2: Sort + Compare 🧩

### 🔍 Approach:
Sort the array, then check consecutive elements.
### C# (Level #2)
```csharp
using System;

public bool ContainsDuplicate(int[] nums)
{
    Array.Sort(nums);
    for (int i = 1; i < nums.Length; i++)
    {
        if (nums[i] == nums[i - 1])
            return true;
    }
    return false;
}
```

⏱ **Time Complexity**: `O(n log n)`  
🧠 **Space Complexity**: `O(1)` (in-place sort)  
⚠️ Alters original array.

---

## 🚀 Level 3: HashSet Approach (Optimal) ⚡

### 🔍 Approach:
Use a `HashSet<int>` to track seen elements.
### C# (Level #3)
```csharp
using System.Collections.Generic;

public bool ContainsDuplicate(int[] nums)
{
    HashSet<int> seen = new HashSet<int>();
    foreach (int num in nums)
    {
        if (seen.Contains(num))
            return true;
        seen.Add(num);
    }
    return false;
}
```

⏱ **Time Complexity**: `O(n)`  
🧠 **Space Complexity**: `O(n)`  
🔥 Most efficient and cleanest solution in practice.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                            |
|-------|------------------|------------|-----------|----------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Very basic, slow                 |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Faster, but mutates input        |
| 3 ✅   | HashSet           | O(n)       | O(n)      | 🚀 Best in terms of speed & clarity |

---

Here's the solution for **LeetCode #217 – Contains Duplicate** in **JavaScript**, in full kc301 DSA fashion 🧙‍♂️✨ — 3 tiers:

---

## 🧩 Function Signature

```js
function containsDuplicate(nums) { }
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare all possible pairs using nested loops.
### Javascript (Level #1)
```js
function containsDuplicate(nums) {
  const n = nums.length;
  for (let i = 0; i < n - 1; i++) {
    for (let j = i + 1; j < n; j++) {
      if (nums[i] === nums[j]) {
        return true;
      }
    }
  }
  return false;
}
```

⏱ **Time Complexity**: `O(n²)`  
🧠 **Space Complexity**: `O(1)`  
✅ Works, but slow for big arrays.

---

## ⚙️ Level 2: Sort First, Then Compare Neighbors

### 🔍 Approach:
Sort the array and check adjacent values.
### Javascript (Level #2)
```js
function containsDuplicate(nums) {
  nums.sort((a, b) => a - b); // Numeric sort
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] === nums[i - 1]) {
      return true;
    }
  }
  return false;
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (ignoring sort space)  
⚠️ Modifies input array.

---

## 🚀 Level 3: Fully Optimized using Set ⚡

### 🔍 Approach:
Use a JavaScript `Set` to track seen values.
### Javascript (Level #3)
```js
function containsDuplicate(nums) {
  const seen = new Set();
  for (let num of nums) {
    if (seen.has(num)) {
      return true;
    }
    seen.add(num);
  }
  return false;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Best performance and super clean.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                         |
|-------|------------------|------------|-----------|-------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Very basic, not scalable      |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Modifies input array          |
| 3 ✅   | Set               | O(n)       | O(n)      | 🚀 Best in practice            |

---

Let’s tackle **LeetCode #217 – Contains Duplicate** in **TypeScript** 🧙‍♂️⚔️ — with the classic **3-level DSA breakdown**:

---

## 🧩 Function Signature in TypeScript

```ts
function containsDuplicate(nums: number[]): boolean
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Check every pair using nested loops.
### Typescript (Level #1)
```ts
function containsDuplicate(nums: number[]): boolean {
  const n = nums.length;
  for (let i = 0; i < n - 1; i++) {
    for (let j = i + 1; j < n; j++) {
      if (nums[i] === nums[j]) {
        return true;
      }
    }
  }
  return false;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Works, but very slow for large inputs.

---

## ⚙️ Level 2: Sort Then Compare

### 🔍 Approach:
Sort the array and check consecutive values.
### Typescript (Level #2)
```ts
function containsDuplicate(nums: number[]): boolean {
  nums.sort((a, b) => a - b); // Ensure numeric sort
  for (let i = 1; i < nums.length; i++) {
    if (nums[i] === nums[i - 1]) {
      return true;
    }
  }
  return false;
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (in-place)  
⚠️ Modifies original array.

---

## 🚀 Level 3: Optimized Using Set ⚡

### 🔍 Approach:
Use a `Set<number>` to detect duplicates on the fly.
### Typescript (Level #3)
```ts
function containsDuplicate(nums: number[]): boolean {
  const seen = new Set<number>();
  for (const num of nums) {
    if (seen.has(num)) {
      return true;
    }
    seen.add(num);
  }
  return false;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Clean, idiomatic, and most efficient.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                         |
|-------|------------------|------------|-----------|-------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Naive and slow                |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Mutates array, but faster     |
| 3 ✅   | Set               | O(n)       | O(n)      | 🚀 Optimal solution            |

---
Let's solve **LeetCode #217 – Contains Duplicate** in **PHP** 🐘 — kc301-style in **3 levels**:

---

## 🧩 Function Signature in PHP

```php
function containsDuplicate(array $nums): bool
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare each element with every other.
### Php (Level #1)
```php
function containsDuplicate(array $nums): bool {
    $n = count($nums);
    for ($i = 0; $i < $n - 1; $i++) {
        for ($j = $i + 1; $j < $n; $j++) {
            if ($nums[$i] === $nums[$j]) {
                return true;
            }
        }
    }
    return false;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Works but inefficient.

---

## ⚙️ Level 2: Sort First, Then Compare

### 🔍 Approach:
Sort array and check neighbors.
### Php (Level #2)
```php
function containsDuplicate(array $nums): bool {
    sort($nums); // Sorts in ascending order
    for ($i = 1; $i < count($nums); $i++) {
        if ($nums[$i] === $nums[$i - 1]) {
            return true;
        }
    }
    return false;
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (in-place)  
⚠️ Mutates the input array.

---

## 🚀 Level 3: Fully Optimized Using HashSet (Associative Array) ⚡

### 🔍 Approach:
Use an associative array to track seen numbers.
### Php (Level #3)
```php
function containsDuplicate(array $nums): bool {
    $seen = [];
    foreach ($nums as $num) {
        if (isset($seen[$num])) {
            return true;
        }
        $seen[$num] = true;
    }
    return false;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest, clean, and pure PHP magic.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                        |
|-------|------------------|------------|-----------|------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Naive and slow               |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Modifies input               |
| 3 ✅   | Hash Table        | O(n)       | O(n)      | 🚀 Best in practice           |

---

Here's the full **Swift** solution for **LeetCode #217 – Contains Duplicate**, written in 3 optimized levels — kc301 DSA style 🧙‍♂️🧠⚡

---

## 🧩 Function Signature in Swift

```swift
func containsDuplicate(_ nums: [Int]) -> Bool
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare every pair using two loops.
### Swift (Level #1)
```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    let n = nums.count
    for i in 0..<n {
        for j in (i + 1)..<n {
            if nums[i] == nums[j] {
                return true
            }
        }
    }
    return false
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Simple, but not scalable.

---

## ⚙️ Level 2: Sort and Compare Adjacent Elements

### 🔍 Approach:
Sort and check if any consecutive numbers are equal.
### Swift (Level #2)
```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    let sorted = nums.sorted()
    for i in 1..<sorted.count {
        if sorted[i] == sorted[i - 1] {
            return true
        }
    }
    return false
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(n)` (due to `.sorted()` creating a new array)  
⚠️ Doesn’t mutate original array.

---

## 🚀 Level 3: Optimized with a Set ⚡

### 🔍 Approach:
Track seen numbers using a `Set<Int>`.
### Swift (Level #3)
```swift
func containsDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for num in nums {
        if seen.contains(num) {
            return true
        }
        seen.insert(num)
    }
    return false
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest and most idiomatic Swift solution.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                            |
|-------|------------------|------------|-----------|----------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Basic and slow                   |
| 2     | Sort + Compare    | O(n log n) | O(n)      | Safe, doesn’t mutate input       |
| 3 ✅   | Set               | O(n)       | O(n)      | 🚀 Optimal & Swift-idiomatic     |

---

Let's solve **LeetCode #217 – Contains Duplicate** in **Kotlin** 🧙‍♂️⚡ — kc301-style in 3 levels:

---

## 🧩 Function Signature in Kotlin

```kotlin
fun containsDuplicate(nums: IntArray): Boolean
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare each pair using nested loops.
### Kotlin (Level #1)
```kotlin
fun containsDuplicate(nums: IntArray): Boolean {
    for (i in nums.indices) {
        for (j in i + 1 until nums.size) {
            if (nums[i] == nums[j]) {
                return true
            }
        }
    }
    return false
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Very basic, not efficient for large inputs.

---

## ⚙️ Level 2: Sort Then Compare Neighbors

### 🔍 Approach:
Sort and check if any adjacent numbers are equal.
### Kotlin (Level #2)
```kotlin
fun containsDuplicate(nums: IntArray): Boolean {
    val sorted = nums.sorted()
    for (i in 1 until sorted.size) {
        if (sorted[i] == sorted[i - 1]) {
            return true
        }
    }
    return false
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(n)` (due to `.sorted()` creating a new list)  
⚠️ Safer than mutating the input array.

---

## 🚀 Level 3: Fully Optimized Using HashSet ⚡

### 🔍 Approach:
Use a `HashSet` to track seen numbers.
### Kotlin (Level #3)
```kotlin
fun containsDuplicate(nums: IntArray): Boolean {
    val seen = HashSet<Int>()
    for (num in nums) {
        if (!seen.add(num)) {
            return true
        }
    }
    return false
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Clean, optimal, and Kotlin-idiomatic.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                         |
|-------|------------------|------------|-----------|-------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Naive and slow                |
| 2     | Sort + Compare    | O(n log n) | O(n)      | Avoids mutation, fast enough  |
| 3 ✅   | HashSet           | O(n)       | O(n)      | 🚀 Best practice in Kotlin     |

---

Of course! Here’s the full solution for **LeetCode #217 – Contains Duplicate** in **Dart**, served kc301-style 🧙🏻‍♂️🔥 in **three progressive levels**:

---

## 🧩 Function Signature in Dart

```dart
bool containsDuplicate(List<int> nums)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Compare every possible pair using nested loops.
### Dart (Level #1)
```dart
bool containsDuplicate(List<int> nums) {
  for (int i = 0; i < nums.length; i++) {
    for (int j = i + 1; j < nums.length; j++) {
      if (nums[i] == nums[j]) {
        return true;
      }
    }
  }
  return false;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Very basic, very slow on large inputs.

---

## ⚙️ Level 2: Sort and Compare Neighbors

### 🔍 Approach:
Sort the list and compare adjacent elements.
### Dart (Level #2)
```dart
bool containsDuplicate(List<int> nums) {
  nums.sort();
  for (int i = 1; i < nums.length; i++) {
    if (nums[i] == nums[i - 1]) {
      return true;
    }
  }
  return false;
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (ignoring sort space)  
⚠️ Modifies input list.

---

## 🚀 Level 3: Optimized with Set ⚡

### 🔍 Approach:
Use a `Set` to track seen numbers in one pass.
### Dart (Level #3)
```dart
bool containsDuplicate(List<int> nums) {
  Set<int> seen = {};
  for (int num in nums) {
    if (seen.contains(num)) {
      return true;
    }
    seen.add(num);
  }
  return false;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest, cleanest, and Dart-idiomatic.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                         |
|-------|------------------|------------|-----------|-------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Basic, not scalable           |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Efficient but mutates list    |
| 3 ✅   | Set               | O(n)       | O(n)      | 🚀 Optimal, clean and modern   |

---
Here’s the **Go (Golang)** solution for **LeetCode #217 – Contains Duplicate**, broken down in **3 mastery levels** like a true DSA kc301 🧙‍♂️🧠🔥

---

## 🧩 Function Signature in Go

```go
func containsDuplicate(nums []int) bool
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use nested loops to compare every pair.
### Go (Level #1)
```go
func containsDuplicate(nums []int) bool {
    for i := 0; i < len(nums); i++ {
        for j := i + 1; j < len(nums); j++ {
            if nums[i] == nums[j] {
                return true
            }
        }
    }
    return false
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Simple, but inefficient for big inputs.

---

## ⚙️ Level 2: Sort + Compare Neighbors

### 🔍 Approach:
Sort the array and check adjacent elements.
### Go (Level #2)
```go
import "sort"

func containsDuplicate(nums []int) bool {
    sort.Ints(nums)
    for i := 1; i < len(nums); i++ {
        if nums[i] == nums[i-1] {
            return true
        }
    }
    return false
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(log n)` (from sorting)  
⚠️ Mutates the original array.

---

## 🚀 Level 3: Fully Optimized with Map (Set Behavior) ⚡

### 🔍 Approach:
Use a `map[int]bool` to track seen numbers.
### Go (Level #3)
```go
func containsDuplicate(nums []int) bool {
    seen := make(map[int]bool)
    for _, num := range nums {
        if seen[num] {
            return true
        }
        seen[num] = true
    }
    return false
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest and cleanest Go-style solution.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                          |
|-------|------------------|------------|-----------|--------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Basic and slow                 |
| 2     | Sort + Compare    | O(n log n) | O(log n)  | Good but mutates input         |
| 3 ✅   | Hash Map (Set)    | O(n)       | O(n)      | 🚀 Best performance in Go       |

---
Here's the **Ruby** solution for **LeetCode #217 – Contains Duplicate**, presented in 3 levels — kc301 DSA style 🧙‍♂️💎🐍

---

## 🧩 Function Signature in Ruby

```ruby
def contains_duplicate(nums)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use two nested loops to compare each pair.
### Ruby (Level #1)
```ruby
def contains_duplicate(nums)
  (0...nums.length).each do |i|
    ((i + 1)...nums.length).each do |j|
      return true if nums[i] == nums[j]
    end
  end
  false
end
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Simple but inefficient for large inputs.

---

## ⚙️ Level 2: Sort and Compare Neighbors

### 🔍 Approach:
Sort the array and check adjacent elements.
### Ruby (Level #2)
```ruby
def contains_duplicate(nums)
  nums.sort!
  (1...nums.length).each do |i|
    return true if nums[i] == nums[i - 1]
  end
  false
end
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (in-place sort)  
⚠️ Modifies the original array.

---

## 🚀 Level 3: Fully Optimized with Set ⚡

### 🔍 Approach:
Use a `Set` to track seen elements.
### Ruby (Level #3)
```ruby
require 'set'

def contains_duplicate(nums)
  seen = Set.new
  nums.each do |num|
    return true if seen.include?(num)
    seen.add(num)
  end
  false
end
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Cleanest and most Ruby-idiomatic solution.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                          |
|-------|------------------|------------|-----------|--------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Easy to write, poor scaling    |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Fast, mutates input            |
| 3 ✅   | Set               | O(n)       | O(n)      | 🚀 Optimal & expressive         |

---
Here's the **Scala** solution for **LeetCode #217 – Contains Duplicate**, laid out in **three levels** like a true DSA kc301 🧙🏻‍♂️⚔️🔥

---

## 🧩 Function Signature in Scala

```scala
def containsDuplicate(nums: Array[Int]): Boolean
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use nested loops to compare all pairs.
### Scala (Level #1)
```scala
def containsDuplicate(nums: Array[Int]): Boolean = {
  for (i <- nums.indices) {
    for (j <- i + 1 until nums.length) {
      if (nums(i) == nums(j)) return true
    }
  }
  false
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Easy to implement, but slow for large arrays.

---

## ⚙️ Level 2: Sort & Compare Adjacent Elements

### 🔍 Approach:
Sort the array and look for equal neighbors.
### Scala (Level #2)
```scala
def containsDuplicate(nums: Array[Int]): Boolean = {
  val sorted = nums.sorted
  for (i <- 1 until sorted.length) {
    if (sorted(i) == sorted(i - 1)) return true
  }
  false
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(n)` (due to `sorted` creating a new array)  
⚠️ Preserves original input.

---

## 🚀 Level 3: Optimal with Set ⚡

### 🔍 Approach:
Use a `mutable.Set` to track visited elements.
### Scala (Level #3)
```scala
import scala.collection.mutable

def containsDuplicate(nums: Array[Int]): Boolean = {
  val seen = mutable.Set[Int]()
  for (num <- nums) {
    if (seen.contains(num)) return true
    seen += num
  }
  false
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Fastest and most idiomatic in Scala.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                            |
|-------|------------------|------------|-----------|----------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Very basic, very slow            |
| 2     | Sort + Compare    | O(n log n) | O(n)      | Safer, avoids mutation           |
| 3 ✅   | Hash Set          | O(n)       | O(n)      | 🚀 Best for performance & clarity |

---
Here's the full **Rust** solution for **LeetCode #217 – Contains Duplicate**, presented in **three levels of optimization** — kc301 DSA style 🧙‍♂️⚔️🦀

---

## 🧩 Function Signature in Rust

```rust
fn contains_duplicate(nums: Vec<i32>) -> bool
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use nested loops to compare each pair.
### Rust (Level #1)
```rust
fn contains_duplicate(nums: Vec<i32>) -> bool {
    for i in 0..nums.len() {
        for j in (i + 1)..nums.len() {
            if nums[i] == nums[j] {
                return true;
            }
        }
    }
    false
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(1)`  
✅ Works, but not scalable.

---

## ⚙️ Level 2: Sort and Compare Neighbors

### 🔍 Approach:
Sort the vector, then compare adjacent elements.
### Rust (Level #2)
```rust
fn contains_duplicate(mut nums: Vec<i32>) -> bool {
    nums.sort();
    for i in 1..nums.len() {
        if nums[i] == nums[i - 1] {
            return true;
        }
    }
    false
}
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(1)` (in-place sort)  
⚠️ Mutates the original input.

---

## 🚀 Level 3: Fully Optimized with HashSet ⚡

### 🔍 Approach:
Use a `HashSet` to track seen values in one pass.
### Rust (Level #3)
```rust
use std::collections::HashSet;

fn contains_duplicate(nums: Vec<i32>) -> bool {
    let mut seen = HashSet::new();
    for num in nums {
        if !seen.insert(num) {
            return true;
        }
    }
    false
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Idiomatic, clean, and best performance.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                          |
|-------|------------------|------------|-----------|--------------------------------|
| 1     | Brute Force       | O(n²)      | O(1)      | Easy, slow                     |
| 2     | Sort + Compare    | O(n log n) | O(1)      | Safer if input is copied       |
| 3 ✅   | HashSet           | O(n)       | O(n)      | 🚀 Fast, safe, Rustacean-style |

---

Here's the full solution for **LeetCode #217 – Contains Duplicate** implemented in **Racket**, across **three levels** of algorithmic mastery — kc301 DSA style 🧙‍♂️🐉🎓

---

## 🧩 Function Signature in Racket

```racket
(define (contains-duplicate nums) ...)
```

We’ll assume input as a **list of integers**.

---

## 🧱 Level 1: Brute Force 🐢
### Racket (Level #1)
### 🔍 Approach:
Use nested loops to compare each pair.
### Racket (Level #1)
```racket
(define (contains-duplicate nums)
  (define (has-dup? lst)
    (cond
      [(empty? lst) #f]
      [(ormap (λ (x) (= x (first lst))) (rest lst)) #t]
      [else (has-dup? (rest lst))]))
  (has-dup? nums))
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)` due to recursion stack  
✅ Works but not efficient.

---

## ⚙️ Level 2: Sort + Compare Neighbors

### 🔍 Approach:
Sort the list and check consecutive elements.
### Racket (Level #2)
```racket
(define (contains-duplicate nums)
  (define sorted (sort nums <))
  (define (check-adj lst)
    (cond
      [(or (empty? lst) (empty? (rest lst))) #f]
      [(= (first lst) (second lst)) #t]
      [else (check-adj (rest lst))]))
  (check-adj sorted))
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(n)` (new sorted list)  
⚠️ Safe and functional, avoids mutation.

---

## 🚀 Level 3: Hash Set Style with `hash-set` ⚡

### 🔍 Approach:
Use a hash set to track seen elements.
### Racket (Level #3)
```racket
(define (contains-duplicate nums)
  (define seen (make-hash))
  (define (check lst)
    (cond
      [(empty? lst) #f]
      [(hash-has-key? seen (first lst)) #t]
      [else
       (hash-set! seen (first lst) #t)
       (check (rest lst))]))
  (check nums))
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Best in terms of performance.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                              |
|-------|------------------|------------|-----------|-------------------------------------|
| 1     | Brute Force       | O(n²)      | O(n)      | Simple but slow                     |
| 2     | Sort + Compare    | O(n log n) | O(n)      | Safe, avoids mutation               |
| 3 ✅   | Hash Set          | O(n)       | O(n)      | 🚀 Optimal for performance & clarity |

---

Here's the full Erlang solution for **LeetCode #217 – Contains Duplicate**, broken down into **3 mastery levels** – kc301 DSA style 🧙‍♂️🧬🐘

---

## 🧩 Function Signature in Erlang

```erlang
contains_duplicate(Nums) -> boolean().
```

Input is a list of integers. Erlang doesn't have native hash sets, but we can use maps for constant-time lookups.

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Nested iteration using recursion to compare all pairs.
### Erlang (Level #1)
```erlang
-module(contains_duplicate).
-export([contains_duplicate_brute/1]).

contains_duplicate_brute([]) -> false;
contains_duplicate_brute([H|T]) ->
    case lists:member(H, T) of
        true -> true;
        false -> contains_duplicate_brute(T)
    end.
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)` (call stack recursion)  
✅ Simple and readable, but not efficient.

---

## ⚙️ Level 2: Sort & Compare Adjacent Elements

### 🔍 Approach:
Sort list, then compare neighbors.
### Erlang (Level #2)
```erlang
-module(contains_duplicate).
-export([contains_duplicate_sort/1]).

contains_duplicate_sort(Nums) ->
    Sorted = lists:sort(Nums),
    check_adjacent(Sorted).

check_adjacent([_]) -> false;
check_adjacent([A, B | T]) ->
    case A == B of
        true -> true;
        false -> check_adjacent([B | T])
    end.
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(n)` (for sorted list)  
⚠️ Avoids brute force, but still not optimal.

---

## 🚀 Level 3: Fully Optimized with Map (Set Behavior) ⚡

### 🔍 Approach:
Use a map as a set to track seen elements.
### Erlang (Level #3)
```erlang
-module(contains_duplicate).
-export([contains_duplicate/1]).

contains_duplicate(Nums) ->
    check(Nums, #{}).

check([], _) -> false;
check([H|T], Seen) ->
    case maps:is_key(H, Seen) of
        true -> true;
        false -> check(T, maps:put(H, true, Seen))
    end.
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Best performance and idiomatic in Erlang.

---

## 🧠 Summary Table

| Level | Approach         | Time       | Space     | Notes                          |
|-------|------------------|------------|-----------|--------------------------------|
| 1     | Brute Force       | O(n²)      | O(n)      | Simple recursion               |
| 2     | Sort + Compare    | O(n log n) | O(n)      | Efficient, but not optimal     |
| 3 ✅   | Map as Set        | O(n)       | O(n)      | 🚀 Best in Erlang's toolset     |

---
Here's the full **Elixir** solution for **LeetCode #217 – Contains Duplicate**, broken down in **3 kc301 levels** 🧙‍♂️⚡💎 — keeping it functional, performant, and idiomatic Elixir all the way.

---

## 🧩 Function Signature in Elixir

```elixir
def contains_duplicate(nums), do: ...
```

Input is a **list of integers**.

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use nested loops via recursion to check each pair.
### Elixir (Level #1)
```elixir
defmodule ContainsDuplicate do
  def contains_duplicate_brute([]), do: false
  def contains_duplicate_brute([head | tail]) do
    if head in tail do
      true
    else
      contains_duplicate_brute(tail)
    end
  end
end
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)` (recursion stack)  
✅ Easy but not scalable.

---

## ⚙️ Level 2: Sort and Compare Neighbors

### 🔍 Approach:
Sort list and check consecutive elements.
### Elixir (Level #2)
```elixir
defmodule ContainsDuplicate do
  def contains_duplicate_sort(nums) do
    nums
    |> Enum.sort()
    |> check_adjacent()
  end

  defp check_adjacent([_]), do: false
  defp check_adjacent([a, b | rest]) do
    if a == b, do: true, else: check_adjacent([b | rest])
  end
end
```

⏱ **Time**: `O(n log n)`  
🧠 **Space**: `O(n)` (for sorted list)  
⚠️ Pure and safe, doesn't mutate original list.

---

## 🚀 Level 3: Fully Optimized with MapSet ⚡

### 🔍 Approach:
Use `MapSet` (Elixir’s set type) for constant-time membership checks.
### Elixir (Level #3)
```elixir
defmodule ContainsDuplicate do
  def contains_duplicate(nums) do
    check(nums, MapSet.new())
  end

  defp check([], _set), do: false
  defp check([head | tail], set) do
    if MapSet.member?(set, head) do
      true
    else
      check(tail, MapSet.put(set, head))
    end
  end
end
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🔥 Idiomatic and fast — best for production.

---

## 🧠 Summary Table

| Level | Approach          | Time       | Space     | Notes                             |
|-------|-------------------|------------|-----------|-----------------------------------|
| 1     | Brute Force        | O(n²)      | O(n)      | Simple but very slow              |
| 2     | Sort + Compare     | O(n log n) | O(n)      | Safe, uses recursion              |
| 3 ✅   | MapSet (HashSet)   | O(n)       | O(n)      | 🚀 Cleanest and most efficient     |

---