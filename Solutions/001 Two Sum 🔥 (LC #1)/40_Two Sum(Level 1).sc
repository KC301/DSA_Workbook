def twoSum(nums: Array[Int], target: Int): Array[Int] = {
  for (i <- nums.indices) {
    for (j <- (i + 1) until nums.length) {
      if (nums(i) + nums(j) == target)
        return Array(i, j)
    }
  }
  Array()
}