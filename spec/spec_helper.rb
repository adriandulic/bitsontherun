require 'rspec'
require 'ruby-botr'
require 'shared_specs'

Rspec.configure do |c|
  c.mock_with :rspec
end

Botr.configure do |c|
  c.key     'Ax4kflJt'
  c.secret  'nUwCMz1UaciitFj6uEEpoXHn'
end
