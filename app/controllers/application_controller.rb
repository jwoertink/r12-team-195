class ApplicationController < ActionController::Base
  include Mobylette::RespondToMobileRequests
  protect_from_forgery
  before_filter :set_mobile

  def authenticate_user!(*args)
    current_user.present? || super(*args)
  end

  def current_user
    super || AnonymousUser.find_or_initialize_by_token(anonymous_user_token).tap do |user|
      user.save(validate: false) if user.new_record?
    end
  end

  private
  
  def anonymous_user_token
    session[:user_token] ||= SecureRandom.hex(8)
  end
  
  def set_mobile
    #session[:mobylette_override] ||= :force_mobile
    session[:mobylette_override] = nil
  end

end
