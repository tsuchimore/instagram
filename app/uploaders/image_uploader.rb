# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :fog

  def cache_dir
    "config.cache_dir = 'tmp/image-cache'"
  end

  def fog_attributes
    {
      'Content-Type' =>  'image/jpg',
      'Cache-Control' => "max-age=#{1.week.to_i}"
    }
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def filename
    if original_filename.present?
      "#{model.id}_#{secure_token}.#{file.extension}"
    end
  end

  protected
  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end