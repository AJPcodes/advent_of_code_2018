defmodule D2.Ch2 do

  @input_file_path './challenge_inputs/day_two/challenge_one.txt'

  def start do

      @input_file_path
      |> ChallengeFileLoader.parse_file_to_lines
      |> Enum.to_list
      |> find_similar

  end

  def find_similar([]) do
    {:error, "End of list"}
  end

  def find_similar([h | t]) do

    case find_similar_id(h, t) do
     "No match for this ID"
      ->
        find_similar(t)
      {a, b} -> strip_deplicate_character(a,b)
      _  ->
         {:error, "find_similar_id returned something unexpected"}
    end

  end

  def strip_deplicate_character(a, b) do

   Enum.zip(String.codepoints(a),String.codepoints(b))
   |> Enum.filter(fn ({a, b}) -> a == b end)
   |> Enum.map(fn ({a, b}) -> a end)
   |> Enum.join("")

  end

  def find_similar_id(current, []) do
    "No match for this ID"
  end

  def find_similar_id(current, [possible | tail]) do

    case similarity_test(current, possible) do
      "Match" ->
        {current, possible}
      "No Match" ->
        find_similar_id(current, tail)
    end


  end

  def similarity_test(current, possible_match) do

    current_codepoints = String.codepoints(current)
    possible_match_codepoints = String.codepoints(possible_match)
    match_codepoints(current_codepoints, possible_match_codepoints, 0)

  end

  def match_codepoints([], [], 1) do
    "Match"
  end

  def match_codepoints(_, _, x) when x > 1 do
    "No Match"
  end

  def match_codepoints([h | t], [h2 | t2], x) when x <= 1 do
    case h == h2 do
      true ->
        match_codepoints(t, t2, x)
      false ->
        match_codepoints(t, t2, x + 1)
    end
  end


end
