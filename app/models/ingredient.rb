class Ingredient < ActiveRecord::Base
  belongs_to :drink

  attr_accessible :amount, :drink_id, :name
end
