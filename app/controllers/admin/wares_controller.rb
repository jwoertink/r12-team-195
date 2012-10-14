class Admin::WaresController < AdminController
  
  def index
    @wares = Ware.all
  end
  
  def new
    @categories = Ware.uniq.pluck(:kind)
    @ware = Ware.new
  end
  
  def create
    @ware = Ware.new(params[:ware])
    @ware.save!
    redirect_to admin_wares_path, :notice => 'added ware'
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'error'
    render :new
  end
  
  def edit
    @categories = Ware.uniq.pluck(:kind)
    @ware = Ware.find(params[:id])
  end
  
  def update
    @ware = Ware.find(params[:id])
    @ware.update_attributes!(params[:ware])
    redirect_to admin_wares_path, :notice => 'updated ware'
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'error'
    render :edit
  end
  
  def destroy
    @ware = Ware.find(params[:id])
    @ware.destroy
    redirect_to admin_wares_path, :notice => 'ware deleted'
  end
  
end
