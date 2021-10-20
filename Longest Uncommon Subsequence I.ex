# Problem_link: https://leetcode.com/problems/longest-uncommon-subsequence-i/
defmodule Solution do
  @spec find_lu_slength(a :: String.t(), b :: String.t()) :: integer
  def find_lu_slength(a, b) do
    if String.equivalent?(a, b) do
      -1
    else
      max(String.length(a), String.length(b))
    end
  end
end
