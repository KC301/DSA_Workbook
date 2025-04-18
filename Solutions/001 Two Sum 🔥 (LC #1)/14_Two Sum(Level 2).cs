public class Solution {
    public int[] TwoSum(int[] nums, int target) {
        int n = nums.Length;
        var indexedNums = nums
            .Select((val, idx) => new { Value = val, Index = idx })
            .OrderBy(x => x.Value)
            .ToList();

        int left = 0, right = n - 1;

        while (left < right) {
            int sum = indexedNums[left].Value + indexedNums[right].Value;
            if (sum == target) {
                return new int[] { indexedNums[left].Index, indexedNums[right].Index };
            } else if (sum < target) {
                left++;
            } else {
                right--;
            }
        }
        return new int[] { };
    }
}