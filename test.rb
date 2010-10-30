require 'botr'

api = Botr::API.new('Ax4kflJt', 'nUwCMz1UaciitFj6uEEpoXHn')

calls = ['version', 'accounts/show']

calls.each do |call|
  response = api.call(call, :account_login => 'bajeczka', :api_format => "json")
  puts response.inspect
end
