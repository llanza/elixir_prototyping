defmodule HelloTime do
  @moduledoc """
  Documentation for `HelloTime`.
  """

  # Define if DateTime.utc_now() is daylight savings safe

  def main() do
    time_unit = :microsecond
    startTime = System.monotonic_time(time_unit)
    target = File.read!(Path.expand(System.argv))
    IO.puts("Hello #{target}")
    endTime = System.monotonic_time(time_unit)
    duration = endTime - startTime
    IO.puts("#{duration} microseconds")
  end

end
