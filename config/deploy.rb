require 'bundler/capistrano'

set :default_environment, {
  'LANG' => 'en_US.UTF-8'
 }

set :application, "scoreopenface"
set :repository,  "git@github.com:clayton/scoreopenface.git"

set :deploy_to, "/home/deploy/apps"
set :use_sudo, false
set :user, "deploy"
set :scm, :git
role :web, "96.126.114.228"
role :app, "96.126.114.228"
role :db,  "96.126.114.228", :primary => true

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end