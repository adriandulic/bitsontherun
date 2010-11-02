require 'spec_helper'

describe "API call to retrieve version" do
  it_should_behave_like "Successful response"
  
  before do
    @responses = []
    @responses << BitsOnTheRun::call('version')
  end
  
  it "should contain information about API current version" do
    @responses.each do |r|
      r.version.should be_instance_of String
    end
  end
end
