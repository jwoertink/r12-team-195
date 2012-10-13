class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end
  
  def new
    @drink = Drink.new
  end

  def show
    @drink = Drink.find(prams[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def create
    @drink = Drink.new(params[:drink])

    if @drink.save
      redirect_to user_drinks_path, notice: "Thanks you for adding a drink, sir"
    else
      render :new
    end
  end

  def update
    @drink = Drink.find(prams[:id])

    if @drink.update_attributes(prams[:drink])
      flash[:notice] = "You're recipe has been updated"
    else
      render :edit
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destory
    redirect_to(user_drinks_path, only_path: true)
  end
end
