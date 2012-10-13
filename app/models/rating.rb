class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :drink

  fires :new_rating, on: :create, actor: :user, secondary_subject: 'drink', if: ->(rating) { rating.user.nil? || !rating.user.anonymous? }

  attr_accessible :feeling, :user_id, :drink_id

  def liked?
    feeling == 1
  end

  def disliked?
    feeling == 0
  end
end
