require 'spec_helper'

describe "Configuration" do
  it "should work with single config items" do
    BitsOnTheRun::Configuration.key = 'key'
    BitsOnTheRun::Configuration.secret = 'secret'
  end
  
  it "shoud work with block" do
    BitsOnTheRun::Configuration.run do |c|
      c.key     'key'
      c.secret  'secret'
    end
  end
  
  after do
    BitsOnTheRun::Configuration.key.should eql("key")
    BitsOnTheRun::Configuration.secret.should eql("secret")
  end
end
