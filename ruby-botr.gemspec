# -*- encoding: utf-8 -*-
require File.expand_path("../lib/ruby-botr/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "ruby-botr"
  s.version     = Ruby::Botr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Adrian Dulic']
  s.email       = ['adulic@gmail.com']
  s.homepage    = "http://github.com/adriandulic/ruby-botr"
  s.summary     = "Bits on the run API implementation in Ruby"
  s.description = "Bits on the run API implementation in Ruby"
  
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "ruby-botr"
  
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "~> 2.0.0"
  
  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
