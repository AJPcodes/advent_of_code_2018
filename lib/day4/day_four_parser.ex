defmodule D4.Parser do

  def parse_line(input) do
    {date, action} = String.split_at(input, 19)

    month = String.slice(date, 6, 2) |> String.to_integer
    day = String.slice(date, 9, 2) |> String.to_integer
    hour = String.slice(date, 12, 2) |> String.to_integer
    minute = String.slice(date, 15, 2) |> String.to_integer

    {:ok, date} = NaiveDateTime.new(2018, month, day, hour, minute, 0, {0, 0}, Calendar.ISO)
    type = determine_type(action)

    %{date: date,
     type: type}


  end

  def determine_type(action) do

    case action do
      "wakes up" -> :wakes
      "falls asleep" -> :sleeps
      x -> String.trim_leading(x, "Guard #") |> String.trim_trailing(" begins shift")

    end


  end

end
