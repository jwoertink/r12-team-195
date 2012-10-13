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

  searchable do
    text :name, :glass
    text :ingredients do
      ingredients.map { |i| i.name }
    end
    integer :rating do
      likes.count - dislikes.count
    end
  end

  def self.recent
    order('drinks.created_at DESC')
  end

  def self.since(time)
    where('drinks.created_at > ?', time)
  end

  def self.popular
    joins(:ratings).group('drinks.name').order('SUM(ratings.feeling) DESC').having('SUM(ratings.feeling) > 0')
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
