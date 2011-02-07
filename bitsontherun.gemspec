# -*- encoding: utf-8 -*-
require File.expand_path("../lib/bitsontherun/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "bitsontherun"
  s.version     = BitsOnTheRun::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adrian Dulic']
  s.email       = ['adulic@gmail.com']
  s.homepage    = "http://github.com/adriandulic/bitsontherun"
  s.summary     = "BitsOnTheRun.com API implementation in Ruby"
  s.description = "BitsOnTheRun.com API implementation in Ruby"
  
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "bitsontherun"
  
  s.add_dependency "json", "1.5.1"
  s.add_dependency "curb", "0.7.10"
  
  s.add_development_dependency "bundler", "1.0.10"
  s.add_development_dependency "rspec", "2.4.0"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
