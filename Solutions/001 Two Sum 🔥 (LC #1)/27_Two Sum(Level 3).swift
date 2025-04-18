func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var seen: [Int: Int] = [:]
    
    for (i, num) in nums.enumerated() {
        let complement = target - num
        if let matchIndex = seen[complement] {
            return [matchIndex, i]
        }
        seen[num] = i
    }
    
    return []
}