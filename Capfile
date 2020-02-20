# Load DSL and set up stages
require "capistrano/setup"
require "capistrano/deploy"
require "capistrano/scm/git"
require 'capistrano/rails'
require 'capistrano/passenger'
require 'capistrano/rbenv'
require 'capistrano/rbenv_vars'

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5'
install_plugin Capistrano::SCM::Git

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
