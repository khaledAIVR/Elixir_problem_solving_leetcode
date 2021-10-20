# Problem_link: https://leetcode.com/problems/concatenation-of-array/

defmodule Solution do
  @spec get_concatenation(nums :: [integer]) :: [integer]
  def get_concatenation(nums) do
    nums_len = length(nums)
    ans_len = nums_len * 2

    Enum.map(1..ans_len, &Enum.at(nums, get_actual_index(&1 - 1, nums_len)))
  end

  def get_actual_index(ans_index, nums_len) when ans_index >= nums_len do
    rem(ans_index, nums_len)
  end

  def get_actual_index(ans_index, nums_len) when ans_index < nums_len do
    ans_index
  end
end

# another solution:
# defmodule Solution do
#   @spec get_concatenation(nums :: [integer]) :: [integer]
#   def get_concatenation(nums) do
#     nums ++ nums
#   end
# end
