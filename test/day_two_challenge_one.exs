defmodule Test.D2.Ch1 do
  use ExUnit.Case

  @char_counts %{"a" => 1, "b" => 1, "c" => 1, "d" => 1}
  # @input ["abcdef", "bababc", "abbcde", "abcccd", "aabcdd", "abcdee", "ababab" ]

  test "Can count letters" do
    assert D2.Ch1.char_counts("abcd")["a"] == 1
    assert D2.Ch1.char_counts("abcbcbd")["b"] == 3
    assert D2.Ch1.char_counts("abcdabcdefg")["f"] == 1
  end

  test "Can find doubles" do
    assert D2.Ch1.has_dupes(%{"a" => 1, "b" => 1, "c" => 1, "d" => 1}) == false
    assert D2.Ch1.has_dupes(%{"a" => 1, "b" => 1, "c" => 3, "d" => 1}) == false
    assert D2.Ch1.has_dupes(%{"a" => 1, "b" => 5, "c" => 1, "d" => 1}) == false
    assert D2.Ch1.has_dupes(%{"a" => 1, "b" => 2, "c" => 1, "d" => 1}) == true
  end

  test "Can find triples" do
    assert D2.Ch1.has_trips(%{"a" => 1, "b" => 1, "c" => 1, "d" => 1}) == false
    assert D2.Ch1.has_trips(%{"a" => 1, "b" => 1, "c" => 3, "d" => 1}) == true
    assert D2.Ch1.has_trips(%{"a" => 1, "b" => 5, "c" => 1, "d" => 1}) == false
    assert D2.Ch1.has_trips(%{"a" => 1, "b" => 2, "c" => 1, "d" => 1}) == false
  end
end

"""
For example, if you see the following box IDs:

abcdef contains no letters that appear exactly two or three times.
bababc contains two a and three b, so it counts for both.
abbcde contains two b, but no letter appears exactly three times.
abcccd contains three c, but no letter appears exactly two times.
aabcdd contains two a and two d, but it only counts once.
abcdee contains two e.
ababab contains three a and three b, but it only counts once.
Of these box IDs, four of them contain a letter which appears exactly twice, and three of them
contain a letter which appears exactly three times. Multiplying these together produces a checksum of 4 * 3 = 12.
"""
