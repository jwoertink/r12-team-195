class RegistrationsController < Devise::RegistrationsController
  before_filter :require_registerd_user, only: [:edit, :update, :destroy]

  def create
    @user = AnonymousUser.find(current_user.id)
    if @user.register(params[:user])
      sign_in_and_redirect(@user.becomes(User))
    else
      render(:new)
    end
  end

  private

  def require_registerd_user
    redirect_to(new_user_registration_path, notice: 'Please register before continuing.') if current_user.anonymous?
  end
end
