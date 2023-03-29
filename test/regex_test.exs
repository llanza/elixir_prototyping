defmodule RegexTest do
  use ExUnit.Case

  alias Regex

  test "no spaces regex" do
    #given
    test_string = "red"
    # https://regexr.com
    regex = ~r/^[^-\s][a-zA-Z0-9_\s-]+$/
    #when
    matched = String.match?(test_string, regex)
    #then
    assert matched == true
  end

  test "spaces regex" do
    #given
    test_string = "    scarlet"
    regex = ~r/^[^-\s][a-zA-Z0-9_\s-]+$/

    #when
    matched = String.match?(test_string, regex)

    #then
    assert matched == false
  end
end
