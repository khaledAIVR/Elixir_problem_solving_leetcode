# Problem_link: https://leetcode.com/problems/reverse-string-ii/
defmodule Solution do
  @spec reverse_str(s :: String.t(), k :: integer) :: String.t()
  def reverse_str(s, k) do
    k_2 = 2 * k
    s_len = String.length(s)
    iterations = div(s_len, k_2)

    if iterations < 1 do
      handle_rem(s, k)
    else
      res =
        Enum.reduce(1..iterations, "", fn i, acc ->
          k_2_last = k_2 * i - 1
          k_2_first = k_2 * (i - 1)
          k_2_str = String.slice(s, k_2_first..k_2_last)
          res = reverse_first_k_of_str(k_2_str, k)
          acc <> res
        end)

      res <> handle_rem(String.slice(s, (iterations * k_2)..-1), k)
    end
  end

  def reverse_first_k_of_str(str, k) do
    k_str = String.slice(str, 0..(k - 1))
    k_rest_str = String.slice(str, k..-1)
    k_reversed = String.reverse(k_str)
    k_reversed <> k_rest_str
  end

  def handle_rem(str, k) do
    if String.length(str) <= k do
      String.reverse(str)
    else
      reverse_first_k_of_str(str, k)
    end
  end
end
