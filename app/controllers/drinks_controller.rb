class DrinksController < ApplicationController
  autocomplete :drink, :name, full: true

  def index
    respond_to do |f|
      f.html do
        @drinks = Drink.page(params[:page]).limit(50)
      end
      f.mobile do
        @drinks = Drink.group(:name).page(params[:page]).limit(50)
      end
    end
  end

  def show
    @drink = Drink.find(params[:id])
  end
end
