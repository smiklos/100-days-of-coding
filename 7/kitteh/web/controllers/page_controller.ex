defmodule Kitteh.PageController do
  use Kitteh.Web, :controller

  alias Kitteh.Repo
  alias Kitteh.Image


  def index(conn, _params) do
      changeset = Image.changeset(%Image{})
      render conn, "index.html", changeset: changeset
  end

  def show(conn, %{ "name" => name }) do
    IO.puts "ohh yeah"
    token = String.downcase(name)
      |> String.replace(~r/kitty/, "")
    image = Repo.get_by(Image, token: token)
    if is_nil(image) do
      redirect conn, to: "/"
    else
      render conn, "show.html", image: image
    end
  end

  def upload(conn, %{ "image" => %{ "file" => file } }) do
    IO.puts "Uploadig"
    params = file
      |> copy_file(unique_name(file.filename))
    changeset = Image.changeset(%Image{}, params)
    # try to insert the newly generated changeset
  case Repo.insert(changeset) do
    { :ok, image } ->
      conn
      |> put_flash(:info, "Uploaded")
      |> redirect(to: "/#{image.generated_name}")
    { :error, changeset } ->
      conn
      |> put_flash(:error, "Error!")
      |> render("index.html", changeset: changeset)
  end
end

  defp copy_file(file, name) do
    extension = Path.extname(file.filename)
    target = target_path() <> name <> extension
    IO.puts file.path
    IO.puts target
    case File.copy(file.path, target) do
      {:ok, size} ->
        %{
          generated_name: name,
          token: String.downcase(name),
          url: target,
          original_name: file.filename,
          content_type: file.content_type,
          size: size
        }
      {:error, baj} ->
        %{}
    end
  end

defp unique_name(file_name) do
  file_name <> UUID.uuid4()
end

defp target_path do
  Application.app_dir(:kitteh, "priv") <> "/static/uploads/"
end

end
