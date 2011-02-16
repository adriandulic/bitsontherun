# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bitsontherun/version"

Gem::Specification.new do |s|
  s.name        = "bitsontherun"
  s.version     = BitsOnTheRun::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adrian Dulić"]
  s.email       = ["adulic@gmail.com"]
  s.homepage    = "http://github.com/adriandulic/bitsontherun"
  s.summary     = %q{BitsOnTheRun.com API implementation in Ruby}
  s.description = %q{BitsOnTheRun.com API implementation in Ruby}

  s.extra_rdoc_files = ["LICENSE", "README.markdown"]

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = s.name

  s.add_dependency "json", ">= 1.4.0"
  s.add_dependency "curb", ">= 0.7.0"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.1.0"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
