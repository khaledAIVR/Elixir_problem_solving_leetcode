# Problem_Link: https://leetcode.com/problems/build-array-from-permutation/
defmodule Solution do
  @spec build_array(nums :: [integer]) :: [integer]
  def build_array(nums) do
    ans = Enum.map(nums, &Enum.at(nums, &1))
  end
end
