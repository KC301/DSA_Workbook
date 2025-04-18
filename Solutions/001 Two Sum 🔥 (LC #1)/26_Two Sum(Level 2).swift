func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let indexed = nums.enumerated().map { (index, value) in (index, value) }
    let sorted = indexed.sorted { $0.1 < $1.1 }
    
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let sum = sorted[left].1 + sorted[right].1
        if sum == target {
            return [sorted[left].0, sorted[right].0]
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    return []
}