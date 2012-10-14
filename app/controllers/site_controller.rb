class SiteController < ApplicationController
  def index
    classic_drinks = ['Adios Motherfucker', 'Amaretto Sour', 'Apple Pie', 'Bloody Mary', 'Blue Hawaiian', 'Blue Lagoon', 'Caipirinha', 'Cape Cod']

    @recent_drinks = Drink.recent.limit(8)
    @popular_drinks = Drink.popular.limit(8)
    # @trending_drinks = Drink.since(2.hours.ago).popular.limit(8)
    @classic_drinks = Drink.find_all_by_name(classic_drinks)
    @star_mixologists = User.popular.limit(8)

    if @popular_drinks.empty?
      @popular_drinks = Drink.recent.limit(20).sort_by { rand }[0..7]
    end

    # if @trending_drinks.empty?
    #   @trending_drinks = Drink.recent.limit(20).sort_by { rand }[0..7]
    # end
  end

  def about
  end
end
