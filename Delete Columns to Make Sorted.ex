# Problem_link: https://leetcode.com/problems/delete-columns-to-make-sorted/

defmodule Solution do
  @spec min_deletion_size(strs :: [String.t()]) :: integer
  def min_deletion_size(strs) do
    strs
    |> Enum.map(fn x -> String.to_charlist(x) end)
    |> Enum.zip_with(& &1)
    |> Enum.reduce(0, fn char_list_column, acc ->
      if sorted_charlist?(char_list_column) == false do
        acc + 1
      else
        acc
      end
    end)
  end

  def sorted_charlist?(chr_lst) do
    res =
      Enum.reduce_while(chr_lst, 0, fn char, acc ->
        cond do
          acc == 0 -> {:cont, char}
          char >= acc -> {:cont, char}
          char < acc -> {:halt, false}
        end
      end)

    if res != false do
      true
    else
      false
    end
  end
end
