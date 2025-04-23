
---

# ➕ Problem: Coin Change

## 📘 Problem Statement

> You are given an integer array `coins` representing coins of different denominations and an integer `amount` representing a total amount of money.  
> You want to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return `-1`.

**LeetCode Link:** [322. Coin Change](https://leetcode.com/problems/coin-change/)

---

```
Example 1:

Input: coins = [1, 2, 5], amount = 11
Output: 3
Explanation: The fewest coins that make up 11 are [5, 5, 1].

Example 2:

Input: coins = [2], amount = 3
Output: -1
Explanation: The amount 3 cannot be made up by any combination of 2.
```

---

## ✅ Constraints

- `1 <= coins.length <= 12`
- `1 <= coins[i] <= 2 * 10⁴`
- `1 <= amount <= 500`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force Recursion

**Approach:**  
The brute force approach is to recursively check for every combination of coins and return the minimum number of coins that add up to the target amount.

```python
# Time Complexity: O(2^amount) due to the exponential branching
# Space Complexity: O(amount) due to the recursion stack
def coinChange(coins, amount):
    def dfs(amount):
        if amount == 0:
            return 0
        if amount < 0:
            return -1
        min_coins = float('inf')
        for coin in coins:
            res = dfs(amount - coin)
            if res >= 0:
                min_coins = min(min_coins, res + 1)
        return min_coins if min_coins != float('inf') else -1

    return dfs(amount)
```

---

### ⚙️ Level 2: Dynamic Programming with Memoization

**Approach:**  
We use **memoization** to store the minimum number of coins needed for each subproblem to avoid redundant calculations.

```python
# Time Complexity: O(amount * len(coins))
# Space Complexity: O(amount) due to the memoization table
def coinChange(coins, amount):
    memo = {}
    
    def dfs(amount):
        if amount == 0:
            return 0
        if amount < 0:
            return -1
        if amount in memo:
            return memo[amount]
        min_coins = float('inf')
        for coin in coins:
            res = dfs(amount - coin)
            if res >= 0:
                min_coins = min(min_coins, res + 1)
        memo[amount] = min_coins if min_coins != float('inf') else -1
        return memo[amount]

    return dfs(amount)
```

---

### 🚀 Level 3: Dynamic Programming (Tabulation)

**Approach:**  
This approach uses a **bottom-up dynamic programming** approach where we iteratively calculate the minimum number of coins required for all amounts from `0` to `amount`.

```python
# Time Complexity: O(amount * len(coins))
# Space Complexity: O(amount) due to the dp array
def coinChange(coins, amount):
    dp = [float('inf')] * (amount + 1)
    dp[0] = 0  # Base case: 0 coins needed to make amount 0
    
    for i in range(1, amount + 1):
        for coin in coins:
            if i - coin >= 0:
                dp[i] = min(dp[i], dp[i - coin] + 1)

    return dp[amount] if dp[amount] != float('inf') else -1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                             | Time Complexity | Space Complexity |
|-------|--------------------------------------|-----------------|------------------|
| 1     | Brute Force Recursion               | O(2^amount)     | O(amount)        |
| 2     | Dynamic Programming (Memoization)    | O(amount * len(coins)) | O(amount)        |
| 3     | Dynamic Programming (Tabulation)     | O(amount * len(coins)) | O(amount)        |

---

## 🔗 Similar Problems

1. [518. Coin Change II](https://leetcode.com/problems/coin-change-ii/)
2. [322. Coin Change (Optimized)](https://leetcode.com/problems/coin-change/)
3. [322. Coin Change Problem (Extended)](https://leetcode.com/problems/coin-change/)

---

## 📌 Takeaway Points

- The brute force approach works but is inefficient for larger inputs due to its exponential time complexity.
- Memoization can significantly improve the recursive solution by avoiding redundant calculations.
- The tabulation approach is the most efficient and practical, using dynamic programming to iteratively calculate the minimum coins needed.

---