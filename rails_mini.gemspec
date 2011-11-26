# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rails_mini/version"

Gem::Specification.new do |s|
  s.name        = "rails_mini"
  s.version     = RailsMini::VERSION
  s.authors     = ["gmarik","Stefan Penner"]
  s.email       = ["gmarik@gmail.com","stefan.penner@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Simple Web DSL built with rails}
  s.description = %q{Sometimes rails feels over powering, luckily rails is quite modular. This gem provides sane defaults, with a simple, familiar and handy DSL}

  s.rubyforge_project = "rails_mini"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_runtime_dependency 'rails', '3.1'
  s.add_runtime_dependency 'racksh'
  s.add_runtime_dependency 'minitest'

  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-rails'
end
