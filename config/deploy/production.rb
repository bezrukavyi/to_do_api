role :app, %w{deployer@198.211.119.82}
role :web, %w{deployer@198.211.119.82}
role :db,  %w{deployer@198.211.119.82}

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/to_do_api'
