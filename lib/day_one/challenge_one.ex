defmodule D1.Ch1 do

  @input_file_path './challenge_inputs/day_one/challenge_one.txt'

  def start do

    @input_file_path
      |> ChallengeFileLoader.parse_file_to_lines
      |> Stream.map(&String.to_integer(&1))
      |> Enum.reduce(fn x, acc -> x + acc end)

  end

end
