require 'spec_helper'

describe "Configuration" do
  it "should store configuration information in class attributes" do
    BitsOnTheRun.key    = "your api key"
    BitsOnTheRun.secret = "your api secret"

    BitsOnTheRun.key.should    == "your api key"
    BitsOnTheRun.secret.should == "your api secret"
    BitsOnTheRun.format.should == "json"
  end
end
