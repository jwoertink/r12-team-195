class SearchController < ApplicationController
  def index
    @drinks = Drink.search(params[:drink][:name])
  end
end
