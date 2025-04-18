function twoSum(nums, target) {
    const indexedNums = nums.map((val, idx) => ({ val, idx }));
    indexedNums.sort((a, b) => a.val - b.val);
  
    let left = 0;
    let right = nums.length - 1;
  
    while (left < right) {
      const sum = indexedNums[left].val + indexedNums[right].val;
      if (sum === target) {
        return [indexedNums[left].idx, indexedNums[right].idx];
      } else if (sum < target) {
        left++;
      } else {
        right--;
      }
    }
  
    return [];
  }