# Problem_link: https://leetcode.com/problems/relative-sort-array/
defmodule Solution do
  @spec relative_sort_array(arr1 :: [integer], arr2 :: [integer]) :: [integer]
  def relative_sort_array(arr1, arr2) do
    arr2
    |> convert_to_map()
    |> map_counting(arr1, arr2)
    |> sort_array(arr2)
  end

  def convert_to_map(arr2) do
    arr2
    |> Enum.chunk_every(1)
    |> Map.new(fn [x] -> {x, 0} end)
    |> Map.put("Rest", [])
  end

  def map_counting(arr2_map, arr1, arr2) do
    arr1
    |> Enum.reduce(arr2_map, fn x, acc ->
      if Enum.member?(arr2, x) == true do
        Map.put(acc, x, acc[x] + 1)
      else
        Map.put(acc, "Rest", [x | acc["Rest"]])
      end
    end)
  end

  def sort_array(map_res, arr2) do
    sorted_rest_list = map_res["Rest"] |> Enum.sort()

    sorted_list_without_rest =
      Enum.reduce(arr2, [], fn x, acc ->
        if x != "Rest" do
          acc ++ List.duplicate(x, map_res[x])
        else
          acc
        end
      end)

    sorted_list_without_rest ++ sorted_rest_list
  end
end
