class WaresController < ApplicationController

  def index
    @wares = Ware.all
    @categories = Ware.uniq.pluck(:kind)
  end
  
  def show
    @ware = Ware.find(params[:id])
  end

end
