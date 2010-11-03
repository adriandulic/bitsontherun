require 'rspec'
require 'bitsontherun'
require 'shared_specs'

Rspec.configure do |c|
  c.mock_with :rspec
end

BitsOnTheRun::Configuration.run do |c|
  c.key     "your api key"
  c.secret  "your api secret"
end
