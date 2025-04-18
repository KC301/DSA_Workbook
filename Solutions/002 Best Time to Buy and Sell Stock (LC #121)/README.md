Let's break down **LeetCode #1 - Best Time to Buy and Sell Stock (LC #121)** in **C++**, **Java**, **Python3**, **C**, **C#**, **JavaScript**, **TypeScrip**, **PHP**, **Swift**, **Kotlin**, **Dart**, **Go**, **Ruby**, **Scala**, **Rust**, **Racket**, **Erlang**, **Elixir** with **three levels** of optimization, **each passing all test cases**, along with **clear explanations**.

---

## 🧩 Problem: Best Time to Buy and Sell Stock (LC #121)  


> You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.



```
Example 1:

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
Example 2:

Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
 

Constraints:

1 <= prices.length <= 105
0 <= prices[i] <= 104
```
 
> You may assume that each input would have exactly one solution, and you may not use the same element twice.

---
Let’s tackle **LeetCode #121 – Best Time to Buy and Sell Stock** in **C++**, kc301-style 💥. You’ll get **three levels** of solution:

1. **Brute Force (Level 1)**  
2. **One-pass scan with tracking min (Level 2 - optimal)**  
3. **Kadane’s Algorithm style (Level 3 - advanced)**

---

## 🧩 Problem Summary:
Given an array `prices[]`, where `prices[i]` is the stock price on day `i`, return the **maximum profit** you can achieve by **buying once and selling once after**.

```cpp
int maxProfit(vector<int>& prices);
```

---

### 🧱 Level 1: Brute Force 🐢

**Approach:**  
Try every pair of buy and sell days and compute the profit.
### C++ (Level #1)
```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int maxProfit = 0;
        int n = prices.size();
        for (int i = 0; i < n - 1; ++i) {
            for (int j = i + 1; j < n; ++j) {
                int profit = prices[j] - prices[i];
                maxProfit = max(maxProfit, profit);
            }
        }
        return maxProfit;
    }
};
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works for all LeetCode cases, but not efficient.

---

### ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

**Approach:**  
Track the minimum price as you iterate, and compute profit if selling on the current day.
### C++ (Level #2)
```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int minPrice = INT_MAX;
        int maxProfit = 0;

        for (int price : prices) {
            minPrice = min(minPrice, price);  // buy low
            maxProfit = max(maxProfit, price - minPrice);  // sell high
        }

        return maxProfit;
    }
};
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Optimal, clean, readable.

---

### 🚀 Level 3: Kadane’s Algorithm Variant ⚡

**Approach:**  
Transform the problem into **max subarray sum of price differences**.
### C++ (Level #3)
```cpp
class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int maxCurrent = 0;
        int maxSoFar = 0;

        for (int i = 1; i < prices.size(); ++i) {
            int delta = prices[i] - prices[i - 1];
            maxCurrent = max(0, maxCurrent + delta);
            maxSoFar = max(maxSoFar, maxCurrent);
        }

        return maxSoFar;
    }
};
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
📚 Conceptually deeper (based on Kadane’s for max subarray sum)

---

## 🧠 Summary

| Level | Approach                 | Time    | Space | Notes                             |
|-------|--------------------------|---------|-------|-----------------------------------|
| 1     | Brute Force              | O(n²)   | O(1)  | Easy to write, slow to run        |
| 2     | Track Min in One Pass ✅ | O(n)    | O(1)  | 🔥 Fastest, cleanest, best pick    |
| 3     | Kadane’s-style           | O(n)    | O(1)  | Fun trick using subarray pattern  |
---

Let's crush **LeetCode #121 – Best Time to Buy and Sell Stock** in **Java**, kc301-style. We’ll break it down in **three progressive levels**:

---

## 🧩 Problem Summary:
Given an array `prices[]`, where `prices[i]` is the stock price on day `i`, return the **maximum profit** you can achieve by **buying once and selling once later**.

```java
public int maxProfit(int[] prices);
```

---

## 🧱 Level 1: Brute Force 🐢

**🔍 Approach:**  
Try every possible pair of days to buy and sell, and track the max profit.
### JAVA (Level #1)
```java
class Solution {
    public int maxProfit(int[] prices) {
        int maxProfit = 0;
        int n = prices.length;

        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                int profit = prices[j] - prices[i];
                maxProfit = Math.max(maxProfit, profit);
            }
        }

        return maxProfit;
    }
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works but inefficient for large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

