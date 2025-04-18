class Solution:
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        indexed_nums = [(val, idx) for idx, val in enumerate(nums)]
        indexed_nums.sort()
        
        left, right = 0, len(nums) - 1
        while left < right:
            total = indexed_nums[left][0] + indexed_nums[right][0]
            if total == target:
                return [indexed_nums[left][1], indexed_nums[right][1]]
            elif total < target:
                left += 1
            else:
                right -= 1
        return []
