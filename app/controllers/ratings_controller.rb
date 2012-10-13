class RatingsController < ApplicationController
  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def create
    @rating = Rating.new(params[:rating])

    if @rating.save
      redirect_to @rating, notice: 'Rating was successfully created.' 
    else
      render action: "new"
    end
  end

  def update
    @rating = Rating.find(params[:id])

    if @rating.update_attributes(params[:rating])
      redirect_to @rating, notice: 'Rating was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to ratings_url
  end
end
