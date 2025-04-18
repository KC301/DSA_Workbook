def twoSum(nums: Array[Int], target: Int): Array[Int] = {
  val indexed = nums.zipWithIndex.sortBy(_._1)

  var left = 0
  var right = nums.length - 1

  while (left < right) {
    val sum = indexed(left)._1 + indexed(right)._1
    if (sum == target) {
      return Array(indexed(left)._2, indexed(right)._2)
    } else if (sum < target) {
      left += 1
    } else {
      right -= 1
    }
  }

  Array()
}