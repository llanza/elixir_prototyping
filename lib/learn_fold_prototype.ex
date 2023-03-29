defmodule LearnFoldPrototype do
  @moduledoc """

"""
  @doc """
    - I need: %{
        "red" => ["scarlet", "ruby", "flame"],
        "green" => ["jade", "forest", "mint"],
        "blue" => ["turquoise", "azure", "sapphire"]
      }
    - %{"blue" => [], "green" => [], "red" => []}
    - I need to identify the words that have no space in it
    - I need to add something to the last property of the map
"""
  def compose_alias_map(input) do
    accumulator = %{:matched_map => %{}, :current_color => nil}
    result = List.foldl(input, accumulator, &match_alias_to_color/2)
    IO.inspect(result.matched_map)
    result.matched_map
  end

  defp match_alias_to_color(input, accumulator) do
    regex = ~r/^[^-\s][a-zA-Z0-9_\s-]+$/
    is_color = String.match?(input, regex)

    if is_color do
      updated_accumulator = add_color_to_accumulator(input, accumulator)
      updated_accumulator
    else
      updated_accumulator  = add_alias_to_accumulator(input, accumulator)
      updated_accumulator
    end
  end

  def add_color_to_accumulator(input, accumulator) do
    new_matched_map = Map.put(accumulator.matched_map, input, [])
    new_accumulator = %{accumulator | :matched_map => new_matched_map, :current_color => input}
    new_accumulator
  end
  
  def add_alias_to_accumulator(input, accumulator) do
    trimmed_input = String.trim(input)
    alias_list = Map.get(accumulator.matched_map, accumulator.current_color)
    new_alias_list = alias_list ++ [trimmed_input]
    IO.inspect(new_alias_list)
    new_matched_map = %{accumulator.matched_map | accumulator.current_color => new_alias_list}
    new_accumulator = %{accumulator | :matched_map => new_matched_map}
    new_accumulator
  end

end

