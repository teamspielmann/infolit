set :user, 'ilafr0'
set :application, "Information Literacy Africa"
set :domain, "ilafrica.org"



set :scm, :git
set :repository,  "git@github:teamspielmann/ilafrica.git"
set :scm_passphrase, ""
set :branch, "master"
set :rails_env, :production
set :use_sudo, false


#because I'm using rvm
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
#require "rvm/capistrano"
#set :rvm_ruby_string, '1.9.3-p194'
#set :rvm_type, :user


set :deploy_to, "/var/www/ilafrica.org"

role :web, "ilafrica.org"                          # Your HTTP server, Apache/etc
role :app, "ilafrica.org"                          # This may be the same as your `Web` server
role :db,  "ilafrica.org", :primary => true         # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:

 default_environment['PATH']=':/users/spielmanncd1/ILEA-9/config/environments/production.rb'
 default_environment['GEM_PATH']=':/users/spielmanncd1/.rvm/gems/ruby-1.9.3-p194'





 namespace :deploy do
   desc "cause Passenger to initiate a restart"
   task :restart do  
     run "touch #{current_path}/tmp/restart.txt"
     end
     
     desc "reload the database with seed data"
     task :seed do
     run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
   end
end
     
   after "deploy:update_code", :bundle_install
   desc "install the necessary prerequisites"
   task :bundle_install, :roles => :app do
   run "cd #{release_path} && bundle install"
   end