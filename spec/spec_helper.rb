require 'rspec'
require 'bitsontherun'
require 'shared_specs'

Rspec.configure do |c|
  c.mock_with :rspec
end

BitsOnTheRun::Configuration.key    = "your api key"
BitsOnTheRun::Configuration.secret = "your api secret"

