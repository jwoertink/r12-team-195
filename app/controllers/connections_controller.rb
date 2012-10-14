class ConnectionsController < ApplicationController
  respond_to :js

  def create
    user = User.find(params[:user_id])
    connection = Connection.find_or_create_by_source_id_and_destination_id(current_user.id, user.id)
    respond_with(connection, location: nil, status: 200)
  end

  def follows
    user = current_site.users.find(params[:user_id])
    connection = current_site.users.find(params[:user_id]).followings.where(destination_id: user.id).first
    respond_with(connection || '', location: nil)
  end

  def destroy
    user = User.find(params[:id])
    connection = Connection.find_by_source_id_and_destination_id(current_user.id, user.id)
    connection.destroy
    respond_with(true)
  end
end