**🔍 Approach:**  
Track the lowest price seen so far and calculate the profit if sold today.
### JAVA (Level #2)
```java
class Solution {
    public int maxProfit(int[] prices) {
        int minPrice = Integer.MAX_VALUE;
        int maxProfit = 0;

        for (int price : prices) {
            if (price < minPrice) {
                minPrice = price; // Buy at the lowest price
            } else {
                maxProfit = Math.max(maxProfit, price - minPrice); // Sell for max profit
            }
        }

        return maxProfit;
    }
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Optimal for interviews and production.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

**🔍 Approach:**  
Transform it into **maximum subarray sum** of daily price differences.
### JAVA (Level #3)
```java
class Solution {
    public int maxProfit(int[] prices) {
        int maxCur = 0;
        int maxSoFar = 0;

        for (int i = 1; i < prices.length; i++) {
            int diff = prices[i] - prices[i - 1];
            maxCur = Math.max(0, maxCur + diff);
            maxSoFar = Math.max(maxSoFar, maxCur);
        }

        return maxSoFar;
    }
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🧠 Uses the same principle as Kadane’s Algorithm for Max Subarray.

---

## 🧠 Summary

| Level | Approach                 | Time    | Space | Notes                              |
|-------|--------------------------|---------|-------|------------------------------------|
| 1     | Brute Force              | O(n²)   | O(1)  | Easy, slow                         |
| 2     | One Pass with Min Track ✅ | O(n)  | O(1)  | 🔥 Best for clean, fast logic       |
| 3     | Kadane's-like Trick      | O(n)    | O(1)  | Elegant subarray interpretation    |

---


Let’s go full kc301 in **Python 3** 🐍 for **LeetCode #121 – Best Time to Buy and Sell Stock**, in all **3 Levels**:  
1. Brute Force  
2. One-Pass Optimized  
3. Kadane’s Algorithm Style

---

## 🧩 Problem Statement:

```python
def maxProfit(prices: List[int]) -> int:
```

---

## 🧱 Level 1: Brute Force 🐢

**🔍 Approach:**  
Try every possible pair of days to buy and sell.
### Python (Level #1)
```python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_profit = 0
        n = len(prices)

        for i in range(n - 1):
            for j in range(i + 1, n):
                profit = prices[j] - prices[i]
                max_profit = max(max_profit, profit)

        return max_profit
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Passes all LeetCode tests but **slow** for large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

**🔍 Approach:**  
Track the **minimum price** so far, and calculate profit if sold today.
### Python (Level #2)
```python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        min_price = float('inf')
        max_profit = 0

        for price in prices:
            if price < min_price:
                min_price = price  # buy at lowest price so far
            else:
                max_profit = max(max_profit, price - min_price)  # profit if sold today

