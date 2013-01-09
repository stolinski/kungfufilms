class Film < ActiveRecord::Base
  attr_accessible :director, :notes, :rating, :studio_id, :title, :year, :watched, :youtube, :dvd, :bluray, :drive, :streaming, :buy
  belongs_to :studio
end
