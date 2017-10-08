Devise.setup do |config|
  config.mailer_sender = ENV['MAIL_SENDER']
  config.secret_key = ENV['DEVISE_SECRET_KEY'] if Rails.env.production?
end
