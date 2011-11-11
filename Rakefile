require File.expand_path('../mini-rails', __FILE__)
require 'rake'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
MiniRails::App.load_tasks
