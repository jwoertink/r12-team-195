class Ingredient < ActiveRecord::Base
  belongs_to :drink

  validates :name, presence: true

  attr_accessible :name, :amount, :unit, :drink_id

  def to_s
    measurement = if amount.nil?
      nil
    else
      (amount % 1 == 0) ? amount.to_i : amount
    end

    [measurement, unit, name].compact.join(' ')
  end
end
