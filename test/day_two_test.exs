defmodule DayTwoTest do
  use ExUnit.Case
  doctest DayTwo

  defmacro input_local do
    ~s"""
    forward 5
    down 5
    forward 8
    up 3
    down 8
    forward 2
    """
  end

  defmacro input_file do
    "input_day_two" |> File.read!()
  end

  describe "get_position" do
    test "returns 150 for given example" do
      input_local()
      |> DayTwo.position()
      |> Kernel.==(150)
      |> assert
    end

    test "returns 1_459_206 for given input file" do
      input_file()
      |> DayTwo.position()
      |> Kernel.==(1_459_206)
      |> assert
    end
  end

  describe "get_aiming_position" do
    test "returns 150 for given example" do
      input_local()
      |> DayTwo.get_aiming_position()
      |> Kernel.==(900)
      |> assert
    end

    test "returns 1_320_534_480 for given input file" do
      input_file()
      |> DayTwo.get_aiming_position()
      |> Kernel.==(1_320_534_480)
      |> assert
    end
  end
end
