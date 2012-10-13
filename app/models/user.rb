class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :ratings, :dependent => :destroy
  has_many :drinks, :dependent => :destroy
  
  def self.mixologists
    where(:type => 'User')
  end
  
  def to_param
    "#{id}-#{name.parameterize}"
  end

  def anonymous?
    token.present?
  end
end
