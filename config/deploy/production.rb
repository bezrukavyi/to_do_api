role :app, %w{deployer@146.185.175.244}
role :web, %w{deployer@146.185.175.244}
role :db,  %w{deployer@146.185.175.244}

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/to_do_api'
