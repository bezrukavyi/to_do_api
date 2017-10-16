role :app, %w[deployer@52.36.197.93]
role :web, %w[deployer@52.36.197.93]
role :db,  %w[deployer@52.36.197.93]

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/to_do_api'
