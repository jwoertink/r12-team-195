class UsersController < ApplicationController
  
  def index
    @users = User.mixologists
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
