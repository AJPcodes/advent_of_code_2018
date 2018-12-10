defmodule ChallengeFileLoader do

  def parse_file_to_lines(input_file_path) do

    File.stream!(input_file_path, [], :line)
    |> Stream.map(&String.replace_suffix(&1, "\n", ""))

  end


end
