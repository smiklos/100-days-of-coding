defmodule Pilecubes do

  def find_nb(0) do
    -1
  end

  def find_nb(m) do
  IO.puts m
    Stream.unfold({1,0}, fn {nextInt, all} ->
    res = pow(nextInt) + all
    {{nextInt,res}, {nextInt + 1, res}} end)
     |> Stream.take_while(fn {_,num} -> num <= m end) |> Enum.filter(fn {_,num} -> round(num) == m end)
     |> case do
       [{num,_} | _] -> num
       _ -> -1
     end
   end

def pow(num) do
    num * num * num
end

end
#0..10000 |> Enum.each(fn i -> IO.puts(Pilecubes.find_nb(i * i)) end)

IO.puts Pilecubes.find_nb 102524742360308307402300025000
