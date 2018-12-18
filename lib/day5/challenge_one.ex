defmodule D5.Ch1 do
  @input_file_path './challenge_inputs/day_five_input.txt'

  def start do

    @input_file_path
    |> ChallengeFileLoader.parse_file_to_lines()
    |> Enum.to_list()
    |> List.first()
    |> String.codepoints()
    |> process([])
  end

  def process([current | [next | tail]], [last_processed | processed_tail] = processed) do

    case process_reaction(current, next) do
      "reactive" -> process([last_processed | tail], processed_tail)
      "non-reactive" -> process([next | tail], [current | processed])
    end

  end

  def process([current | [next | tail]], []) do

    case process_reaction(current, next) do
      "reactive" -> process(tail, [])
      "non-reactive" -> process([next | tail], [current])
    end

  end

  def process([current | []], processed) do
    [current | processed]
    |> Enum.reverse()
    |> Enum.count()

  end

  def process_reaction(a,b) do

    c = String.upcase(a)
    d = String.upcase(b)


    IO.inspect (case {a,b,c,d} do
     {x,x,_,_} -> "non-reactive"
     {_,_,x,x} -> "reactive"
     _ -> "non-reactive"
    end)

  end

end
