require 'spec_helper'

describe "Configuration" do
  it "should store configuration information in class attributes" do
    BitsOnTheRun::Configuration.key    = "Ax4kflJt"
    BitsOnTheRun::Configuration.secret = "nUwCMz1UaciitFj6uEEpoXHn"

    BitsOnTheRun::Configuration.key.should    == "Ax4kflJt"
    BitsOnTheRun::Configuration.secret.should == "nUwCMz1UaciitFj6uEEpoXHn"
    BitsOnTheRun::Configuration.format.should == "json"
  end
end
