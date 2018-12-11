defmodule Test.D3.Ch1 do
  use ExUnit.Case

  # 1288 @ 130,449: 22x26
  # 1289 @ 310,489: 14x27
  # 1290 @ 528,540: 20x11

  test "Parses lines into data structs" do
    assert D3.Ch1.parse_line("#1288 @ 130,449: 22x26") == %{
             id: 1288,
             left: 130,
             top: 449,
             width: 22,
             height: 26
           }
  end


end
