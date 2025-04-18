fun twoSum(nums: IntArray, target: Int): IntArray {
    val indexed = nums.mapIndexed { index, value -> index to value }
        .sortedBy { it.second }

    var left = 0
    var right = nums.size - 1

    while (left < right) {
        val sum = indexed[left].second + indexed[right].second
        when {
            sum == target -> return intArrayOf(indexed[left].first, indexed[right].first)
            sum < target -> left++
            else -> right--
        }
    }

    return intArrayOf()
}