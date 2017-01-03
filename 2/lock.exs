IO.puts "1. exercise"

fileContent = Enum.map(IO.stream(File.open!("data.txt"),:line), fn line -> line end)
IO.puts fileContent
IO.puts "2. exercise"

{lock, _} = Integer.parse(IO.gets "Enter a number")

IO.puts "3. exercise"

case fileContent
|> Enum.with_index
|> Enum.filter(fn({line, i}) ->
  line == lock
end) do
  [] -> IO.puts "Nothing matched"
  matches -> matches |> Enum.each(fn ({line,i}) -> IO.puts "Matching #{i} line" end)
end
