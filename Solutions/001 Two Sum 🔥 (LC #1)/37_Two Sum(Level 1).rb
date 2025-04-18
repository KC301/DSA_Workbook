def two_sum(nums, target)
    nums.each_with_index do |num1, i|
      (i+1...nums.size).each do |j|
        return [i, j] if num1 + nums[j] == target
      end
    end
    []
  end