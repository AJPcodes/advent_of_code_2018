defmodule Test.D2.Ch2 do
  use ExUnit.Case

  # @char_counts %{"a" => 1, "b" => 1, "c" => 1, "d" => 1}
  # @input ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab" ]

  test "Similarity Test" do
    assert D2.Ch2.similarity_test("abcde", "efghi") == "No Match"
    assert D2.Ch2.similarity_test("abcde", "abcdf") == "Match"
    assert D2.Ch2.similarity_test("abcde", "abcfg") == "No Match"
  end
end
