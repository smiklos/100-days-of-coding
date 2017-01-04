defmodule TribonacciSequence do

  @spec tribonacci({number, number, number}, non_neg_integer) :: [number]
    def tribonacci({f,s,t}, n) when n <= 3 do
    [f, s,t] |> Enum.take(n)
    end

def tribonacci({f,s,t}, n)do
   case (4..n |> Enum.reduce({[f,s,t], f,s,t}, fn  _,{list,fi, se, th} -> {list ++ ([fi + se + th]),se, th,fi + se + th}   end))
   do {result,_,_,_} -> result end
  end


end
