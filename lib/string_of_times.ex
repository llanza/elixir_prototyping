defmodule StringOfTimes do
  @moduledoc """
  Documentation for `StringOfTimes`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> StringOfTimes.hello()
      :world

  """
  IO.puts("hello again")

  def hello do
    :world
  end


  def string_of_times_to_seconds(string_of_times) do
    times = String.split(string_of_times, " ")
    secondsList = Enum.map(times, &convert_to_seconds/1)
    totalSeconds = Enum.sum(secondsList)
    totalSeconds
  end

  def convert_to_seconds(time) do
    [minutesString, secondsString] = String.split(time, ":")
    minutes = String.to_integer(minutesString)
    seconds = String.to_integer(secondsString)
    totalSeconds = minutes * 60 + seconds
    totalSeconds
  end


  def seconds_to_summed_string(totalSeconds) do
    seconds = rem(totalSeconds, 60)
    totalMinutes = div(totalSeconds, 60)
    minutes = rem(totalMinutes, 60)
    hours = div(totalMinutes, 60)

    summedString = "#{hours}:#{minutes}:#{seconds}"
    summedString
  end

  def string_of_times_to_summed_string(string_of_times) do
    seconds = string_of_times_to_seconds(string_of_times)
    summed_string = seconds_to_summed_string(seconds)
    summed_string
  end

end
