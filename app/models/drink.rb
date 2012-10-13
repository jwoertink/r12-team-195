class Drink < ActiveRecord::Base
  has_many :ingredients

  attr_accessible :description, :directions, :name
end
