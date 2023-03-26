defmodule StringOfTimesTest do
  use ExUnit.Case
  doctest StringOfTimes

  test "greets the world" do
    assert StringOfTimes.hello() == :world
  end

  test "gets the summed string" do
    input = "12:32 34:01 15:23 9:27 55:22 25:56"
    expected = "2:32:41"
    actual = StringOfTimes.string_of_times_to_summed_string(input)
    assert actual == expected
  end
end
