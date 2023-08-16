defmodule ConsecutixTest do
  use ExUnit.Case
  doctest Consecutix

  @tag simple: true
  describe "simple tests" do
    test "consecutive_lists/1 with empty list returns empty list" do
      assert Consecutix.consecutive_lists([]) == []
    end

    test "consecutive_lists/1 with one element returns this element as a single group" do
      assert Consecutix.consecutive_lists([1]) == [[1]]
    end

    test "consecutive_lists/1 with two identical elements returns both elements in the same group" do
      assert Consecutix.consecutive_lists([1, 1]) == [[1]]
    end

    test "consecutive_lists/1 with two consecutive elements returns both elements in the same group" do
      assert Consecutix.consecutive_lists([0, 1]) == [[0, 1]]
    end

    test "consecutive_lists/1 with two non-consecutive elements returns all elements in different groups" do
      assert Consecutix.consecutive_lists([1, 3]) == [[1], [3]]
    end

    test "consecutive_lists/1 with three non-consecutive elements returns all elements in different groups" do
      assert Consecutix.consecutive_lists([1, 3, 5]) == [[1], [3], [5]]
    end

    test "consecutive_lists/1 with three consecutive elements returns both elements in the same group" do
      assert Consecutix.consecutive_lists([0, 1, 2]) == [[0, 1, 2]]
    end

    test "consecutive_lists/1 with four consecutive elements returns all elements in the same group" do
      assert Consecutix.consecutive_lists([0, 1, 2, 3]) == [[0, 1, 2, 3]]
    end

    test "consecutive_lists/1 with four non-consecutive elements returns all elements in different groups" do
      assert Consecutix.consecutive_lists([0, 2, 4, 6]) == [[0], [2], [4], [6]]
    end

    test "consecutive_lists/1 with 100 consecutive elements returns all elements in the same group" do
      base = 0..99 |> Enum.into([])

      assert Consecutix.consecutive_lists(base) == [base]
    end

    test "consecutive_lists/1 with 100 non-consecutive elements returns all elements in different groups" do
      base = 0..199//2 |> Enum.into([])

      assert Consecutix.consecutive_lists(base) == Enum.map(base, &[&1])
    end
  end

  @tag complex: true
  describe "more complex tests" do
    test "consecutive_lists/1 sorts and parses properly" do
      base = [11, 2, 0, 13, 22, 1, 14, 9]

      assert Consecutix.consecutive_lists(base) == [[0, 1, 2], [9], [11], [13, 14], [22]]
    end

    test "consecutive_lists/2 sorts with parser as argument" do
      base = [3, 1, 0]

      assert Consecutix.consecutive_lists(base, &Enum.sort/1) == [[0, 1], [3]]
    end

    test "consecutive_lists/2 sorts with own sorter as argument" do
      base = [3, 1, 0]
      sorter = &(&1 < &2)

      assert Consecutix.consecutive_lists(base, sorter) == [[0, 1], [3]]
    end
  end

  @tag usecase: true
  describe "tests for some use cases" do
    test "consecutive_lists/1 check integer in group" do
      base = [0, 1, 5, 6, 8, 10, 11]
      test_int = 6
      # [[0, 1], [5, 6], [8], [10, 11]]
      [g1, g2, g3, g4] = Consecutix.consecutive_lists(base)

      assert 6 not in g1
      assert 6 in g2
      assert 6 not in g3
      assert 6 not in g4
    end
  end

  @tag special_data_types: true
  describe "other data types" do
    test "consecutive_lists/1 respects input data" do
      base = [%{"int" => 0}, %{"int" => 1}, %{"int" => 2}]

      assert Consecutix.consecutive_maps(base) == [[%{"int" => 0}, %{"int" => 1}, %{"int" => 2}]]
    end
  end
end
