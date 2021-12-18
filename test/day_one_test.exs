defmodule DayOneTest do
  use ExUnit.Case

  defmacro input_local do
    [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
  end

  defmacro input_file do
    "input_day_one"
    |> File.read!()
    |> String.split(~r{(\r\n|\r|\n)})
    |> Enum.map(&String.to_integer/1)
  end

  describe "depth_positive_changes" do
    test "returns 7 for the given example" do
      input_local()
      |> DayOne.depth_positive_changes()
      |> Kernel.==(7)
      |> assert
    end

    test "returns 1601 from given input file " do
      input_file()
      |> DayOne.depth_positive_changes()
      |> Kernel.==(1602)
      |> assert
    end
  end

  describe "ranged_depth_positive_changes" do
    test "returns 5 for the given example" do
      input_local()
      |> DayOne.ranged_depth_positive_changes()
      |> Kernel.==(5)
      |> assert
    end

    test "returns x for the given input file" do
      input_file()
      |> DayOne.ranged_depth_positive_changes()
      |> Kernel.==(1633)
      |> assert
    end
  end
end
