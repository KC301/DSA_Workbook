def twoSum(nums: Array[Int], target: Int): Array[Int] = {
  val seen = scala.collection.mutable.Map[Int, Int]()

  for (i <- nums.indices) {
    val complement = target - nums(i)
    if (seen.contains(complement)) {
      return Array(seen(complement), i)
    }
    seen(nums(i)) = i
  }

  Array()
}