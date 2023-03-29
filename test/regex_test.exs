defmodule RegexTest do
  use ExUnit.Case

  alias Regex

  @moduletag :capture_log

  doctest Regex

  test "module exists" do
    assert is_list(Regex.module_info())
  end
end
