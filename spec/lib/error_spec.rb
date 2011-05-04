require 'spec_helper'

describe "API call to non existent resource" do
  it_should_behave_like "Error response"
  
  before do
    @responses = []
    @call = stub_botr_request(:call, 'error', 'videos/show', :video_key => 'wrong key here')
    @responses << @call.execute
  end
  
  it "should contain information about error" do
    @responses.each do |r|
      r.video
      r.code.should == "NotFound"
      r.title.should == "Not Found"
      r.message.should == "video_key: Video with the key wrong key here does not exist"
    end
  end
end
