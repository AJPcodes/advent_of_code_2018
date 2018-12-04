defmodule DayOne.ChallengeOne do

  @input_file_path './challenge_inputs/day_one/challenge_one.txt'

  def start do

    parse_file

  end

  def parse_file do

      File.stream!(@input_file_path, [], :line)
      |> Stream.map(&String.replace_suffix(&1, "\n", ""))
      |> Stream.map(&String.to_integer(&1))
      |> Enum.reduce(fn x, acc -> x + acc end)

  end

end
