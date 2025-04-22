Let's break down **LeetCode #238 Product of Array Except Self ** in **C++**, **Java**, **Python3**, **C**, **C#**, **JavaScript**, **TypeScrip**, **PHP**, **Swift**, **Kotlin**, **Dart**, **Go**, **Ruby**, **Scala**, **Rust**, **Racket**, **Erlang**, **Elixir** with **three levels** of optimization, **each passing all test cases**, along with **clear explanations**.


Here's the **C++ solution** for **LeetCode #238 – Product of Array Except Self**, broken down into **3 mastery levels**, KC301 DSA style 🧙‍♂️⚔️🔥

---

## 🧩 Problem Summary

Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` **except** `nums[i]`.

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in O(n) time and without using the division operation.

```
Example 1:

Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Example 2:

Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]


Constraints:

2 <= nums.length <= 105
-30 <= nums[i] <= 30
The input is generated such that answer[i] is guaranteed to fit in a 32-bit integer.
 

Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)

```

**Constraints:**
- Do **not** use division.
- Must run in **O(n)** time.
- You must solve it **without allocating extra space for the output array** (besides the one returned).



---

### Function Signature

```cpp
vector<int> productExceptSelf(vector<int>& nums);
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
For each index, compute product of all other elements using nested loops.
### C++ (Level #1) 
```cpp
vector<int> productExceptSelf(vector<int>& nums) {
    int n = nums.size();
    vector<int> result(n, 1);
    
    for (int i = 0; i < n; ++i) {
        int prod = 1;
        for (int j = 0; j < n; ++j) {
            if (i != j) prod *= nums[j];
        }
        result[i] = prod;
    }
    return result;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
✅ Works but too slow for large inputs.

---

## ⚙️ Level 2: Using Prefix and Suffix Arrays

### 🔍 Approach:
- Precompute products to the **left** and **right** of each index.
- Multiply the two to get result.
### C++ (Level #2)
```cpp
vector<int> productExceptSelf(vector<int>& nums) {
    int n = nums.size();
    vector<int> left(n, 1), right(n, 1), result(n);

    for (int i = 1; i < n; ++i) {
        left[i] = left[i - 1] * nums[i - 1];
    }

    for (int i = n - 2; i >= 0; --i) {
        right[i] = right[i + 1] * nums[i + 1];
    }

    for (int i = 0; i < n; ++i) {
        result[i] = left[i] * right[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)` (for `left` and `right`)  
⚠️ Better, but can still be optimized further.

---

## 🚀 Level 3: Fully Optimized — No Extra Space ⚡

### 🔍 Approach:
- Use the **result array** to store left products first.
- Then do a single reverse pass with a variable tracking right product.
### C++ (Level #2)
```cpp
vector<int> productExceptSelf(vector<int>& nums) {
    int n = nums.size();
    vector<int> result(n, 1);

    int left = 1;
    for (int i = 0; i < n; ++i) {
        result[i] = left;
        left *= nums[i];
    }

    int right = 1;
    for (int i = n - 1; i >= 0; --i) {
        result[i] *= right;
        right *= nums[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` (output space not counted)  
🔥 Best performance with full space optimization.

---

## 🧠 Summary Table

| Level | Approach                      | Time       | Space     | Notes                                 |
|-------|-------------------------------|------------|-----------|----------------------------------------|
| 1     | Brute Force                   | O(n²)      | O(n)      | Very slow, basic                       |
| 2     | Prefix & Suffix Arrays        | O(n)       | O(n)      | Efficient but still uses extra space  |
| 3 ✅   | Prefix + Reverse Right Pass   | O(n)       | O(1)*     | 🚀 Optimal — space-efficient + fast    |

---

Here's the full **Java solution** for **LeetCode #238 – Product of Array Except Self**, structured in **3 mastery levels**, Grandmaster DSA style 🧙‍♂️🔥☕️

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
For each element, multiply everything else.
### Java (Level #1)
```java
public class ProductExceptSelf {
    public int[] productExceptSelfBrute(int[] nums) {
        int n = nums.length;
        int[] result = new int[n];

        for (int i = 0; i < n; i++) {
            int prod = 1;
            for (int j = 0; j < n; j++) {
                if (i != j) prod *= nums[j];
            }
            result[i] = prod;
        }

        return result;
    }
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
✅ Works but too slow for large inputs.

---

## ⚙️ Level 2: Prefix and Suffix Arrays

### 🔍 Approach:
Store products to the **left** and **right** of each element, then multiply them.
### Java (Level #2)
```java
public class ProductExceptSelf {
    public int[] productExceptSelfPrefixSuffix(int[] nums) {
        int n = nums.length;
        int[] left = new int[n];
        int[] right = new int[n];
        int[] result = new int[n];

        left[0] = 1;
        for (int i = 1; i < n; i++) {
            left[i] = left[i - 1] * nums[i - 1];
        }

        right[n - 1] = 1;
        for (int i = n - 2; i >= 0; i--) {
            right[i] = right[i + 1] * nums[i + 1];
        }

        for (int i = 0; i < n; i++) {
            result[i] = left[i] * right[i];
        }

        return result;
    }
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)` (excluding result array)  
⚠️ Much better, but still uses extra space.

---

## 🚀 Level 3: Fully Optimized – No Extra Space ⚡

### 🔍 Approach:
Use result array to store left products, then multiply with right in reverse pass.
### Java (Level #3)
```java
public class ProductExceptSelf {
    public int[] productExceptSelf(int[] nums) {
        int n = nums.length;
        int[] result = new int[n];

        // Left pass
        int left = 1;
        for (int i = 0; i < n; i++) {
            result[i] = left;
            left *= nums[i];
        }

        // Right pass
        int right = 1;
        for (int i = n - 1; i >= 0; i--) {
            result[i] *= right;
            right *= nums[i];
        }

        return result;
    }
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` (not counting result array)  
🔥 Fastest and most memory-efficient.

---

## 🧠 Summary Table

| Level | Approach                   | Time       | Space     | Notes                                 |
|-------|----------------------------|------------|-----------|----------------------------------------|
| 1     | Brute Force                | O(n²)      | O(n)      | Simple but slow                        |
| 2     | Prefix + Suffix Arrays     | O(n)       | O(n)      | Efficient but uses extra arrays        |
| 3 ✅   | Prefix + Reverse Right Pass| O(n)       | O(1)      | 🚀 Optimal & production-ready           |

---

Absolutely! Here's the **Python 3 solution** for **LeetCode #238 – Product of Array Except Self**, structured in **3 Grandmaster DSA levels** 🧙‍♂️🐍🔥

---


### Function Signature

```python
def productExceptSelf(nums: List[int]) -> List[int]:
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use nested loops to multiply all other elements.

```python
from typing import List

def productExceptSelf_brute(nums: List[int]) -> List[int]:
    n = len(nums)
    result = []

    for i in range(n):
        prod = 1
        for j in range(n):
            if i != j:
                prod *= nums[j]
        result.append(prod)

    return result
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
✅ Works but too slow for large inputs.

---

## ⚙️ Level 2: Prefix and Suffix Arrays

### 🔍 Approach:
Use two auxiliary arrays to hold prefix and suffix products, then multiply.

```python
def productExceptSelf_prefix_suffix(nums: List[int]) -> List[int]:
    n = len(nums)
    left = [1] * n
    right = [1] * n
    result = [1] * n

    for i in range(1, n):
        left[i] = left[i - 1] * nums[i - 1]

    for i in range(n - 2, -1, -1):
        right[i] = right[i + 1] * nums[i + 1]

    for i in range(n):
        result[i] = left[i] * right[i]

    return result
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
🧼 Much cleaner and efficient than brute force.

---

## 🚀 Level 3: Fully Optimized – Constant Space ⚡

### 🔍 Approach:
Reuse the `result` list to store prefix products in the first pass.  
Then, apply suffix multiplication in reverse pass using a single variable.

```python
def productExceptSelf(nums: List[int]) -> List[int]:
    n = len(nums)
    result = [1] * n

    prefix = 1
    for i in range(n):
        result[i] = prefix
        prefix *= nums[i]

    suffix = 1
    for i in range(n - 1, -1, -1):
        result[i] *= suffix
        suffix *= nums[i]

    return result
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` (excluding output array)  
💨 Fast, elegant, and meets all constraints.

---

## 🧠 Summary Table

| Level | Approach                    | Time       | Space     | Notes                                 |
|-------|-----------------------------|------------|-----------|----------------------------------------|
| 1     | Brute Force                 | O(n²)      | O(n)      | Simple but slow                        |
| 2     | Prefix + Suffix Arrays      | O(n)       | O(n)      | Faster but uses extra memory           |
| 3 ✅   | Prefix + Reverse Pass       | O(n)       | O(1)*     | 🚀 Best — clean, optimal, production   |

---

Absolutely! Here's the **C solution** for **LeetCode #238 – Product of Array Except Self**, in full **Grandmaster DSA style** 🧙‍♂️⚔️🔥 with **three levels of optimization**.

---

## 🔧 Function Signature

```c
int* productExceptSelf(int* nums, int numsSize, int* returnSize);
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
For each index, loop through and multiply all elements except the one at that index.

```c
int* productExceptSelf_brute(int* nums, int numsSize, int* returnSize) {
    *returnSize = numsSize;
    int* result = (int*)malloc(numsSize * sizeof(int));

    for (int i = 0; i < numsSize; ++i) {
        int product = 1;
        for (int j = 0; j < numsSize; ++j) {
            if (i != j) {
                product *= nums[j];
            }
        }
        result[i] = product;
    }

    return result;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
🧪 Works for small input, but too slow for large datasets.

---

## ⚙️ Level 2: Prefix & Suffix Arrays

### 🔍 Approach:
Precompute the prefix and suffix product arrays, then multiply corresponding entries.

```c
int* productExceptSelf_prefix_suffix(int* nums, int numsSize, int* returnSize) {
    *returnSize = numsSize;
    int* left = (int*)malloc(numsSize * sizeof(int));
    int* right = (int*)malloc(numsSize * sizeof(int));
    int* result = (int*)malloc(numsSize * sizeof(int));

    left[0] = 1;
    for (int i = 1; i < numsSize; ++i) {
        left[i] = left[i - 1] * nums[i - 1];
    }

    right[numsSize - 1] = 1;
    for (int i = numsSize - 2; i >= 0; --i) {
        right[i] = right[i + 1] * nums[i + 1];
    }

    for (int i = 0; i < numsSize; ++i) {
        result[i] = left[i] * right[i];
    }

    free(left);
    free(right);
    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
⚙️ Efficient and easier to reason about, but not space-optimal.

---

## 🚀 Level 3: Fully Optimized – Constant Space ⚡

### 🔍 Approach:
- Use the result array to store left products.
- Do a reverse traversal to multiply with right products.

```c
int* productExceptSelf(int* nums, int numsSize, int* returnSize) {
    *returnSize = numsSize;
    int* result = (int*)malloc(numsSize * sizeof(int));

    int prefix = 1;
    for (int i = 0; i < numsSize; ++i) {
        result[i] = prefix;
        prefix *= nums[i];
    }

    int suffix = 1;
    for (int i = numsSize - 1; i >= 0; --i) {
        result[i] *= suffix;
        suffix *= nums[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` extra (excluding result)  
🔥 Fully optimized and production-ready.

---

## 🧠 Summary Table

| Level | Approach                   | Time     | Space     | Notes                             |
|-------|----------------------------|----------|-----------|------------------------------------|
| 1     | Brute Force                | O(n²)    | O(n)      | Basic, too slow                    |
| 2     | Prefix + Suffix Arrays     | O(n)     | O(n)      | Efficient, but uses extra space    |
| 3 ✅   | Prefix + Reverse Suffix    | O(n)     | O(1)*     | 🚀 Optimal for speed and memory     |

---

Absolutely! Here's the **C# solution** for **LeetCode #238 – Product of Array Except Self**, presented in **3 mastery levels** just like a DSA Grandmaster would break it down 🧙‍♂️🪄📦

---

## ✅ Method Signature in C#

```csharp
public int[] ProductExceptSelf(int[] nums)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
For each index, calculate the product of every other element.

```csharp
public int[] ProductExceptSelfBrute(int[] nums)
{
    int n = nums.Length;
    int[] result = new int[n];

    for (int i = 0; i < n; i++)
    {
        int prod = 1;
        for (int j = 0; j < n; j++)
        {
            if (i != j)
                prod *= nums[j];
        }
        result[i] = prod;
    }

    return result;
}
```

⏱ **Time**: O(n²)  
🧠 **Space**: O(n)  
✔️ Works, but slow on large input.

---

## ⚙️ Level 2: Prefix & Suffix Arrays

### 🔍 Approach:
Precompute the prefix (left) and suffix (right) products, then multiply them.

```csharp
public int[] ProductExceptSelfPrefixSuffix(int[] nums)
{
    int n = nums.Length;
    int[] left = new int[n];
    int[] right = new int[n];
    int[] result = new int[n];

    left[0] = 1;
    for (int i = 1; i < n; i++)
    {
        left[i] = left[i - 1] * nums[i - 1];
    }

    right[n - 1] = 1;
    for (int i = n - 2; i >= 0; i--)
    {
        right[i] = right[i + 1] * nums[i + 1];
    }

    for (int i = 0; i < n; i++)
    {
        result[i] = left[i] * right[i];
    }

    return result;
}
```

⏱ **Time**: O(n)  
🧠 **Space**: O(n) (extra arrays)  
👍 Much faster, but not space-optimal.

---

## 🚀 Level 3: Fully Optimized – Constant Extra Space ⚡

### 🔍 Approach:
- Use `result[]` to store left products.
- Do a backward traversal with a `right` multiplier.

```csharp
public int[] ProductExceptSelf(int[] nums)
{
    int n = nums.Length;
    int[] result = new int[n];

    int left = 1;
    for (int i = 0; i < n; i++)
    {
        result[i] = left;
        left *= nums[i];
    }

    int right = 1;
    for (int i = n - 1; i >= 0; i--)
    {
        result[i] *= right;
        right *= nums[i];
    }

    return result;
}
```

⏱ **Time**: O(n)  
🧠 **Space**: O(1)** (excluding result array)  
🚀 Best performance, space-efficient, and LeetCode-approved.

---

## 🧠 Summary

| Level | Name                      | Time  | Space | Notes                                |
|-------|---------------------------|-------|-------|---------------------------------------|
| 1     | Brute Force               | O(n²) | O(n)  | Simple, slow                          |
| 2     | Prefix & Suffix Arrays    | O(n)  | O(n)  | Efficient but uses extra arrays       |
| 3 ✅   | Prefix + Reverse Right    | O(n)  | O(1)  | ✅ Optimal solution                    |

---
You got it! Here's the full **JavaScript solution** for **LeetCode #238 – Product of Array Except Self**, broken down in **3 Grandmaster DSA levels** 🧙‍♂️⚔️💥

---

## ✅ Function Signature (JS)

```js
function productExceptSelf(nums) { ... }
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use two nested loops, skip the current index during multiplication.

```js
function productExceptSelfBrute(nums) {
    const n = nums.length;
    const result = [];

    for (let i = 0; i < n; i++) {
        let product = 1;
        for (let j = 0; j < n; j++) {
            if (i !== j) product *= nums[j];
        }
        result.push(product);
    }

    return result;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
✅ Works but inefficient for large arrays.

---

## ⚙️ Level 2: Prefix & Suffix Arrays

### 🔍 Approach:
Use two separate arrays for prefix and suffix products, then combine them.

```js
function productExceptSelfPrefixSuffix(nums) {
    const n = nums.length;
    const left = Array(n).fill(1);
    const right = Array(n).fill(1);
    const result = Array(n).fill(1);

    for (let i = 1; i < n; i++) {
        left[i] = left[i - 1] * nums[i - 1];
    }

    for (let i = n - 2; i >= 0; i--) {
        right[i] = right[i + 1] * nums[i + 1];
    }

    for (let i = 0; i < n; i++) {
        result[i] = left[i] * right[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
⚙️ Efficient, but uses extra memory.

---

## 🚀 Level 3: Fully Optimized – Constant Space ⚡

### 🔍 Approach:
- Use output array to store prefix products.
- In second pass, multiply with suffix product.

```js
function productExceptSelf(nums) {
    const n = nums.length;
    const result = Array(n).fill(1);

    let prefix = 1;
    for (let i = 0; i < n; i++) {
        result[i] = prefix;
        prefix *= nums[i];
    }

    let suffix = 1;
    for (let i = n - 1; i >= 0; i--) {
        result[i] *= suffix;
        suffix *= nums[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` (excluding output)  
🔥 Optimal & elegant solution!

---

## 🧠 Summary

| Level | Approach                | Time   | Space  | Notes                          |
|-------|-------------------------|--------|--------|---------------------------------|
| 1     | Brute Force             | O(n²)  | O(n)   | Too slow for large input       |
| 2     | Prefix + Suffix Arrays  | O(n)   | O(n)   | Efficient but not optimal      |
| 3 ✅   | Prefix + Suffix in-place| O(n)   | O(1)*  | 💯 Best approach (LC-approved)  |

---

Absolutely! Here's the **TypeScript** version of **LeetCode #238 – Product of Array Except Self**, in the full **DSA Grandmaster style** 🧙‍♂️🔥 with **three tiers** of optimization.

---

## 🧩 Problem: Product of Array Except Self

> Return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`, without using division, in **O(n)** time and with **constant extra space**.

---

## ✅ Function Signature (TypeScript)

```ts
function productExceptSelf(nums: number[]): number[];
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use a nested loop to multiply all elements except the current index.

```ts
function productExceptSelfBrute(nums: number[]): number[] {
    const n = nums.length;
    const result: number[] = [];

    for (let i = 0; i < n; i++) {
        let product = 1;
        for (let j = 0; j < n; j++) {
            if (i !== j) {
                product *= nums[j];
            }
        }
        result.push(product);
    }

    return result;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
✅ Correct but inefficient for large input.

---

## ⚙️ Level 2: Prefix & Suffix Arrays

### 🔍 Approach:
Use `left[]` and `right[]` arrays to store prefix and suffix products.

```ts
function productExceptSelfPrefixSuffix(nums: number[]): number[] {
    const n = nums.length;
    const left: number[] = Array(n).fill(1);
    const right: number[] = Array(n).fill(1);
    const result: number[] = Array(n).fill(1);

    for (let i = 1; i < n; i++) {
        left[i] = left[i - 1] * nums[i - 1];
    }

    for (let i = n - 2; i >= 0; i--) {
        right[i] = right[i + 1] * nums[i + 1];
    }

    for (let i = 0; i < n; i++) {
        result[i] = left[i] * right[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)` (excluding result)  
⚙️ Efficient but not optimal in memory usage.

---

## 🚀 Level 3: Fully Optimized – Constant Space ⚡

### 🔍 Approach:
Use `result[]` to store left product, then apply right product in reverse pass.

```ts
function productExceptSelf(nums: number[]): number[] {
    const n = nums.length;
    const result: number[] = Array(n).fill(1);

    let prefix = 1;
    for (let i = 0; i < n; i++) {
        result[i] = prefix;
        prefix *= nums[i];
    }

    let suffix = 1;
    for (let i = n - 1; i >= 0; i--) {
        result[i] *= suffix;
        suffix *= nums[i];
    }

    return result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` (excluding result)  
🔥 Optimal for time and space.

---

## 🧠 Summary Table

| Level | Approach                   | Time   | Space  | Notes                          |
|-------|----------------------------|--------|--------|--------------------------------|
| 1     | Brute Force                | O(n²)  | O(n)   | Too slow for large datasets    |
| 2     | Prefix + Suffix Arrays     | O(n)   | O(n)   | Efficient, but memory heavier  |
| 3 ✅   | Prefix + Suffix In-place   | O(n)   | O(1)*  | ✅ Best approach for production |

---

Absolutely! Here's the **PHP solution** for **LeetCode #238 – Product of Array Except Self**, delivered in the full **DSA Grandmaster 3-tier format** 🧙‍♂️🐘📦

---

## 🧩 Problem: Product of Array Except Self

> Return an array `answer` such that `answer[i]` is the product of all elements in `nums` **except** `nums[i]`, without using division, in `O(n)` time and with constant space (excluding result).

---

## ✅ Function Signature (PHP)

```php
function productExceptSelf(array $nums): array
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Use nested loops to multiply all elements except the one at the current index.

```php
function productExceptSelfBrute(array $nums): array {
    $n = count($nums);
    $result = [];

    for ($i = 0; $i < $n; $i++) {
        $product = 1;
        for ($j = 0; $j < $n; $j++) {
            if ($i != $j) {
                $product *= $nums[$j];
            }
        }
        $result[] = $product;
    }

    return $result;
}
```

⏱ **Time**: `O(n²)`  
🧠 **Space**: `O(n)`  
✅ Works, but very slow for large input.

---

## ⚙️ Level 2: Prefix & Suffix Arrays

### 🔍 Approach:
Build `left[]` and `right[]` arrays for prefix and suffix products.

```php
function productExceptSelfPrefixSuffix(array $nums): array {
    $n = count($nums);
    $left = array_fill(0, $n, 1);
    $right = array_fill(0, $n, 1);
    $result = [];

    for ($i = 1; $i < $n; $i++) {
        $left[$i] = $left[$i - 1] * $nums[$i - 1];
    }

    for ($i = $n - 2; $i >= 0; $i--) {
        $right[$i] = $right[$i + 1] * $nums[$i + 1];
    }

    for ($i = 0; $i < $n; $i++) {
        $result[] = $left[$i] * $right[$i];
    }

    return $result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(n)`  
📦 Better, but not space-optimal.

---

## 🚀 Level 3: Fully Optimized – Constant Extra Space ⚡

### 🔍 Approach:
- First pass: store left product in result array
- Second pass: multiply by right product in reverse

```php
function productExceptSelf(array $nums): array {
    $n = count($nums);
    $result = array_fill(0, $n, 1);

    $prefix = 1;
    for ($i = 0; $i < $n; $i++) {
        $result[$i] = $prefix;
        $prefix *= $nums[$i];
    }

    $suffix = 1;
    for ($i = $n - 1; $i >= 0; $i--) {
        $result[$i] *= $suffix;
        $suffix *= $nums[$i];
    }

    return $result;
}
```

⏱ **Time**: `O(n)`  
🧠 **Space**: `O(1)` (excluding result array)  
✅ **Optimal and LeetCode-approved!**

---

## 🧠 Summary

| Level | Approach                 | Time   | Space  | Notes                             |
|-------|--------------------------|--------|--------|------------------------------------|
| 1     | Brute Force              | O(n²)  | O(n)   | Works but very inefficient         |
| 2     | Prefix & Suffix Arrays   | O(n)   | O(n)   | Space-heavy but fast               |
| 3 ✅   | Optimized Space & Time   | O(n)   | O(1)*  | ✅ Best practice for interviews     |

---

Let me know if you want the next solution in **Swift**, **Kotlin**, **Dart**, or any other wizardry 🧙‍♂️✨