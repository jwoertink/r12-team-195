class AnonymousUser < User
  attr_accessible :email, :password, :password_confirmation, :remember_me, :type, :token, as: :registrant

  def register(params)
    params = params.merge(type: 'User', token: nil)
    self.update_attributes(params, as: :registrant)
  end

end