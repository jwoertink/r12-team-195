# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:

    version :thumb, :from_version => :medium, :unless => :is_ware? do
      process :resize_to_fill => [140, 140]
    end

    version :medium, :unless => :is_ware? do
      process :resize_to_fill => [300, 300]
    end

    version :tiny, :from_version => :thumb, :unless => :is_ware? do
      process :resize_to_fill => [50, 50]
    end

    version :thumb_padded, :from_version => :medium_padded, :if => :is_ware? do
      process :resize_and_pad => [140, 140, '#fcf7fd']
    end

    version :medium_padded, :if => :is_ware? do
      process :resize_and_pad => [300, 300, '#fcf7fd']
    end

    version :tiny_padded, :from_version => :thumb_padded, :if => :is_ware? do
      process :resize_and_pad => [50, 50, '#fcf7fd']
    end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end


  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

  def is_ware?(photo)
    model.is_a?(Ware)
  end


end


