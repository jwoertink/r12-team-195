class SiteController < ApplicationController
  def index
    classic_drinks = ['Adios Motherfucker', 'Amaretto Sour', 'Apple Pie', 'Bloody Mary', 'Blue Hawaiian', 'Blue Lagoon']

    @recent_drinks = Drink.recent.limit(6)
    @popular_drinks = Drink.popular.limit(6)
    @trending_drinks = Drink.since(2.hours.ago).popular.limit(6)
    @classic_drinks = Drink.find_all_by_name(classic_drinks)
    @star_mixologists = User.popular.limit(6)

    if @popular_drinks.empty?
      @popular_drinks = Drink.recent.limit(20).sort_by { rand }[0..6]
    end

    if @trending_drinks.empty?
      @trending_drinks = Drink.recent.limit(20).sort_by { rand }[0..6]
    end
  end
  
  def about
  end
end
