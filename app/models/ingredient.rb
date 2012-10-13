class Ingredient < ActiveRecord::Base
  belongs_to :drink

  validates :name, presence: true

  attr_accessible :name, :amount, :unit, :drink_id
end
