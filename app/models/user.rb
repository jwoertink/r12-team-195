class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :ratings, dependent: :destroy
  has_many :drinks, dependent: :destroy

  def self.mixologists
    where(type: 'User')
  end

  def self.popular
    joins(:drinks).joins(:ratings).where('ratings.feeling = 1').group('drinks.name').order('COUNT(ratings.feeling) DESC').having('SUM(ratings.feeling) > 0')
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def anonymous?
    token.present?
  end
end
