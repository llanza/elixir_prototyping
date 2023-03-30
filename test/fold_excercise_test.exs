defmodule FoldExcerciseTest do
  use ExUnit.Case

  alias FoldExcercise

  test "fold with builder" do
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
    actual = compose_alias_map(input)
    #then
    assert actual == expected
  end

  def compose_alias_map(lines) do
    initial_value = %{:alias_map => %{}, :current_color => :none}
    builder = Enum.reduce(lines, initial_value, &process_line/2)
    result = builder.matched_aliases
    result
  end

  def process_line(line, builder) do
    #in each line i'm supposed to add the color or the matched alias to the accumulator
    #I need to know if the input is a color or an alias
    color_regex = ~r/^\w+$/
    alias_regex = ~r/^\s+(\w+)$/
    color_match_result = Regex.run(color_regex, line)
    if color_match_result do
      [color] = color_match_result
      process_color(color, builder)
      IO.inspect(builder)
    else
      alias_match_result = Regex.run(alias_regex, line)
      if alias_match_result do
        [_, alias] = alias_match_result
        process_alias(alias, builder)
      end
    end
  end

  def process_color(color, builder) do
    #Map.put(builder.matched_aliases, color, [])
     result = Map.put(builder, :current_color, color)
     result
  end

  def process_alias(alias, builder) do
    current_color = builder.current_color
    old_alias_map = builder.alias_map
    old_alias_list = Map.get(old_alias_map, current_color, [])
    new_alias_list = [alias | old_alias_list]
    new_alias_map = Map.put(old_alias_map, current_color, new_alias_list)
    result = Map.put(builder, :alias_map, new_alias_map)
    result
  end
end
