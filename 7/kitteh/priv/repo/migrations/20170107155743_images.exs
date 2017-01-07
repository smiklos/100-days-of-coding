defmodule Kitteh.Repo.Migrations.Images do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :size, :integer
      add :original_name, :string
      add :token, :string
      add :url, :string
      timestamps
  end
end
end
