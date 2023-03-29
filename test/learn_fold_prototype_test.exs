defmodule LearnFoldPrototypeTest do
  use ExUnit.Case

  alias LearnFoldPrototype

  @moduletag :capture_log

  doctest LearnFoldPrototype

  test "module exists" do
    assert is_list(LearnFoldPrototype.module_info())
  end
end
