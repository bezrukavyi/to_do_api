Devise.setup do |config|
  config.mailer_sender = ENV['MAIL_SENDER']
  config.secret_key = ENV['SECRET_KEY_BASE'] if Rails.env.production?
end
