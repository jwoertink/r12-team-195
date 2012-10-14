class Utensil < ActiveRecord::Base
  belongs_to :drink
  belongs_to :ware
end
