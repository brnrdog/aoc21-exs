defmodule DayTwo do
  def position(input) do
    input
    |> String.split(~r{(\r\n|\r|\n)})
    |> Enum.map(&String.split/1)
    |> Enum.filter(&Enum.any?/1)
    |> Enum.group_by(&direction/1)
    |> Map.values()
    |> calculate
  end

  def get_aiming_position(input) do
    [x, y, _aim] =
      input
      |> String.split(~r{(\r\n|\r|\n)})
      |> Enum.map(&String.split/1)
      |> Enum.filter(&Enum.any?/1)
      |> Enum.reduce([0, 0, 0], &aim_reducer/2)

    x * y
  end

  defp direction([direction, _value]) do
    direction |> Kernel.==("forward") |> Kernel.if(do: :x, else: :y)
  end

  defp calculate([x, y]) do
    Enum.reduce(x, 0, &depth_reducer/2) * Enum.reduce(y, 0, &horizontal_reducer/2)
  end

  defp aim_reducer([direction, value], [x, y, aim]) do
    value = String.to_integer(value)

    case direction do
      "forward" -> [x + value, y + aim * value, aim]
      "down" -> [x, y, aim + value]
      "up" -> [x, y, aim - value]
      _ -> [x, y, aim]
    end
  end

  defp depth_reducer([_direction, value], total) do
    String.to_integer(value) + total
  end

  defp horizontal_reducer([direction, value], total) do
    v = String.to_integer(value)

    case direction do
      "up" -> total - v
      "down" -> total + v
    end
  end
end
