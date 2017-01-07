defmodule Kitteh.Image do
  use Kitteh.Web, :model

  schema "images" do
    field :original_name, :string
    field :url, :string
    field :size, :integer
    field :file, :string, virtual: true
    field :token, :string
    field :generated_name, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:original_name, :url, :size, :file,:token, :generated_name])
    |> validate_required([:original_name, :url, :size])
  end
end
