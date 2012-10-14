class Component < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient
  
  attr_accessible :amount, :unit
  
  
  def to_s
    measurement = if amount.nil?
      nil
    else
      (amount % 1 == 0) ? amount.to_i : amount
    end

    [measurement, unit, ingredient.name].compact.join(' ')
  end
end
