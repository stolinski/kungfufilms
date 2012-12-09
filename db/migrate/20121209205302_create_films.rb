class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :title
      t.date :year
      t.string :studio
      t.integer :rating
      t.string :director
      t.text :notes

      t.timestamps
    end
  end
end
