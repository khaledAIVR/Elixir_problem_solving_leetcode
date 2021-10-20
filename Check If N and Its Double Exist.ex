# Problem_link: https://leetcode.com/problems/check-if-n-and-its-double-exist/
defmodule Solution do
  @spec check_if_exist(arr :: [integer]) :: boolean
  def check_if_exist(arr) do
    zero_counter =
      Enum.reduce(arr, 0, fn x, acc ->
        if x == 0 do
          acc + 1
        else
          acc
        end
      end)

    if zero_counter > 1 do
      true
    else
      arr_set = MapSet.new(arr)

      arr_set
      |> Enum.reduce_while(false, fn x, _ ->
        res =
          Enum.find(arr_set, nil, fn y ->
            (x == y * 2 and x != y) or (x * 2 == y and x != y)
          end)

        if res == nil do
          {:cont, false}
        else
          {:halt, true}
        end
      end)
    end
  end
end
