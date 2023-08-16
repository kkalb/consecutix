defmodule Consecutix do
  @moduledoc """
  Documentation for `Consecutix`.
  """

  @doc """
  Returns consecutively grouped elements.
  Returned elements will be sorted.
  Duplicated elements are deleted.

  ## Examples

      iex> Consecutix.consecutive_lists([])
      []

  """

  @type output :: [list()]
  @spec consecutive_lists(list(), fun()) :: output
  def consecutive_lists(list, sorter \\ &Enum.sort/1)

  def consecutive_lists(list, sorter) when is_function(sorter, 2) do
    list |> Enum.sort(sorter) |> Enum.uniq() |> consecutive_lists_helper([], [])
  end

  def consecutive_lists(list, sorter) when is_function(sorter, 1) do
    list |> sorter.() |> Enum.uniq() |> consecutive_lists_helper([], [])
  end

  defp consecutive_lists_helper([], [], result), do: Enum.reverse(result)

  defp consecutive_lists_helper([], current_group, result),
    do: Enum.reverse([Enum.reverse(current_group) | result])

  defp consecutive_lists_helper([current | tail], [], result) do
    consecutive_lists_helper(tail, [current], result)
  end

  defp consecutive_lists_helper([current | tail], [prev | _] = current_group, result)
       when current - prev == 1 do
    consecutive_lists_helper(tail, [current | current_group], result)
  end

  defp consecutive_lists_helper([current | tail], current_group, result) do
    consecutive_lists_helper(tail, [current], [Enum.reverse(current_group) | result])
  end
end
