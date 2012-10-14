class Ingredient < ActiveRecord::Base
  has_many :components
  has_many :drinks, through: :components

  validates :name, presence: true

  attr_accessible :name, :components_attributes

  accepts_nested_attributes_for :components

  after_initialize do
    if self.components.empty?
      self.components.build
    end
  end
end
