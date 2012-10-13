class RatingsController < ApplicationController
  respond_to :html, :json, :js

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
    @feeling = params[:feeling]
    @rating = @drink.ratings.find_or_create_by_user_id(user_id: current_user.id, feeling: @feeling.to_i)
    respond_to do |f|
      f.html do
        redirect_to(drink_path(@drink, notice: 'Drink rated'))
      end
      f.js do
        render(:update_page)
      end
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
  
    def load_drink
      @drink = Drink.find(params[:drink_id])
    end
end
