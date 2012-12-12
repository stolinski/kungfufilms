class Film < ActiveRecord::Base
  attr_accessible :director, :notes, :rating, :studio, :title, :year, :watched, :youtube, :dvd, :bluray, :drive
end
