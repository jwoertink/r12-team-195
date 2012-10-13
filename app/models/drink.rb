class Drink < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :ingredients
  has_many :ratings

  validates :name, presence: true, uniqueness: true

  attr_accessible :name, :description, :instructions, :glass
end
