require 'spec_helper'

describe "Configuration" do
  before do
    @key = BitsOnTheRun.key
    @secret = BitsOnTheRun.secret
  end

  it "should store configuration information in class attributes" do
    BitsOnTheRun.key    = "your api key"
    BitsOnTheRun.secret = "your api secret"

    BitsOnTheRun.key.should    == "your api key"
    BitsOnTheRun.secret.should == "your api secret"
    BitsOnTheRun.format.should == "json"
  end

  after do
    BitsOnTheRun.key    = @key
    BitsOnTheRun.secret = @secret
  end
end
