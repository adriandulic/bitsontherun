require 'spec_helper'

describe "API call to delete video files" do
  it_should_behave_like "Successful response"
  
  before do
    @responses = []
    BitsOnTheRun::store('videos/create', 'spec/test.mp4')
    BitsOnTheRun::call('videos/list').videos.each do |video|
      @responses << BitsOnTheRun::call('videos/delete', :video_key => video.key)
    end
  end
  
  it "should contain confirmation about deleted video" do
    @responses.each do |r|
      r.ok?.should be_true
    end
  end
end
