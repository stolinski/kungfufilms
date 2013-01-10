class Film < ActiveRecord::Base
  attr_accessible :director_id, :notes, :rating, :studio_id, :title, :year, :watched, :youtube, :dvd, :bluray, :drive, :streaming, :buy
  belongs_to :studio
  belongs_to :director
end
