defmodule D5.Ch2 do
  @input_file_path './challenge_inputs/day_five_input.txt'

  @alphabet String.codepoints("abcdefghijklmnopqrstuvwxyz")

  def start do

    original_input = @input_file_path
    |> ChallengeFileLoader.parse_file_to_lines()
    |> Enum.to_list()
    |> List.first()
    |> String.codepoints()
    # |> process([])

    @alphabet
    |> Enum.map(fn x -> process_without_letter(x, original_input) end)
    |> Enum.min_by(fn {letter, count} -> count end)

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

    case {a,b,c,d} do
     {x,x,_,_} -> "non-reactive"
     {_,_,x,x} -> "reactive"
     _ -> "non-reactive"
    end

  end

  def process_without_letter(letter, original_input) do

    match = String.upcase(letter)
    count = original_input
    |> Enum.filter(fn x -> String.upcase(x) !== match end)
    |> process([])

    {letter, count}


  end

end
