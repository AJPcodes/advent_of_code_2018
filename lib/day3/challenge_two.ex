defmodule D3.Ch2 do
  @input_file_path './challenge_inputs/day_three/challenge_one.txt'

  def start do

    grid = Grid.create_with_arrays()

    inputs = @input_file_path
    |> ChallengeFileLoader.parse_file_to_lines()
    |> Enum.map(&parse_line/1)


    overlaps = inputs
    |> Enum.reduce(grid, &Grid.update_using_ids/2)
    |> Grid.find_overlaps

    answer = inputs
    |> Enum.filter(fn x -> !Enum.member?(overlaps, x.id) end)
    |> List.first

    answer.id
  end

  def parse_line(line) do
    parts = String.split(line, " ")

    id = parts
      |> Enum.fetch!(0)
      |> String.replace_leading("#", "")
      |> String.to_integer()

    [left, top] = parts
      |> Enum.fetch!(2)
      |> String.replace_trailing(":", "")
      |> String.split(",")
      |> Enum.map(&String.to_integer/1)

    [width, height] = parts
      |> Enum.fetch!(3)
      |> String.split("x")
      |> Enum.map(&String.to_integer/1)

    parsed_result = %{
        id: id,
        left: left,
        top: top,
        width: width,
        height: height
      }

  end
end
