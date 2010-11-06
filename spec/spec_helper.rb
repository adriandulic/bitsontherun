require 'rspec'
require 'bitsontherun'
require 'shared_specs'

Rspec.configure do |c|
  c.mock_with :rspec
end

BitsOnTheRun::Configuration.key    = "Ax4kflJt"
BitsOnTheRun::Configuration.secret = "nUwCMz1UaciitFj6uEEpoXHn"

