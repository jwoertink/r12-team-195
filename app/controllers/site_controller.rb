class SiteController < ApplicationController
  
  def index
    @recent_drinks = Drink.recent.limit(6)
    @popular_drinks = Drink.popular.limit(6)
    @trending_drinks = Drink.since(2.hours.ago).popular.limit(6)
    @star_mixologists = User.popular.limit(6)
  end

  def mixologists
    @users = User.all
  end
end
