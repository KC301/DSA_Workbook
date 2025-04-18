defmodule TwoSum do
  def two_sum(nums, target) do
    two_sum_map(nums, target, %{}, 0)
  end

  defp two_sum_map([], _target, _map, _idx), do: []

  defp two_sum_map([h | t], target, map, idx) do
    complement = target - h

    case Map.get(map, complement) do
      nil ->
        two_sum_map(t, target, Map.put(map, h, idx), idx + 1)

      found_idx ->
        [found_idx, idx]
    end
  end
end