class SiteController < ApplicationController
  def index
    @recent_drinks = Drink.recent.limit(6)
  end

  def mixologists
    @users = User.all
  end
end
