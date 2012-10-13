class Rating < ActiveRecord::Base
  attr_accessible :feeling, :user_id

  belongs_to :user
  belongs_to :drink
end
