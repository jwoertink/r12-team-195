class SearchController < ApplicationController
  def index
    @search = Drink.search do
      fulltext params[:drink][:name]
      # order_by :rating, :desc
      paginate page: params[:page], per_page: 50
    end
  end
end
