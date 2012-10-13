class SearchController < ApplicationController
  
  def index
    queries = params[:drink][:name].split(',').map(&:strip)
    # TODO: add in joins(:ingredients)
    @drinks = Drink.where(:name => queries)
  end
  
end
