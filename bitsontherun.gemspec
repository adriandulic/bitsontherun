# -*- encoding: utf-8 -*-
require File.expand_path("../lib/bitsontherun/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "bitsontherun"
  s.version     = BitsOnTheRun::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adrian Dulic']
  s.email       = ['adulic@gmail.com']
  s.homepage    = "http://github.com/adriandulic/bitsontherun"
  s.summary     = "Bits on the run API implementation in Ruby"
  s.description = "Bits on the run API implementation in Ruby"
  
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "bitsontherun"
  
  s.add_dependency "nokogiri", ">= 1.4.3"
  s.add_dependency "json", ">= 1.4.6"
  s.add_dependency "curb"
  
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.0.0"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
