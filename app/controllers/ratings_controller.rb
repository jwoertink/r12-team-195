class RatingsController < ApplicationController
  before_filter :load_drink
  
  def index
    @ratings = @drink.ratings
  end

  def show
    @rating = @drink.ratings.find(params[:id])
  end

  def new
    @rating = @drink.ratings.new
  end

  def edit
    @rating = @drink.ratings.find(params[:id])
  end

  def create
    @rating = @drink.ratings.new(params[:rating])

    if @rating.save
      redirect_to @rating, notice: 'Rating was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    @rating = @drink.ratings.find(params[:id])

    if @rating.update_attributes(params[:rating])
      redirect_to @rating, notice: 'Rating was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @rating = @drink.ratings.find(params[:id])
    @rating.destroy
    redirect_to ratings_url
  end
  
  private
  
    def load_user
      @drink = Drink.find(params[:id])
    end
end
