class Ware < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader

  attr_accessible :name, :type
end
