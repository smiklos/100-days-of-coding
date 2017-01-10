defmodule Bankerplan do

  def fortune(f0, p, c0, n, i) do
  Stream.unfold({f0, c0}, fn {fN,cN} -> {fN, {addRate(fN,p) - cN, addRate(cN,i)}} end)
  |> Stream.take(n)
  |> Enum.all?(fn num -> num >= 0 end)
  end

  defp addRate(money, rate) do
  Float.round(money + (0.01 * money) * rate)
  end

end

# https://www.codewars.com/kata/56445c4755d0e45b8c00010a/solutions/elixir
