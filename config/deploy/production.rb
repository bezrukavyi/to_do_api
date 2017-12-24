role :app, %w[deployer@188.226.189.119]
role :web, %w[deployer@188.226.189.119]
role :db,  %w[deployer@188.226.189.119]

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/to_do_api'
