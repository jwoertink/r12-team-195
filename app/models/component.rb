class Component < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient
  attr_accessible :amount, :unit, :ingredient_attributes

  def to_s
    measurement = if amount.nil?
      nil
    else
      (amount % 1 == 0) ? amount.to_i : amount
    end

    [measurement, unit, ingredient.name].compact.join(' ')
  end
end
