class Drink < ActiveRecord::Base
  has_many :ingredients
  has_many :ratings

  validates :name, presence: true, uniqueness: true

  attr_accessible :name, :description, :instructions
end
