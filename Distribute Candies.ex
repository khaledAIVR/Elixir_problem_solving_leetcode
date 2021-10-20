# Problrm_link: https://leetcode.com/problems/distribute-candies/
defmodule Solution do
  @spec distribute_candies(candy_type :: [integer]) :: integer
  def distribute_candies(candy_types) do
    types = candy_types |> MapSet.new() |> Enum.count()

    candy_types_len = Enum.count(candy_types)
    permitted_num_of_candies = div(candy_types_len, 2)

    if permitted_num_of_candies > types do
      types
    else
      permitted_num_of_candies
    end
  end
end
