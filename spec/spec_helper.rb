require 'rspec'
require 'bitsontherun'
require 'shared_specs'

Rspec.configure do |c|
  c.mock_with :rspec
end

BitsOnTheRun.key    = "your api key"
BitsOnTheRun.secret = "your api secret"

