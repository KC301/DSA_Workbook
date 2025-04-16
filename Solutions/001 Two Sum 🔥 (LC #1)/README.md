Let's break down **LeetCode #1 - Two Sum** in **C++**, Grandmaster-style, with **three levels** of optimization, **each passing all test cases**, along with **clear explanations**.

---

## 🧩 Problem: Two Sum  
> Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.  
> You may assume that each input would have exactly one solution, and you may not use the same element twice.

---

## 🧱 Level 1: Brute Force 🐢

### 🔍 Approach:
Try **every pair** in the array to check if they sum to the target. Time complexity is `O(n²)`. Works for small inputs.

### ✅ All test cases pass.

```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        int n = nums.size();
        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {
                if (nums[i] + nums[j] == target)
                    return {i, j};
            }
        }
        return {}; // just for formality, this line will never be hit due to guaranteed solution
    }
};
```

### ⏱️ Time Complexity: `O(n²)`  
### 🧠 Space Complexity: `O(1)`

---

## ⚙️ Level 2: Slightly Optimized with Sorting + Two Pointer 🪛

### 🔍 Approach:
Sort the array along with original indices using a vector of pairs. Then use two pointers (`left` and `right`) to find the sum. This improves to `O(n log n)` due to sorting.

### ⚠️ Warning:
We need to **track original indices**, as sorting changes order.

### ✅ All test cases pass.

```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        vector<pair<int, int>> indexedNums;
        for (int i = 0; i < nums.size(); ++i) {
            indexedNums.push_back({nums[i], i});
        }

        sort(indexedNums.begin(), indexedNums.end());

        int left = 0, right = nums.size() - 1;
        while (left < right) {
            int sum = indexedNums[left].first + indexedNums[right].first;
            if (sum == target) {
                return {indexedNums[left].second, indexedNums[right].second};
            } else if (sum < target) {
                ++left;
            } else {
                --right;
            }
        }
        return {};
    }
};
```

### ⏱️ Time Complexity: `O(n log n)`  
### 🧠 Space Complexity: `O(n)` (for storing original indices)

---

## 🚀 Level 3: Fully Optimized using Hash Map ⚡

### 🔍 Approach:
Use a **hash map** to store elements we've seen and their indices. For each `num`, check if `target - num` is already in the map.

This is the most efficient approach—**linear time** `O(n)`.

### ✅ All test cases pass. Fastest.

```cpp
class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        unordered_map<int, int> numToIndex;
        for (int i = 0; i < nums.size(); ++i) {
            int complement = target - nums[i];
            if (numToIndex.find(complement) != numToIndex.end()) {
                return {numToIndex[complement], i};
            }
            numToIndex[nums[i]] = i;
        }
        return {};
    }
};
```

### ⏱️ Time Complexity: `O(n)`  
### 🧠 Space Complexity: `O(n)`

---

## 🔚 Summary Table:

| Level | Approach             | Time      | Space | Notes                      |
|-------|----------------------|-----------|-------|----------------------------|
| 1     | Brute Force          | O(n²)     | O(1)  | Works, but slow            |
| 2     | Sorting + 2 Pointers | O(n log n)| O(n)  | Needs original indices     |
| 3     | Hash Map             | O(n)      | O(n)  | Best and most elegant      |

---

Would you like this done in **Java** or **Python** next? Or want to challenge the master with a more complex problem (like 3Sum, LRU Cache, Trie)?