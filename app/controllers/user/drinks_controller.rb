class User::DrinksController < ApplicationController
  
  def index
    @drinks = current_user.drinks
  end

  def new
    @drink = Drink.new
    @drink.ingredients.build
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = current_user.drinks.find(params[:id])
  end

  def create
    @drink = current_user.drinks.new(params[:drink])

    if @drink.save
      redirect_to drinks_path, notice: "Thanks you for adding a drink, sir"
    else
      render :new
    end
  end

  def update
    @drink = current_user.drinks.find(params[:id])

    if @drink.update_attributes(params[:drink])
      flash[:notice] = "You're recipe has been updated"
      redirect_to drink_path
    else
      render :edit
    end
  end

  def destroy
    @drink = current_user.drinks.find(params[:id])
    @drink.destroy
    redirect_to(user_drinks_path, only_path: true)
  end
end
