role :app, %w[deployer@95.85.11.63]
role :web, %w[deployer@95.85.11.63]
role :db,  %w[deployer@95.85.11.63]

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/to_do_api'
