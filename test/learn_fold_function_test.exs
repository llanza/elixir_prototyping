defmodule LearnFoldFunctionTest do
  use ExUnit.Case

  alias LearnFoldFunction

  test "sum with fold" do

    #given
    input = [1,2,3]
    expected = 6
    initial_value = 0
    fold_function = fn x,acc -> acc + x end
    #when
    actual = List.foldl(input, initial_value, fold_function)
    #then
    assert actual == expected
  end
end
