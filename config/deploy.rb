# config valid only for Capistrano 3.1
lock '3.1.0'

require 'capistrano3/unicorn'

set :application, 'mikesshowroomservice.com'
set :repo_url, 'git@github.com:michael-misshore/mikes-showroom-service.git'
set :linked_files, %w{.env}
set :linked_dirs, %w{log}
set :unicorn_pid, '/home/unicorn/pids/unicorn.pid'
set :unicorn_config_path, '/home/unicorn/unicorn.conf'
set :unicorn_roles, %w{app}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:reload'
  end
end