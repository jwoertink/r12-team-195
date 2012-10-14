class UsersController < ApplicationController
  def index
    @users = User.mixologists.page(params[:page]).limit(50)
  end

  def show
    @user = User.find(params[:id])
    @drinks = @user.drinks.page(params[:page]).limit(20)
  end
end
