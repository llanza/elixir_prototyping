defmodule LearnFoldFunctionTest do
  use ExUnit.Case

  alias LearnFoldFunction

  @moduletag :capture_log

  doctest LearnFoldFunction

  test "module exists" do
    assert is_list(LearnFoldFunction.module_info())
  end
end
