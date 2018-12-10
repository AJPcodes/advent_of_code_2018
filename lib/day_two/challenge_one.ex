defmodule D2.Ch1 do

  @input_file_path './challenge_inputs/day_two/challenge_one.txt'

  def start do

    @input_file_path
      |> ChallengeFileLoader.parse_file_to_lines
      |> Enum.reduce({0,0, }, fn x, {a, b} ->
          counts = char_counts(x)
          case {has_dupes(counts), has_trips(counts)} do
            {true, false} -> {a + 1, b}
            {true, true} -> {a + 1, b + 1 }
            {false, true} -> {a, b + 1}
            _  -> {a, b}
          end

      end)
      |> get_checksum

  end

  def get_checksum({a,b}) do
   a * b
  end

  def has_dupes(input) do
    input
      |> Map.values
      |> Enum.member?(2)
  end

  def has_trips(input) do
    input
      |> Map.values
      |> Enum.member?(3)
  end

  def char_counts(input) when is_binary(input) do

    input
    |> String.codepoints
    |> Enum.reduce(%{}, fn x, acc ->
      case Map.has_key?(acc, x) do
        true
          -> Map.put(acc, x, acc[x] + 1)
        false
          -> Map.put(acc, x, 1)
      end
    end)

  end

end
