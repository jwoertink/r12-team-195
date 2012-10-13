class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings, dependent: :destroy
  has_many :drinks, dependent: :destroy

  fires :new_user, on: :create, if: ->(user) { !user.anonymous? }

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def self.mixologists
    where(type: 'User')
  end

  def self.popular
    joins(:drinks).joins(:ratings).group('drinks.name').order('SUM(ratings.feeling) DESC').having('SUM(ratings.feeling) > 0')
  end

  def to_param
    "#{id}-#{name.to_s.parameterize}"
  end

  def anonymous?
    token.present?
  end

  def display_name
    name || 'Anonymous User'
  end
end
