# Problem_link: https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/

defmodule Solution do
  @spec count_negatives(grid :: [[integer]]) :: integer
  def count_row(grid, row_index, m, n) do
    starting_index = row_index + 1
    row = Enum.at(grid, row_index)

    result =
      Enum.reduce_while(starting_index..(n - 1), 0, fn i, _ ->
        x = Enum.at(row, i)

        if x < 0 do
          {:halt, n - i}
        else
          {:cont, 0}
        end
      end)
  end

  def count_column(grid, column_index, m, n) do
    starting_index = column_index + 1

    Enum.reduce_while(starting_index..(m - 1), 0, fn row_index, _ ->
      x =
        grid
        |> Enum.at(row_index)
        |> Enum.at(column_index)

      if x < 0 do
        {:halt, m - row_index}
      else
        {:cont, 0}
      end
    end)
  end

  def check_single_num(grid, i, m, n) do
    x = grid |> Enum.at(i) |> Enum.at(i)

    if x >= 0 do
      0
    else
      1
    end
  end

  def count_negatives(grid) do
    m = Enum.count(grid)
    n = Enum.at(grid, 0) |> Enum.count()
    iterations = min(m, n) - 1

    Enum.reduce(0..iterations, 0, fn i, acc ->
      cond do
        i < iterations ->
          count_row(grid, i, m, n) + count_column(grid, i, m, n) + check_single_num(grid, i, m, n) +
            acc

        i == iterations ->
          cond do
            m < n ->
              count_row(grid, i, m, n) + check_single_num(grid, i, m, n) + acc

            m > n ->
              count_column(grid, i, m, n) + check_single_num(grid, i, m, n) + acc

            m == n ->
              check_single_num(grid, i, m, n) + acc
          end
      end
    end)
  end
end
