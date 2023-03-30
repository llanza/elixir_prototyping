defmodule Regex2Test do
  use ExUnit.Case

  alias Regex2

  test "color regex test" do
    color = "red"
    alias = "    scarlet"
    regex = ~r/^\w+$/

    assert color =~ regex
    refute alias =~ regex
  end

  test "alias regex test" do
    color = "red"
    alias = "    scarlet"
    regex = ~r/^\s+(\w+)$/

    refute color =~ regex
    assert alias =~ regex
  end

  test "capture alias" do
    alias = "    scarlet"
    regex = ~r/^\s+(\w+)$/
    [_input, captured_alias] = Regex.run(regex, alias)

    assert captured_alias == "scarlet"
  end
end
