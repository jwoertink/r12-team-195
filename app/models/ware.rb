class Ware < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  has_many :utensils
  has_many :drinks, through: :utensils

  attr_accessible :name, :kind, :description, :photo

  validate :name, presence: true

  def self.glassware
    where(kind: 'glassware')
  end

  def self.hardware
    where(kind: 'hardware')
  end
end
