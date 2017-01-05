defmodule Collatz do

  def collatz(n) do
  n
  |> Stream.unfold(&{&1, if even? &1 do round(&1 / 2) else 3 * &1 + 1 end })
  |> Stream.take_while(fn num -> num > 1 end)
  |> Enum.join("->")
  |> Kernel.<>("->1")

  end

  def even?(num) do
    rem(num,2) == 0
  end

end

IO.puts Collatz.collatz(3) # == "3->10->5->16->8->4->2->1"
