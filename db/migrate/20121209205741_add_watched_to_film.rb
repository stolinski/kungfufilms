class AddWatchedToFilm < ActiveRecord::Migration
  def change
    add_column :films, :watched, :boolean
  end
end
