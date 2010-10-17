$:.reject! { |e| e.include? 'TextMate' }

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

# class Rake::TestTask
#   def define_with_no_verbose
#     @verbose = false
#     define_without_no_verbose
#   end
#   alias_method_chain :define, :no_verbose
# end

require 'tasks/rails'
require 'shoulda/tasks' if defined? Shoulda::VERSION