role :app, %w{deployer@95.85.56.131}
role :web, %w{deployer@95.85.56.131}
role :db,  %w{deployer@95.85.56.131}

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/to_do_api'
