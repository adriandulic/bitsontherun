require 'rspec'
require 'bitsontherun'
require 'shared_specs'
require 'webmock/rspec'

RSpec.configure do |c|
  c.mock_with :rspec
end

BitsOnTheRun.key    = "your api key"
BitsOnTheRun.secret = "your api secret"

def stub_botr_request(type, file, method, params = {})
  call = BitsOnTheRun::API.new(type).method(method, params)
  stub_request(:get, call.build_url).to_return(:body => File.new("spec/support/#{file}.json"), :status => 200)
  call
end
