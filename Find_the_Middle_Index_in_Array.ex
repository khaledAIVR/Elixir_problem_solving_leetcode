# Problem_link: https://leetcode.com/problems/find-the-middle-index-in-array/
defmodule Solution do
  @spec find_middle_index(nums :: [integer]) :: integer
  def find_middle_index(nums) do
    sum = Enum.sum(nums)
    length = Enum.count(nums)

    ans =
      nums
      |> Stream.with_index()
      |> Enum.reduce_while(0, fn {v, k}, acc ->
        rhs = sum - acc - v
        lhs = acc

        if lhs == rhs do
          {:halt, k}
        else
          if(k == length - 1) do
            {:halt, -1}
          else
            {:cont, acc + v}
          end
        end
      end)
  end
end
