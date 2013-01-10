class AddDIdToFilms < ActiveRecord::Migration
  def change
  	add_column :films, :director_id, :integer
  	remove_column :films, :director
  	add_index :films, :director_id
  end
end
