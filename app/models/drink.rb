class Drink < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :ratings
  has_many :likes, class_name: 'Rating', conditions: 'feeling = 1'
  has_many :dislikes, class_name: 'Rating', conditions: 'feeling = -1'

  fires :new_drink, on: :create, actor: :user, if: ->(drink) { !drink.user.nil? }

  validates :name, presence: true, uniqueness: true

  attr_accessible :user, :name, :photo, :description, :instructions, :glass, :ingredients_attributes

  accepts_nested_attributes_for :ingredients

  def self.recent
    order('drinks.created_at DESC')
  end

  def self.since(time)
    where('drinks.created_at > ?', time)
  end

  def self.popular
    joins(:ratings).group('drinks.name').order('SUM(ratings.feeling) DESC').having('SUM(ratings.feeling) > 0')
  end

  def self.search(query)
    joins(:ingredients).where(query.split(',').collect { |q|
      "(drinks.name LIKE '%#{q.strip}%' OR ingredients.name LIKE '%#{q.strip}%')"
    }.join(' AND ')).group('drinks.name')
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
