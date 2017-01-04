defmodule Series do
  def sum(number) do
    case number do
      0 -> "0.00"
      1 -> "1.00"
      2 -> "1.25"
      num ->  case  Enum.reduce(3..num,{1.25,4}, &merge/2) do
        {base, _} -> Float.to_string(base, decimals: 2)
      end
    end
  end

 def merge( _,{base, currentDiv}) do
   {base + 1 / (currentDiv + 3), currentDiv + 3}
  end
end

 IO.puts Series.sum(0) == "0.00"
 IO.puts Series.sum(1) == "1.00"
 IO.puts Series.sum(2) == "1.25"
 IO.puts  Series.sum(3) == "1.39"
 IO.puts Series.sum(4) == "1.49"
IO.puts Series.sum(5) == "1.57"
