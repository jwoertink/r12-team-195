class Component < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ingredient

  attr_writer :ingredient_name

  attr_accessible :amount, :unit, :ingredient_name

  before_save do
    self.ingredient_id = Ingredient.find_or_create_by_name(@ingredient_name).id
  end

  def ingredient_name
    @ingredient_name || ingredient.try(:name)
  end
end
