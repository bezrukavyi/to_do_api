require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
  end

  if Rails.env.production?
    config.storage = :file
    config.enable_processing = false
    # config.storage = :fog
    # config.fog_provider = 'fog/aws'
    #
    # config.fog_credentials = {
    #   provider: 'AWS',
    #   aws_access_key_id: ENV['S3_ACCESS_KEY'],
    #   aws_secret_access_key: ENV['S3_SECRET_KEY'],
    #   region: ENV['S3_REGION'],
    #   endpoint: ENV['S3_ENDPOINT'],
    #   path_style: true
    # }
    # config.fog_directory = ENV['S3_BUCKET']
  end
end
