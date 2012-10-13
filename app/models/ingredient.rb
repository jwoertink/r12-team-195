class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :drinks, through: :components

  validates :name, presence: true, uniqueness: true

  attr_accessible :name, :amount, :unit, :drink_id

  def to_s
    measurement = if amount.nil?
      nil
    else
      (amount % 1 == 0) ? amount.to_i : amount
    end

    [measurement, unit, name].compact.join(' ')
  end

  def formatted_display
    "#{amount}, #{unit}, #{name}"
  end
end
