require 'spec_helper'

describe "Configuration" do
  before do
    @key = BitsOnTheRun::Configuration.key
    @secret = BitsOnTheRun::Configuration.secret
  end

  it "should store configuration information in class attributes" do
    BitsOnTheRun::Configuration.key    = "your api key"
    BitsOnTheRun::Configuration.secret = "your api secret"

    BitsOnTheRun::Configuration.key.should    == "your api key"
    BitsOnTheRun::Configuration.secret.should == "your api secret"
    BitsOnTheRun::Configuration.format.should == "json"
  end

  after do
    BitsOnTheRun::Configuration.key    = @key
    BitsOnTheRun::Configuration.secret = @secret
  end
end
