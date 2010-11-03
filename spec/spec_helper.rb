require 'rspec'
require 'bitsontherun'
require 'shared_specs'

Rspec.configure do |c|
  c.mock_with :rspec
end

BitsOnTheRun::Configuration.run do |c|
  c.key     "Ax4kflJt"
  c.secret  "nUwCMz1UaciitFj6uEEpoXHn"
  c.format  "json"
end
