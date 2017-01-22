# config valid only for current version of Capistrano
lock "3.7.1"

set :application, $APPLICATION_NAME
set :repo_url, $REPO_URL



# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :scm_user, $SCM_USER
set :scm_passphrase, $SCM_PASSWORD

# Default deploy_to directory is /var/www/my_app_name
set :user, $DEPLOY_USER
set :use_sudo, true
set :deploy_via, :copy
set :deploy_to, $DEPLOY_TO

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, ".env"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :rails_env, "production"

# Default value for keep_releases is 5
set :keep_releases, 5