defmodule AdventOfCode2018Test do
  use ExUnit.Case
  doctest AdventOfCode2018

  test "Reads the input file" do
    assert DayOne.ChallengeOne.read_file() != nil
  end
end
