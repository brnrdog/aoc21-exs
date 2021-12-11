defmodule DayOne do
  @doc """
  Returns the number of positive changes given a list of depths
  """
  def depth_positive_changes(input) do
    input |> reduce_input()
  end

  def ranged_depth_positive_changes(input) do
    input |> reduce_ranges() |> reduce_input()
  end

  defp reduce_ranges(input) do
    input
    |> Enum.with_index()
    |> Enum.reduce([], fn {depth, index}, acc ->
      next = Enum.at(input, index + 1, 0)
      next_next = Enum.at(input, index + 2, 0)
      val = depth + next + next_next
      [val | acc]
    end)
    |> Enum.drop(2)
    |> Enum.reverse()
  end

  defp reduce_input(input) do
    input
    |> Enum.with_index()
    |> Enum.reduce(0, fn {depth, index}, acc ->
      input
      |> Enum.at(index - 1, depth)
      |> Kernel.<(depth)
      |> Kernel.then(fn greater -> if greater, do: acc + 1, else: acc end)
    end)
  end
end
