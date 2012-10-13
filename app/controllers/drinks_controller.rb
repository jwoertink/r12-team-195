class DrinksController < ApplicationController
  autocomplete :drink, :name, full: true

  def index
    @drinks = Drink.page(params[:page]).limit(50)
  end

  def show
    @drink = Drink.find(params[:id])
  end
end
