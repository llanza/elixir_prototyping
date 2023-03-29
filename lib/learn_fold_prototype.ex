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
    isColor = String.match?(input, regex)

    if isColor do
      newMatchedMap = Map.put(accumulator.matched_map, input, [])
      newAccumulator = %{accumulator | :matched_map => newMatchedMap, :current_color => input}

      newAccumulator
    else
      trimmedInput = String.trim(input)
      aliasList = Map.get(accumulator.matched_map, accumulator.current_color)
      newAliasList = aliasList ++ [trimmedInput]
      IO.inspect(newAliasList)
      newMatchedMap = %{accumulator.matched_map | accumulator.current_color => newAliasList}
      newAccumulator = %{accumulator | :matched_map => newMatchedMap}
      newAccumulator
    end
  end

end

