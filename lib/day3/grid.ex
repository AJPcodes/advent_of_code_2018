defmodule Grid do

   def create() do

    Enum.to_list(1..1000)
    |> Enum.map(fn _v -> for n <- 1..1000, do: 0 end)

   end

   def sum(grid) do
      Enum.reduce(grid, 0, fn x, acc -> (Enum.map(x, &clean/1) |> Enum.sum()) + acc end)
   end

   def update(%{
      id: id,
      left: left,
      top: top,
      width: width,
      height: height
    }, grid) do

      {start, tail} = Enum.split(grid, top)
      {rows_to_update, remaining} = Enum.split(tail, height)

      middle = Enum.map(rows_to_update, fn row -> update_row(row, left, width) end)
      start ++ middle ++ remaining
   end

   def update_row(row, left, width) do

      {start, tail} = Enum.split(row, left)
      {updates, remaining} = Enum.split(tail, width)

      middle = Enum.map(updates, fn x ->
         case x do
           0 -> "X"
           "X" -> 1
           1 -> 1
         end
         end)

      start ++ middle ++ remaining

   end

   def clean(x) do

      if x == "X" do
       0
      else
       x
      end

   end

end
