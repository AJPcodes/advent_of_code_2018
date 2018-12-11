defmodule D1.Ch2 do
  @input_file_path './challenge_inputs/day_one/challenge_one.txt'

  def start do
    @input_file_path
    |> ChallengeFileLoader.parse_file_to_lines()
    |> Enum.map(&String.to_integer(&1))
    |> dupe_check
  end

  defp dupe_check([h | t] = list) do
    frequencies = MapSet.new([0])

    dupe_check([h | t], 0, frequencies, list)
  end

  defp dupe_check([h | []], current_frequency, frequencies, full_list) do
    new_frequency = current_frequency + h

    if MapSet.member?(frequencies, new_frequency) do
      new_frequency
    else
      updated_frequencies = MapSet.put(frequencies, new_frequency)
      dupe_check(full_list, new_frequency, updated_frequencies, full_list)
    end
  end

  defp dupe_check([h | t], current_frequency, frequencies, full_list) do
    new_frequency = current_frequency + h

    if MapSet.member?(frequencies, new_frequency) do
      new_frequency
    else
      updated_frequencies = MapSet.put(frequencies, new_frequency)
      dupe_check(t, new_frequency, updated_frequencies, full_list)
    end
  end
end
