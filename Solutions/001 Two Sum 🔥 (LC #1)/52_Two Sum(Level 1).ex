defmodule TwoSum do
  def two_sum(nums, target) do
    Enum.with_index(nums)
    |> Enum.reduce_while([], fn {num1, i}, acc ->
      case Enum.find_index(Enum.slice(nums, i + 1..-1), fn num2 -> num1 + num2 == target end) do
        nil -> {:cont, acc}
        j -> {:halt, [i, i + 1 + j]}
      end
    end)
  end
end