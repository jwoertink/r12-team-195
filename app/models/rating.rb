class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink

  attr_accessible :feeling, :user_id, :drink_id

  def like?
    feeling == 1
  end

  def dislike?
    feeling == 0
  end
end
