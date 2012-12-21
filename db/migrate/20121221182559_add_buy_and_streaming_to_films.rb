class AddBuyAndStreamingToFilms < ActiveRecord::Migration
  def change
    add_column :films, :buy, :string
    add_column :films, :streaming, :string
  end
end
