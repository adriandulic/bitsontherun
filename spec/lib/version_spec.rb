require 'spec_helper'

describe "API call to retrieve version" do
  it_should_behave_like "Successful response"
  
  before do
    @responses = []
    @call = stub_botr_request(:call, 'version', 'version')
    @responses << @call.execute
  end
  
  it "should contain information about API current version" do
    @responses.each do |r|
      r.version.should == "1.15.1"
    end
  end
end
