defmodule HelloTime do
  @moduledoc """
  Documentation for `HelloTime`.
  """

  def currentTime(time_unit) do
    time = System.monotonic_time(time_unit)
    time
  end

  def file_name() do
    fileName = System.argv
    fileName
  end

  def file_path(name) do
    path = Path.expand(name)
    path
  end

  def target(path) do
    target = File.read!(path)
    target
  end

  def main() do
    time_unit = :microsecond
    start_time = currentTime(time_unit)
    path = file_path(file_name()) #Is it necessary to use the Path.expand?
    messageTarget = target(path)
    IO.puts("Hello #{messageTarget}")
    endTime = currentTime(time_unit)
    duration = endTime - start_time
    IO.puts("#{duration} microseconds")
  end

end