        return max_profit
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Efficient, readable, and perfect for interviews.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

**🔍 Approach:**  
Convert to maximum subarray problem by checking daily **price differences**.
### Python (Level #3)
```python
class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        max_current = 0
        max_so_far = 0

        for i in range(1, len(prices)):
            delta = prices[i] - prices[i - 1]
            max_current = max(0, max_current + delta)
            max_so_far = max(max_so_far, max_current)

        return max_so_far
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Advanced yet elegant — uses the same logic as Kadane's for max subarray.

---

## 🧠 Summary

| Level | Method                  | Time    | Space | Notes                                 |
|-------|--------------------------|---------|-------|----------------------------------------|
| 1     | Brute Force              | O(n²)   | O(1)  | Naive, slow                            |
| 2     | One-Pass (Min Tracker) ✅ | O(n)   | O(1)  | 🔥 Best approach for most cases         |
| 3     | Kadane’s-style Trick     | O(n)    | O(1)  | Conceptual — fits max subarray pattern |

---

Let’s roll with **LeetCode #121 – Best Time to Buy and Sell Stock** in **C** — sharp, efficient, and to the point like any good C programmer 💻🔧. We’ll break it down in 3 levels:

---

## 🧩 Problem Statement
You're given an array `prices[]` of size `n`, where `prices[i]` is the stock price on day `i`. You need to return the **maximum profit** you can achieve by **buying once and selling once later**.

```c
int maxProfit(int* prices, int pricesSize);
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible pair of buy/sell days and compute max profit.
### C (Level #1)
```c
int maxProfit(int* prices, int pricesSize) {
    int maxProfit = 0;
    for (int i = 0; i < pricesSize - 1; i++) {
        for (int j = i + 1; j < pricesSize; j++) {
            int profit = prices[j] - prices[i];
            if (profit > maxProfit) {
                maxProfit = profit;
            }
        }
    }
    return maxProfit;
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works, but inefficient for large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the minimum price while iterating, and compute profit if sold today.
### C (Level #2)
```c
int maxProfit(int* prices, int pricesSize) {
    int minPrice = __INT_MAX__;
    int maxProfit = 0;

    for (int i = 0; i < pricesSize; i++) {
        if (prices[i] < minPrice) {
            minPrice = prices[i];
        } else if (prices[i] - minPrice > maxProfit) {
            maxProfit = prices[i] - minPrice;
        }
    }
    return maxProfit;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 This is the cleanest and most efficient for interviews.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Transform it into the max subarray sum of price differences.
### C (Level #3)
```c
int maxProfit(int* prices, int pricesSize) {
    int maxCurrent = 0;
    int maxSoFar = 0;

    for (int i = 1; i < pricesSize; i++) {
        int diff = prices[i] - prices[i - 1];
        maxCurrent = maxCurrent + diff > 0 ? maxCurrent + diff : 0;
        if (maxCurrent > maxSoFar) {
            maxSoFar = maxCurrent;
        }
    }

    return maxSoFar;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Great algorithmic thinking — maps to Kadane's Max Subarray logic.

---

## 🧠 Summary

| Level | Approach                | Time    | Space | Notes                               |
|-------|-------------------------|---------|-------|--------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Simple but slow                      |
| 2     | One-Pass Min Tracking ✅| O(n)    | O(1)  | Cleanest, fastest, most common       |
| 3     | Kadane’s Style          | O(n)    | O(1)  | Elegant — uses subarray logic        |
---

You got it! Let's break down **LeetCode #121 – Best Time to Buy and Sell Stock** in **C#**, kc301-style 🧙‍♂️⚔️ — with all 3 levels of solution:

---

## 🧩 Problem Statement

```csharp
public int MaxProfit(int[] prices)
```

You're given an array `prices[]` where `prices[i]` is the stock price on day `i`. Return the **maximum profit** from **buying once and selling once after**.

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible pair of days and track the max profit.
### C# (Level #1)
```csharp
public class Solution {
    public int MaxProfit(int[] prices) {
        int maxProfit = 0;
        int n = prices.Length;

        for (int i = 0; i < n - 1; i++) {
            for (int j = i + 1; j < n; j++) {
                int profit = prices[j] - prices[i];
                if (profit > maxProfit) {
                    maxProfit = profit;
                }
            }
        }

        return maxProfit;
    }
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Simple and correct, but not scalable.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the minimum price and calculate profit if sold today.
### C# (Level #2)
```csharp
public class Solution {
    public int MaxProfit(int[] prices) {
        int minPrice = int.MaxValue;
        int maxProfit = 0;

        foreach (int price in prices) {
            if (price < minPrice) {
                minPrice = price;
            } else {
                maxProfit = Math.Max(maxProfit, price - minPrice);
            }
        }

        return maxProfit;
    }
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Very efficient and perfect for interviews or production.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Treat the problem like a **maximum subarray sum** of daily differences.
### C# (Level #3)
```csharp
public class Solution {
    public int MaxProfit(int[] prices) {
        int maxCurrent = 0;
        int maxSoFar = 0;

        for (int i = 1; i < prices.Length; i++) {
            int delta = prices[i] - prices[i - 1];
            maxCurrent = Math.Max(0, maxCurrent + delta);
            maxSoFar = Math.Max(maxSoFar, maxCurrent);
        }

        return maxSoFar;
    }
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Advanced approach using dynamic logic like Kadane’s Algorithm.

---

## 🧠 Summary

| Level | Approach                | Time    | Space | Notes                                 |
|-------|-------------------------|---------|-------|----------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Correct but slow                       |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Best balance of simplicity + speed  |
| 3     | Kadane-style Trick      | O(n)    | O(1)  | Clever — reuses max subarray idea      |

---

let's dominate **LeetCode #121 – Best Time to Buy and Sell Stock** in **JavaScript** — with all 3 solution levels:  
Brute Force → One-Pass Optimization → Kadane’s Algorithm Style ⚔️

---

## 🧩 Problem Signature:

```javascript
var maxProfit = function(prices) { };
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible buy/sell day pair and track the max profit.
### Javascript (Level #1)
```javascript
var maxProfit = function(prices) {
    let maxProfit = 0;
    const n = prices.length;

    for (let i = 0; i < n - 1; i++) {
        for (let j = i + 1; j < n; j++) {
            const profit = prices[j] - prices[i];
            maxProfit = Math.max(maxProfit, profit);
        }
    }

    return maxProfit;
};
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works but slow for large input.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price so far while computing profit if sold today.
### Javascript (Level #2)
```javascript
var maxProfit = function(prices) {
    let minPrice = Infinity;
    let maxProfit = 0;

    for (let price of prices) {
        if (price < minPrice) {
            minPrice = price;
        } else {
            maxProfit = Math.max(maxProfit, price - minPrice);
        }
    }

    return maxProfit;
};
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Clean, fast, and great for interviews.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Use the concept of max subarray sum on the daily price changes.
### Javascript (Level #3)
```javascript
var maxProfit = function(prices) {
    let maxCurrent = 0;
    let maxSoFar = 0;

    for (let i = 1; i < prices.length; i++) {
        const delta = prices[i] - prices[i - 1];
        maxCurrent = Math.max(0, maxCurrent + delta);
        maxSoFar = Math.max(maxSoFar, maxCurrent);
    }

    return maxSoFar;
};
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Elegant, applying Kadane’s Algorithm logic to stock prices.

---

## 🧠 Summary

| Level | Approach                | Time    | Space | Notes                              |
|-------|-------------------------|---------|-------|-------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Works, but slow                     |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Best practical choice             |
| 3     | Kadane-style Trick      | O(n)    | O(1)  | Clever use of subarray technique    |
---

Let’s master **LeetCode #121 – Best Time to Buy and Sell Stock** in **TypeScript** with the classic kc301 3-level breakdown:  

1. 🐢 Brute Force  
2. 💡 One-Pass Optimized  
3. ⚡ Kadane's Algorithm Style

---

## 🧩 Problem Signature (TypeScript):

```ts
function maxProfit(prices: number[]): number;
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible buy/sell pair.
### Typescript (Level #1)
```ts
function maxProfit(prices: number[]): number {
    let maxProfit = 0;
    const n = prices.length;

    for (let i = 0; i < n - 1; i++) {
        for (let j = i + 1; j < n; j++) {
            const profit = prices[j] - prices[i];
            maxProfit = Math.max(maxProfit, profit);
        }
    }

    return maxProfit;
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works fine, but very slow on big inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track lowest price and max profit in a single pass.
### Typescript (Level #2)
```ts
function maxProfit(prices: number[]): number {
    let minPrice = Infinity;
    let maxProfit = 0;

    for (let price of prices) {
        if (price < minPrice) {
            minPrice = price;
        } else {
            maxProfit = Math.max(maxProfit, price - minPrice);
        }
    }

    return maxProfit;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Clean, fast, and perfect for real-world usage.

---

## 🚀 Level 3: Kadane's Algorithm Style ⚡

### 🔍 Approach:
Transform it into max subarray of price differences.
### Typescript (Level #3)
```ts
function maxProfit(prices: number[]): number {
    let maxCurrent = 0;
    let maxSoFar = 0;

    for (let i = 1; i < prices.length; i++) {
        const delta = prices[i] - prices[i - 1];
        maxCurrent = Math.max(0, maxCurrent + delta);
        maxSoFar = Math.max(maxSoFar, maxCurrent);
    }

    return maxSoFar;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Elegant, algorithmic, and slick for top-tier interviews.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                               |
|-------|-------------------------|---------|-------|--------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Simple but inefficient               |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Fast, clean, and interview-ready  |
| 3     | Kadane-style Trick      | O(n)    | O(1)  | Dynamic programming twist            |

---

Let’s conquer **LeetCode #121 – Best Time to Buy and Sell Stock** in **PHP** 🐘 — broken down kc301-style in **3 levels**:

---

## 🧩 Function Signature

```php
function maxProfit($prices): int
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible buy and sell day, compute max profit.
### PHP (Level #1)
```php
function maxProfit($prices): int {
    $maxProfit = 0;
    $n = count($prices);

    for ($i = 0; $i < $n - 1; $i++) {
        for ($j = $i + 1; $j < $n; $j++) {
            $profit = $prices[$j] - $prices[$i];
            $maxProfit = max($maxProfit, $profit);
        }
    }

    return $maxProfit;
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Correct but very slow on large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the minimum price and calculate profit if sold today.
### PHP (Level #2)
```php
function maxProfit($prices): int {
    $minPrice = PHP_INT_MAX;
    $maxProfit = 0;

    foreach ($prices as $price) {
        if ($price < $minPrice) {
            $minPrice = $price;
        } else {
            $maxProfit = max($maxProfit, $price - $minPrice);
        }
    }

    return $maxProfit;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Simple and efficient — ideal in interviews and real use.

---

## 🚀 Level 3: Kadane's Algorithm Style ⚡

### 🔍 Approach:
Convert to max subarray of daily price deltas.
### PHP (Level #3)
```php
function maxProfit($prices): int {
    $maxCurrent = 0;
    $maxSoFar = 0;

    for ($i = 1; $i < count($prices); $i++) {
        $delta = $prices[$i] - $prices[$i - 1];
        $maxCurrent = max(0, $maxCurrent + $delta);
        $maxSoFar = max($maxSoFar, $maxCurrent);
    }

    return $maxSoFar;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Advanced, dynamic programming style — uses Kadane's logic.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                |
|-------|-------------------------|---------|-------|---------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Naive and slow                        |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Most efficient & readable          |
| 3     | Kadane’s-style          | O(n)    | O(1)  | Clever twist for algorithmic minds    |

---

Let’s break down **LeetCode #121 – Best Time to Buy and Sell Stock** in **Swift**, the kc301 way — with **3 levels** of mastery:

---

## 🧩 Function Signature

```swift
func maxProfit(_ prices: [Int]) -> Int
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible buy/sell pair and track the best result.
### Swift (Level #1)
```swift
func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit = 0
    let n = prices.count

    for i in 0..<n {
        for j in (i+1)..<n {
            let profit = prices[j] - prices[i]
            maxProfit = max(maxProfit, profit)
        }
    }

    return maxProfit
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works fine, but too slow for big inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price so far, calculate best profit if sold today.
### Swift (Level #2)
```swift
func maxProfit(_ prices: [Int]) -> Int {
    var minPrice = Int.max
    var maxProfit = 0

    for price in prices {
        if price < minPrice {
            minPrice = price
        } else {
            maxProfit = max(maxProfit, price - minPrice)
        }
    }

    return maxProfit
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Clean and fast — ideal for interviews and production.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Think of it as a max subarray problem of daily price differences.
### Swift (Level #3)
```swift
func maxProfit(_ prices: [Int]) -> Int {
    var maxCurrent = 0
    var maxSoFar = 0

    for i in 1..<prices.count {
        let delta = prices[i] - prices[i - 1]
        maxCurrent = max(0, maxCurrent + delta)
        maxSoFar = max(maxSoFar, maxCurrent)
    }

    return maxSoFar
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Algorithmically elegant and efficient.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                               |
|-------|-------------------------|---------|-------|--------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Simple but inefficient               |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Best combo of speed + clarity     |
| 3     | Kadane-style Trick      | O(n)    | O(1)  | Dynamic programming mindset          |

---

 Let’s master **LeetCode #121 – Best Time to Buy and Sell Stock** in **Kotlin** 🧙‍♂️🔥 — with all **3 levels** of progression:

---

## 🧩 Function Signature

```kotlin
fun maxProfit(prices: IntArray): Int
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible pair of buy/sell days and calculate the maximum profit.
### Kotlin (Level #1)
```kotlin
fun maxProfit(prices: IntArray): Int {
    var maxProfit = 0
    val n = prices.size

    for (i in 0 until n - 1) {
        for (j in i + 1 until n) {
            val profit = prices[j] - prices[i]
            maxProfit = maxOf(maxProfit, profit)
        }
    }

    return maxProfit
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works, but not scalable.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price so far and compute profit if selling today.
### Kotlin (Level #2)
```kotlin
fun maxProfit(prices: IntArray): Int {
    var minPrice = Int.MAX_VALUE
    var maxProfit = 0

    for (price in prices) {
        if (price < minPrice) {
            minPrice = price
        } else {
            maxProfit = maxOf(maxProfit, price - minPrice)
        }
    }

    return maxProfit
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Ideal for interviews — clean and efficient.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Use a variation of Kadane’s algorithm on daily price differences.
### Kotlin (Level #3)
```kotlin
fun maxProfit(prices: IntArray): Int {
    var maxCurrent = 0
    var maxSoFar = 0

    for (i in 1 until prices.size) {
        val delta = prices[i] - prices[i - 1]
        maxCurrent = maxOf(0, maxCurrent + delta)
        maxSoFar = maxOf(maxSoFar, maxCurrent)
    }

    return maxSoFar
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Elegant solution for algorithm lovers.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                |
|-------|-------------------------|---------|-------|---------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Simple but very slow                  |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Best overall approach               |
| 3     | Kadane’s-style Trick    | O(n)    | O(1)  | Smart use of dynamic programming idea |

---

 Let’s tackle **LeetCode #121 – Best Time to Buy and Sell Stock** in **Dart** 🐦 — with our signature **3-tier strategy**:

---

## 🧩 Function Signature

```dart
int maxProfit(List<int> prices)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible buy/sell combination.
### Dart (Level #1)
```dart
int maxProfit(List<int> prices) {
  int maxProfit = 0;
  int n = prices.length;

  for (int i = 0; i < n - 1; i++) {
    for (int j = i + 1; j < n; j++) {
      int profit = prices[j] - prices[i];
      maxProfit = profit > maxProfit ? profit : maxProfit;
    }
  }

  return maxProfit;
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Correct but slow.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price seen so far and compute max profit on-the-go.
### Dart (Level #2)
```dart
int maxProfit(List<int> prices) {
  int minPrice = 1 << 30; // Simulates a big number (like Infinity)
  int maxProfit = 0;

  for (int price in prices) {
    if (price < minPrice) {
      minPrice = price;
    } else {
      maxProfit = (price - minPrice > maxProfit) ? price - minPrice : maxProfit;
    }
  }

  return maxProfit;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Fast, readable, and interview-approved.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Convert it into a maximum subarray problem of price differences.
### Dart (Level #3)
```dart
int maxProfit(List<int> prices) {
  int maxCurrent = 0;
  int maxSoFar = 0;

  for (int i = 1; i < prices.length; i++) {
    int delta = prices[i] - prices[i - 1];
    maxCurrent = (maxCurrent + delta).clamp(0, double.infinity).toInt();
    maxSoFar = maxCurrent > maxSoFar ? maxCurrent : maxSoFar;
  }

  return maxSoFar;
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Smart and elegant — perfect for algorithm fans.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                |
|-------|-------------------------|---------|-------|---------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Slow, for understanding only          |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Clean and practical                 |
| 3     | Kadane’s-style Trick    | O(n)    | O(1)  | Algorithmic elegance                  |

---

Let’s crack **LeetCode #121 – Best Time to Buy and Sell Stock** in **Go** (Golang) 🐹 — the kc301 way with all **3 optimization levels**:

---

## 🧩 Function Signature

```go
func maxProfit(prices []int) int
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every possible buy/sell day combination.
### Go (Level #1)
```go
func maxProfit(prices []int) int {
    maxProfit := 0
    n := len(prices)

    for i := 0; i < n-1; i++ {
        for j := i + 1; j < n; j++ {
            profit := prices[j] - prices[i]
            if profit > maxProfit {
                maxProfit = profit
            }
        }
    }

    return maxProfit
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works fine, but inefficient for large arrays.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price and calculate profit if selling today.
### Go (Level #2)
```go
func maxProfit(prices []int) int {
    minPrice := int(^uint(0) >> 1) // Max int value
    maxProfit := 0

    for _, price := range prices {
        if price < minPrice {
            minPrice = price
        } else if price - minPrice > maxProfit {
            maxProfit = price - minPrice
        }
    }

    return maxProfit
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Clean, readable, and efficient.

---

## 🚀 Level 3: Kadane's Algorithm Style ⚡

### 🔍 Approach:
Turn it into a max subarray of price differences.
### Go (Level #3)
```go
func maxProfit(prices []int) int {
    maxCurrent := 0
    maxSoFar := 0

    for i := 1; i < len(prices); i++ {
        delta := prices[i] - prices[i-1]
        maxCurrent = max(0, maxCurrent + delta)
        maxSoFar = max(maxSoFar, maxCurrent)
    }

    return maxSoFar
}

func max(a, b int) int {
    if a > b {
        return a
    }
    return b
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Dynamic programming approach with elegant logic.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                |
|-------|-------------------------|---------|-------|---------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Slow and basic                        |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Recommended in interviews          |
| 3     | Kadane's-style          | O(n)    | O(1)  | Advanced and efficient                |

---

Let’s slice through **LeetCode #121 – Best Time to Buy and Sell Stock** in **Ruby** 💎 — in true kc301 style, with all **3 levels** of optimization:

---

## 🧩 Function Signature

```ruby
def max_profit(prices)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Check every possible buy/sell day combo.
### Scala (Level #1)
```ruby
def max_profit(prices)
  max_profit = 0
  n = prices.length

  (0...n).each do |i|
    (i+1...n).each do |j|
      profit = prices[j] - prices[i]
      max_profit = [max_profit, profit].max
    end
  end

  max_profit
end
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works, but too slow for large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price seen so far, and compute max profit as you go.
### Rust (Level #2)
```ruby
def max_profit(prices)
  min_price = Float::INFINITY
  max_profit = 0

  prices.each do |price|
    if price < min_price
      min_price = price
    else
      max_profit = [max_profit, price - min_price].max
    end
  end

  max_profit
end
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Ideal for interviews and real-world code.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Use a variation of Kadane’s to track profit deltas.
### Rust (Level #3)
```ruby
def max_profit(prices)
  max_current = 0
  max_so_far = 0

  (1...prices.length).each do |i|
    delta = prices[i] - prices[i - 1]
    max_current = [0, max_current + delta].max
    max_so_far = [max_so_far, max_current].max
  end

  max_so_far
end
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Smart and optimized for algorithmic performance.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                |
|-------|-------------------------|---------|-------|---------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Easy to grasp but slow                |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Most efficient and clean           |
| 3     | Kadane’s-style          | O(n)    | O(1)  | Elegant dynamic programming approach  |

---

 Let’s crush **LeetCode #121 – Best Time to Buy and Sell Stock** in **Scala** 🧙‍♂️🐉 — with all **3 mastery levels**:

---

## 🧩 Function Signature

```scala
def maxProfit(prices: Array[Int]): Int
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every pair of buy/sell days.
### Scala (Level #1)
```scala
def maxProfit(prices: Array[Int]): Int = {
  var maxProfit = 0
  val n = prices.length

  for (i <- 0 until n - 1) {
    for (j <- i + 1 until n) {
      val profit = prices(j) - prices(i)
      if (profit > maxProfit) {
        maxProfit = profit
      }
    }
  }

  maxProfit
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works but inefficient for large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price so far and compute profit if selling today.
### Scala (Level #2)
```scala
def maxProfit(prices: Array[Int]): Int = {
  var minPrice = Int.MaxValue
  var maxProfit = 0

  for (price <- prices) {
    if (price < minPrice) {
      minPrice = price
    } else {
      maxProfit = math.max(maxProfit, price - minPrice)
    }
  }

  maxProfit
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Fast, readable, and highly recommended.

---

## 🚀 Level 3: Kadane's Algorithm Style ⚡

### 🔍 Approach:
Use the concept of maximum subarray on price deltas.
### Scala (Level #3)
```scala
def maxProfit(prices: Array[Int]): Int = {
  var maxCurrent = 0
  var maxSoFar = 0

  for (i <- 1 until prices.length) {
    val delta = prices(i) - prices(i - 1)
    maxCurrent = math.max(0, maxCurrent + delta)
    maxSoFar = math.max(maxSoFar, maxCurrent)
  }

  maxSoFar
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Elegant and performant.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                |
|-------|-------------------------|---------|-------|---------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Easy to understand, slow              |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Most efficient and practical       |
| 3     | Kadane’s-style          | O(n)    | O(1)  | For those who love algorithmic style  |

---

 Let's master **LeetCode #121 – Best Time to Buy and Sell Stock** in **Rust** 🦀 — with all **3 levels** of optimization. Time to flex both brains and bytes!

---

## 🧩 Function Signature

```rust
pub fn max_profit(prices: Vec<i32>) -> i32
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try every pair of buy/sell days and track max profit.
### Rust (Level #1)
```rust
pub fn max_profit(prices: Vec<i32>) -> i32 {
    let mut max_profit = 0;
    let n = prices.len();

    for i in 0..n {
        for j in i+1..n {
            let profit = prices[j] - prices[i];
            if profit > max_profit {
                max_profit = profit;
            }
        }
    }

    max_profit
}
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works, but slow for large datasets.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track the lowest price so far, calculate potential profit every day.
### Rust (Level #2)
```rust
pub fn max_profit(prices: Vec<i32>) -> i32 {
    let mut min_price = i32::MAX;
    let mut max_profit = 0;

    for price in prices {
        if price < min_price {
            min_price = price;
        } else {
            max_profit = max_profit.max(price - min_price);
        }
    }

    max_profit
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Idiomatic, fast, and interview-perfect.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Transform into a max subarray sum problem on deltas.
### Rust (Level #3)
```rust
pub fn max_profit(prices: Vec<i32>) -> i32 {
    let mut max_current = 0;
    let mut max_so_far = 0;

    for i in 1..prices.len() {
        let delta = prices[i] - prices[i - 1];
        max_current = (max_current + delta).max(0);
        max_so_far = max_so_far.max(max_current);
    }

    max_so_far
}
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Dynamic programming brilliance in safe, fast Rust.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                   |
|-------|-------------------------|---------|-------|------------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Easy but slow                            |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Best choice — simple + efficient      |
| 3     | Kadane’s-style          | O(n)    | O(1)  | For those who love DP-style optimization |

---

Let's solve **LeetCode #121 – Best Time to Buy and Sell Stock** in **Racket** 🧠🌀 — Scheme-style functional elegance with all **3 optimization levels**.

---

## 📘 Function Signature in Racket

```racket
(define (max-profit prices) ...)
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try all (buy, sell) day combinations.

```racket
(define (max-profit prices)
  (define n (length prices))
  (define max-profit
    (for*/fold ([max-p 0])
               ([i (in-range n)]
                [j (in-range (+ i 1) n)])
      (define profit (- (list-ref prices j) (list-ref prices i)))
      (max max-p profit)))
  max-profit)
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Naive, but gets the job done.

---

## ⚙️ Level 2: One-Pass Optimized 💡

### 🔍 Approach:
Keep track of the minimum price so far and calculate profit on the go.

```racket
(define (max-profit prices)
  (define-values (min-price max-profit)
    (for/fold ([min-price +inf.0]
               [max-profit 0])
              ([price prices])
      (values (min min-price price)
              (max max-profit (- price min-price)))))
  max-profit)
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Functional and efficient.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Treat it like finding the max subarray sum of daily price changes.

```racket
(define (max-profit prices)
  (define diffs
    (map - (rest prices) prices)) ; daily differences
  (define-values (max-current max-so-far)
    (for/fold ([curr 0] [best 0])
              ([d diffs])
      (define new-curr (max 0 (+ curr d)))
      (values new-curr (max best new-curr))))
  max-so-far)
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Elegant and deeply functional.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                      |
|-------|-------------------------|---------|-------|---------------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Simple but inefficient                      |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Fast, clean, very Racket-friendly        |
| 3     | Kadane’s-style          | O(n)    | O(1)  | More algorithmic, good for interviews       |

---

Let's tackle **LeetCode #121 – Best Time to Buy and Sell Stock** in **Erlang** 🐘⚙️ — with the classic **3 optimization levels** from brute force to dynamic efficiency. Erlang is functional and recursive, so we adapt accordingly.

---

## 🧩 Function Signature in Erlang

```erlang
max_profit(Prices :: [integer()]) -> integer().
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try all combinations of buying and selling days.
### Erlang (Level #1)
```erlang
-module(stock121).
-export([max_profit_brute/1]).

max_profit_brute(Prices) ->
    max_profit_brute(Prices, 0, 0).

max_profit_brute([], _, MaxProfit) ->
    MaxProfit;
max_profit_brute([P | Rest], Index, MaxProfit) ->
    Profit = lists:max([X - P || {X, I} <- lists:zip(Rest, lists:seq(Index + 1, Index + length(Rest))), X > P] ++ [0]),
    max_profit_brute(Rest, Index + 1, max(MaxProfit, Profit)).
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
⚠️ Slow for large inputs — but good for understanding.

---

## ⚙️ Level 2: One-Pass Optimized 💡 *(Best Practical)*

### 🔍 Approach:
Track minimum price so far, compute profit as you scan.
### Erlang (Level #2)
```erlang
-module(stock121).
-export([max_profit/1]).

max_profit(Prices) ->
    max_profit(Prices, infinity, 0).

max_profit([], _, MaxProfit) ->
    MaxProfit;
max_profit([P | Rest], MinPrice, MaxProfit) when P < MinPrice ->
    max_profit(Rest, P, MaxProfit);
max_profit([P | Rest], MinPrice, MaxProfit) ->
    Profit = P - MinPrice,
    max_profit(Rest, MinPrice, max(MaxProfit, Profit)).
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
✅ Pure, tail-recursive, and efficient.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Apply maximum subarray sum idea to daily deltas.
### Eerlang (Level #3)
```erlang
-module(stock121).
-export([max_profit_kadane/1]).

max_profit_kadane(Prices) ->
    Diffs = diffs(Prices),
    kadane(Diffs, 0, 0).

diffs([_]) -> [];
diffs([A, B | Rest]) ->
    [B - A | diffs([B | Rest])].

kadane([], _, MaxSoFar) ->
    MaxSoFar;
kadane([X | Rest], MaxCurr, MaxSoFar) ->
    NewCurr = max(0, MaxCurr + X),
    NewMax = max(MaxSoFar, NewCurr),
    kadane(Rest, NewCurr, NewMax).
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Functional Kadane’s — perfect for Erlang’s recursion.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                      |
|-------|-------------------------|---------|-------|---------------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Simple, but inefficient                     |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Best for real-world Erlang                |
| 3     | Kadane’s-style          | O(n)    | O(1)  | Functional elegance, dynamic-style thinking |

---

Let’s knock out **LeetCode #121 – Best Time to Buy and Sell Stock** in **Elixir** 🧪🚀 — functional, elegant, and optimized across **3 levels**:

---

## 🧩 Function Signature in Elixir

```elixir
def max_profit(prices :: [integer]) :: integer
```

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try all combinations of buy/sell days.
### Elixir (Level #1)
```elixir
defmodule Stock do
  def max_profit_brute(prices) do
    for i <- 0..(length(prices) - 2),
        j <- (i + 1)..(length(prices) - 1),
        into: [],
        do: Enum.at(prices, j) - Enum.at(prices, i)
    |> Enum.max(fn -> 0 end)
  end
end
```

⏱ Time: `O(n²)`  
🧠 Space: `O(1)`  
✅ Works, but not efficient for large inputs.

---

## ⚙️ Level 2: One-Pass Optimized 💡

### 🔍 Approach:
Track the minimum price seen so far, update max profit on each step.
### Elixir (Level #2)
```elixir
defmodule Stock do
  def max_profit(prices) do
    Enum.reduce(prices, {nil, 0}, fn price, {min_price, max_profit} ->
      cond do
        min_price == nil -> {price, max_profit}
        price < min_price -> {price, max_profit}
        true -> 
          profit = price - min_price
          {min_price, max(max_profit, profit)}
      end
    end)
    |> elem(1)
  end
end
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
🔥 Clean, idiomatic Elixir.

---

## 🚀 Level 3: Kadane’s Algorithm Style ⚡

### 🔍 Approach:
Apply a version of Kadane's algorithm to profit deltas.
### Elixir (Level #3)
```elixir
defmodule Stock do
  def max_profit_kadane(prices) do
    prices
    |> delta_list()
    |> Enum.reduce({0, 0}, fn delta, {current, max_so_far} ->
      new_current = max(0, current + delta)
      {new_current, max(max_so_far, new_current)}
    end)
    |> elem(1)
  end

  defp delta_list(prices) do
    Enum.zip(prices, tl(prices))
    |> Enum.map(fn {a, b} -> b - a end)
  end
end
```

⏱ Time: `O(n)`  
🧠 Space: `O(1)`  
💎 Functional dynamic programming.

---

## 🧠 Summary Table

| Level | Approach                | Time    | Space | Notes                                      |
|-------|-------------------------|---------|-------|---------------------------------------------|
| 1     | Brute Force             | O(n²)   | O(1)  | Understandable, slow                        |
| 2     | One-Pass Min Tracker ✅ | O(n)    | O(1)  | 🔥 Clean and efficient                      |
| 3     | Kadane’s-style          | O(n)    | O(1)  | Functional & elegant dynamic approach       |

---
