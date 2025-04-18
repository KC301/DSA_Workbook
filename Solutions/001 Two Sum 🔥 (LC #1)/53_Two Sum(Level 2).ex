defmodule TwoSum do
  def two_sum(nums, target) do
    indexed = Enum.with_index(nums)
    sorted = Enum.sort_by(indexed, fn {val, _} -> val end)

    two_pointer(sorted, target, 0, length(nums) - 1)
  end

  defp two_pointer(list, target, left, right) when left < right do
    {val_l, idx_l} = Enum.at(list, left)
    {val_r, idx_r} = Enum.at(list, right)
    sum = val_l + val_r

    cond do
      sum == target -> [idx_l, idx_r]
      sum < target -> two_pointer(list, target, left + 1, right)
      true -> two_pointer(list, target, left, right - 1)
    end
  end

  defp two_pointer(_, _, _, _), do: []
end