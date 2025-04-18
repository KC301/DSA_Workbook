function twoSum(nums: number[], target: number): number[] {
    const seen = new Map<number, number>();
  
    for (let i = 0; i < nums.length; i++) {
      const complement = target - nums[i];
      if (seen.has(complement)) {
        return [seen.get(complement)!, i]; // `!` because we know it's there
      }
      seen.set(nums[i], i);
    }
  
    return [];
  }