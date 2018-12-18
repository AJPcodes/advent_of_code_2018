defmodule Test.D5.Ch1 do
  use ExUnit.Case

  # 1288 @ 130,449: 22x26
  # 1289 @ 310,489: 14x27
  # 1290 @ 528,540: 20x11

  test "Can handle reactions between two items" do

    assert D5.Ch1.process_reaction("a", "a") == "non-reactive"
    assert D5.Ch1.process_reaction("a", "A") == "reactive"
    assert D5.Ch1.process_reaction("A", "a") == "reactive"
    assert D5.Ch1.process_reaction("c", "d") == "non-reactive"


  end

  test "Can handle test input" do

    assert String.codepoints("dabAcCaCBAcCcaDA") |> D5.Ch1.process([]) == 10


  end


end
