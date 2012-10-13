class SiteController < ApplicationController
  def index
  end

  def mixologists
    @users = User.all
  end
end
