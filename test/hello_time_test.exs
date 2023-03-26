defmodule HelloTimeTest do
  use ExUnit.Case

  alias HelloTime

  @moduletag :capture_log

  doctest HelloTime

  test "module exists" do
    assert is_list(HelloTime.module_info())
  end
end
