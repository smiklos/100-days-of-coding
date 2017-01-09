https://www.codewars.com/kata/consecutive-strings

defmodule Longestconsec do

  def longest_consec(strarr, k) when k < 0 or length(strarr) < k do
  ""
  end

  def longest_consec(strarr, k) do
  IO.puts IO.inspect strarr
   gather(strarr,k) |> Enum.sort(fn {_, c1},{_, c2} -> c1 >= c2 end) |> Enum.at(0) |> case do
   {idx, _} -> Enum.join(Enum.slice(strarr,idx, k),"")
   end
  end

  defp gather(arr, k, idx \\ 0, collected \\ []) do
    case arr do
    _ when length(arr) < k -> collected
    [] -> collected
    _ ->
    current = Enum.take(arr,k) |> Enum.reduce(0, fn elem, acc -> String.length(elem) + acc  end)
    gather(tl(arr),k,idx + 1, collected ++ [{idx, current}] )
  end
  end

end
