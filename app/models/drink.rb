class Drink < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :ingredients

  attr_accessible :description, :directions, :name

  has_many :ratings
  
  validates :name, :presence => true
end
