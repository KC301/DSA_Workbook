List<int> twoSum(List<int> nums, int target) {
  List<MapEntry<int, int>> indexed = nums
      .asMap()
      .entries
      .toList(); // [MapEntry(index, value)]

  indexed.sort((a, b) => a.value.compareTo(b.value));

  int left = 0;
  int right = nums.length - 1;

  while (left < right) {
    int sum = indexed[left].value + indexed[right].value;
    if (sum == target) {
      return [indexed[left].key, indexed[right].key];
    } else if (sum < target) {
      left++;
    } else {
      right--;
    }
  }

  return [];
}