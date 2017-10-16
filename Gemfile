source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'active_model_serializers'
gem 'devise_token_auth', '~> 0.1.42'
gem 'rack-cors', require: 'rack/cors'
gem 'responders', '~> 2.4'
gem 'cancancan', '~> 2.0'
gem 'dotenv-rails', '~> 2.2'
gem 'carrierwave', '~> 1.1'
gem 'acts_as_list', '~> 0.9.7'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'omniauth-facebook', '~> 4.0.0'
gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'carrierwave', '~> 1.1'
gem 'mini_magick', '~> 4.5', '>= 4.5.1'
gem 'fog-aws', '~> 1.4.1'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_girl_rails', '~> 4.7'
  gem 'ffaker', '~> 2.6'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'bullet', '~> 5.6'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano',         '~> 3.7.2'
  gem 'capistrano-rails',   '~> 1.1.6', require: false
  gem 'capistrano-bundler', '~> 1.1.4', require: false
  gem 'rvm1-capistrano3',   '~> 1.4.0', require: false
end

group :test do
  gem 'rspec-rails', '~> 3.6'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'shoulda-matchers', github: 'thoughtbot/shoulda-matchers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
