require 'spec_helper'

describe "API call to non existent resource" do
  it_should_behave_like "Error response"
  
  before do
    @responses = []
    @responses << BitsOnTheRun::call('videos/show', :video_key => 'wrong key here')
  end
  
  it "should contain information about error" do
    @responses.each do |r|
      r.video
      r.code.should eql("NotFound")
      r.title.should eql("Not Found")
      r.message.should eql("video_key: Video with the key wrong key here does not exist")
    end
  end
end
