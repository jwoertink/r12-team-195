class SearchController < ApplicationController
  def index
    @drinks = Drink.search(params[:drink][:name]).page(params[:page]).limit(50)
  end
end
