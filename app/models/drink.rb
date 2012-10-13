class Drink < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :ingredients, dependent: :destroy
  has_many :ratings
  has_many :likes, class_name: 'Rating', conditions: 'feeling = 1'
  has_many :dislikes, class_name: 'Rating', conditions: 'feeling = 0'

  validates :name, presence: true

  attr_accessible :name, :description, :instructions, :glass

  accepts_nested_attributes_for :ingredients

  def self.recent
    order('drinks.created_at DESC')
  end

  def self.since(time)
    where('drinks.created_at > ?', time)
  end

  def self.popular
    joins(:ratings).where('ratings.feeling = 1').group('drinks.name').order('COUNT(ratings.feeling) DESC').having('SUM(ratings.feeling) > 0')
  end
end
