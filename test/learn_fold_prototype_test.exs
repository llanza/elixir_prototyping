defmodule LearnFoldPrototypeTest do
  use ExUnit.Case
  alias LearnFoldPrototype

  test "fold color aliases" do
    #given
    input = [
      "red",
      "    scarlet",
      "    ruby",
      "    flame",
      "green",
      "    jade",
      "    forest",
      "    mint",
      "blue",
      "    turquoise",
      "    azure",
      "    sapphire"
    ]

    expected = %{
      "red" => ["scarlet", "ruby", "flame"],
      "green" => ["jade", "forest", "mint"],
      "blue" => ["turquoise", "azure", "sapphire"]
    }

    #when

    actual = LearnFoldPrototype.compose_alias_map(input)

    #then
    assert actual == expected
  end
end
