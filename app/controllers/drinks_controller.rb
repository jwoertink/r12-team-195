class DrinksController < ApplicationController
  autocomplete :drink, :name, :full => true
  
  def index
    @drinks = Drink.page(params[:page]).limit(50)
  end
  
  def new
    @drink = Drink.new
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
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
    @drink = current_user.drinks.find(prams[:id])

    if @drink.update_attributes(prams[:drink])
      flash[:notice] = "You're recipe has been updated"
    else
      render :edit
    end
  end

  def destroy
    @drink = current_user.drinks.find(prams[:id])
    @drink.destroy
    redirect_to(user_drinks_path, only_path: true)
  end
end
