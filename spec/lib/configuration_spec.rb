require 'spec_helper'

describe "Configuration" do
  it "should work with single config items" do
    BitsOnTheRun::Configuration.key    = 'Ax4kflJt'
    BitsOnTheRun::Configuration.secret = 'nUwCMz1UaciitFj6uEEpoXHn'
    BitsOnTheRun::Configuration.format = 'json'
  end
  
  it "shoud work with block items" do
    BitsOnTheRun::Configuration.run do |c|
      c.key     'Ax4kflJt'
      c.secret  'nUwCMz1UaciitFj6uEEpoXHn'
      c.format  'json'
    end
  end
  
  after do
    BitsOnTheRun::Configuration.key.should    eql("Ax4kflJt")
    BitsOnTheRun::Configuration.secret.should eql("nUwCMz1UaciitFj6uEEpoXHn")
    BitsOnTheRun::Configuration.format.should eql("json")
  end
end
