class User < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings, dependent: :destroy
  has_many :drinks, dependent: :destroy
  has_many :followers, class_name: 'Connection', foreign_key: :destination_id
  has_many :followings, class_name: 'Connection', foreign_key: :source_id
  has_many :friends, class_name: 'Connection', foreign_key: :source_id, conditions: { mutual: true }

  fires :new_user, on: :update, if: ->(user) { user.type_changed? }

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :photom, :remote_photo_url

  def self.mixologists
    where(type: 'User')
  end

  def self.popular
    joins(:drinks).joins(:ratings).group('drinks.name').order('SUM(ratings.feeling) DESC').having('SUM(ratings.feeling) > 0')
  end

  def activity_feed
    TimelineEvent.where('actor_id IN (?)', followings.collect { |f| f.destination_id } + [id])
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

  def follows?(user)
    followings.collect { |f| f.destination_id }.include?(user.id)
  end

end
