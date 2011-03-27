require 'spec_helper'

describe "API call to delete video files" do
  it_should_behave_like "Successful response"
  
  before do
      @responses = []
      @call = stub_botr_request(:call, 'delete', 'videos/delete', :video_key => 'video key')
      @responses << @call.execute
  end
  
  it "should contain confirmation about deleted video" do
    @responses.each do |r|
      r.ok?.should be_true
    end
  end
end
