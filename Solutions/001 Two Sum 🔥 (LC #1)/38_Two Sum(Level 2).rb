def two_sum(nums, target)
    indexed = nums.each_with_index.map { |val, idx| [val, idx] }
    sorted = indexed.sort_by { |val, _| val }
  
    left = 0
    right = sorted.size - 1
  
    while left < right
      sum = sorted[left][0] + sorted[right][0]
      if sum == target
        return [sorted[left][1], sorted[right][1]]
      elsif sum < target
        left += 1
      else
        right -= 1
      end
    end
  
    []
  end  