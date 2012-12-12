class AddYoutubeAndDvdAndBlurayAndDriveToFilms < ActiveRecord::Migration
  def change
    add_column :films, :youtube, :string
    add_column :films, :dvd, :boolean
    add_column :films, :bluray, :boolean
    add_column :films, :drive, :boolean
  end
end
