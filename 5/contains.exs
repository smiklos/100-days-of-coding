defmodule Whicharein do

  def in_array(array1, array2) do
    array1 |> Enum.filter(fn elem -> Enum.any?(array2, fn i -> String.contains?(i, elem) end) end) |> Enum.sort
  end

end
