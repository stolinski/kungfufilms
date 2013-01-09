class AddStudioIdToFilms < ActiveRecord::Migration
  def change
  	add_column :films, :studio_id, :integer
  	remove_column :films, :studio
  	add_index :films, :studio_id
  end
end
