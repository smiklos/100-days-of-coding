defmodule Kitteh.PageView do
  use Kitteh.Web, :view


  def asset_url(image) do
    IO.puts  "http://localhost:4000/" <> Path.basename(image.url)
   image.url
  end
end
