defmodule D4.Ch1 do
  @input_file_path './challenge_inputs/day_four_input.txt'

  def start do

    full_list = @input_file_path
    |> ChallengeFileLoader.parse_file_to_lines()
    |> Enum.map(&D4.Parser.parse_line/1)
    |> Enum.sort_by(&(&1.date), fn a, b -> NaiveDateTime.compare(a,b) == :lt end)

    data = full_list
    |> find_sleepiest(%{}, nil, nil)
    {sleepiest_id, {sleeping_time, minute_breakdown}} = Enum.max(data, fn {x, y} -> x end)


    # {answer_minute, max}Enum.max(minute_breakdown)
    {minute, times} = Enum.max_by(minute_breakdown, fn {x, y} -> y end )

    minute * String.to_integer(sleepiest_id)

    find_most_frequent(data)
  end

  def find_most_frequent(data) do

    IO.inspect(data)
    keys = Map.keys(data)

    {id, minute, times} = Enum.map(keys, fn key ->
      {_, minutes_breakdown} = Map.get(data, key)
      {minute, times} = Enum.max_by(minutes_breakdown, fn {x, y} -> y end )
      {key, minute, times}
    end)
    |> Enum.max_by(fn {_,_,times} -> times end)


    String.to_integer(id) * minute

  end

  def find_sleepiest([head | []], data, current_guard, last_sleep_time) do

    {current_total, minutes} = Map.get(data, current_guard, {0, %{}})
    new_total = NaiveDateTime.diff(head.date, last_sleep_time, :second)/60 + current_total

    sleep_start_minute = last_sleep_time.minute
    sleep_end_minute = head.date.minute

    updated_minutes = Enum.to_list(1..60) |> Enum.reduce(minutes, (fn x, acc ->
      case x do
        x when x < sleep_start_minute -> acc
        x when x >= sleep_end_minute -> acc
        x -> Map.put(acc, x, Map.get(acc, x, 0) + 1)
      end end))
    updated_data = Map.put(data, current_guard, {new_total, updated_minutes})


  end

  def find_sleepiest([head | tail], data, current_guard, last_sleep_time) do

    case head.type do
      :sleeps ->
        find_sleepiest(tail, data, current_guard, head.date)
      :wakes ->
        {current_total, minutes} = Map.get(data, current_guard, {0, %{}})
        new_total = NaiveDateTime.diff(head.date, last_sleep_time, :second)/60 + current_total

        sleep_start_minute = last_sleep_time.minute
        sleep_end_minute = head.date.minute

        updated_minutes = Enum.to_list(1..60) |> Enum.reduce(minutes, (fn x, acc ->
          case x do
            x when x < sleep_start_minute -> acc
            x when x >= sleep_end_minute -> acc
            x ->
              Map.put(acc, x, Map.get(acc, x, 0) + 1)
          end end))
        updated_data = Map.put(data, current_guard, {new_total, updated_minutes})
        find_sleepiest(tail, updated_data, current_guard, nil)
      _ -> find_sleepiest(tail, data, head.type, nil)

      end
  end

end
