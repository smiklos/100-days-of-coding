defmodule Genetic do
  def generate(length) do
    length
    |> Kernel./(8)
    |> Float.ceil()
    |> trunc() # convert bytes length to bits length
    |> :crypto.strong_rand_bytes() # generate bytes
    |> bits_to_bytes() # convert bits back to 0 and 1 bytes
    |> binary_part(0, length) # remove leftover bytes
  end

  defp bits_to_bytes(bits) do
    for <<bit::size(1) <- bits>>, do: <<bit+48>>, into: ""
  end
end


Genetic.generate(10000) |> IO.puts
