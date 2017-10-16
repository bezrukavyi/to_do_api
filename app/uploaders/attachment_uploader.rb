class AttachmentUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def serializable_hash
    path = url || metadata['url']
    {
      file_name: file.filename,
      url: path,
      extension: file.extension
    }
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[jpg jpeg gif png]
  end
end
