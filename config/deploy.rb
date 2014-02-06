# config valid only for Capistrano 3.1
lock '3.1.0'

require 'capistrano3/unicorn'

set :application, 'mikesshowroomservice.com'
set :repo_url, 'git@github.com:michael-misshore/mikes-showroom-service.git'
set :linked_files, %w{.env}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

after 'deploy:restart', 'unicorn:reload'