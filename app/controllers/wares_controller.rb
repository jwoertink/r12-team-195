class WaresController < ApplicationController

  def index
    @wares = Ware.all
    @categories = Ware.uniq.pluck(:kind)
  end
  
  def new
    @ware = Ware.new
  end

  def show
    @ware = Ware.find(params[:id])
  end

  def edit
    @ware = Ware.find(params[:id])
  end

  def create
    @ware = Ware.new(params[:ware])

    if @ware.save
      redirect_to wares_path, notice: "Thanks you for adding a ware, sir"
    else
      render :new
    end
  end

  def update
    @ware = Ware.find(prams[:id])

    if @ware.update_attributes(prams[:ware])
      flash[:notice] = "You're ware has been updated"
    else
      render :edit
    end
  end

  def destroy
    @ware = Ware.find(params[:id])
    @ware.destory
    redirect_to(wares_path, only_path: true)
  end

end
