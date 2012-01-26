# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "rails_mini"
  s.version     = '0.0.3'
  s.authors     = ["gmarik","Stefan Penner"]
  s.email       = ["gmarik@gmail.com","stefan.penner@gmail.com"]
  s.homepage    = "http://github.com/gmarik/mini-rails"
  s.summary     = %q{Use Rails like Sinatra}
  s.description = %q{Use Rails like Sinatra}

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
