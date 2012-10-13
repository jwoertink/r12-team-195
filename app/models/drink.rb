class Drink < ActiveRecord::Base
  has_many :ingredients

  attr_accessible :description, :directions, :name

  has_many :ratings
  
  validates :name, :presence => true
end
