# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "is/version"

Gem::Specification.new do |s|
  s.name        = "is"
  s.version     = Is::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['gazay']
  s.email       = ['alex.gaziev@gmail.com']
  s.homepage    = "https://github.com/gazay/is"
  s.summary     = %q{Is this point in polygon?}
  s.description = %q{Simple small tool for finding points in polygon}

  s.rubyforge_project = "is"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
end
