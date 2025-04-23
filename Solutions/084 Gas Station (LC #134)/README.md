
---

# ➕ Problem: Gas Station

## 📘 Problem Statement

> There are `n` gas stations along a circular route, where the `i`-th gas station has `gas[i]` amount of gas.  
> You have a car with an empty gas tank. The car starts at one of the gas stations and can travel clockwise around the circuit once.  
> You need to determine if you can travel around the circuit once without running out of gas.  
> If you can, return the starting gas station index; otherwise, return `-1`.

> Note:
> - If there is a solution, it is guaranteed to be unique.
> - You cannot travel the circuit if there’s no starting point that allows you to complete the circuit.

**LeetCode Link:** [134. Gas Station](https://leetcode.com/problems/gas-station/)

---

```
Example 1:

Input: gas = [1,2,3,4,5], cost = [3,4,5,1,2]
Output: 3
Explanation: Starting from index 3, we can travel around the circuit once.

Example 2:

Input: gas = [2,3,4], cost = [3,4,3]
Output: -1
Explanation: There is no way to travel around the circuit.

```

---

## ✅ Constraints

- `n == gas.length == cost.length`
- `1 <= n <= 10⁵`
- `0 <= gas[i], cost[i] <= 10⁴`

---

## 🧠 Python Solutions

---

### 🧪 Level 1: Brute Force (Try Every Starting Point)

**Approach:**  
The brute-force approach checks each gas station as a potential starting point. For each starting point, we simulate traveling around the circuit, checking if it is possible to complete the loop. This is inefficient because we may check many invalid starting points.

```python
# Time Complexity: O(n^2)
# Space Complexity: O(1)
def canCompleteCircuit(gas, cost):
    n = len(gas)
    for start in range(n):
        fuel = 0
        for i in range(n):
            curr = (start + i) % n
            fuel += gas[curr] - cost[curr]
            if fuel < 0:
                break
        if fuel >= 0:
            return start
    return -1
```

---

### ⚙️ Level 2: Greedy Approach (Total Gas Check + One Pass)

**Approach:**  
This approach first checks if the total gas is greater than or equal to the total cost. If it is, we then attempt to find a valid starting point using a greedy strategy. The algorithm checks if the current station is a valid starting point by tracking the accumulated fuel while traveling the circuit. If we run out of fuel at any point, we move the starting point to the next station and continue.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def canCompleteCircuit(gas, cost):
    total_gas, total_cost, current_gas, start = 0, 0, 0, 0
    for i in range(len(gas)):
        total_gas += gas[i]
        total_cost += cost[i]
        current_gas += gas[i] - cost[i]
        
        if current_gas < 0:
            start = i + 1
            current_gas = 0
    
    return start if total_gas >= total_cost else -1
```

---

### 🚀 Level 3: Optimized Greedy (Early Return)

**Approach:**  
This approach builds on Level 2 but includes an early return if a valid starting point is found. The loop terminates immediately after finding the valid start, and the solution is returned in constant time.

```python
# Time Complexity: O(n)
# Space Complexity: O(1)
def canCompleteCircuit(gas, cost):
    total_gas, total_cost, current_gas, start = 0, 0, 0, 0
    for i in range(len(gas)):
        total_gas += gas[i]
        total_cost += cost[i]
        current_gas += gas[i] - cost[i]
        
        if current_gas < 0:
            start = i + 1
            current_gas = 0
            
    if total_gas >= total_cost:
        return start
    return -1
```

---

## ⏱️ Complexity Comparison Table

| Level | Approach                              | Time Complexity | Space Complexity |
|-------|---------------------------------------|-----------------|------------------|
| 1     | Brute Force (Try Every Starting Point)| O(n^2)          | O(1)             |
| 2     | Greedy Approach (Total Gas Check + One Pass) | O(n)         | O(1)             |
| 3     | Optimized Greedy (Early Return)      | O(n)            | O(1)             |

---

## 🔗 Similar Problems

1. [55. Jump Game](https://leetcode.com/problems/jump-game/)
2. [45. Jump Game II](https://leetcode.com/problems/jump-game-ii/)
3. [1476. Subrectangle Queries](https://leetcode.com/problems/subrectangle-queries/)

---

## 📌 Takeaway Points

- **Brute force** is inefficient, requiring **O(n^2)** time and is impractical for large inputs.
- The **greedy approach** significantly optimizes the solution by reducing the time complexity to **O(n)** and using **O(1)** space.
- **Early return** helps in minimizing unnecessary checks and improving the performance further.

---
