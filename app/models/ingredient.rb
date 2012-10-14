class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :drinks, through: :components

  validates :name, presence: true, uniqueness: true

  attr_accessible :name, :amount, :unit, :drink_id
end
