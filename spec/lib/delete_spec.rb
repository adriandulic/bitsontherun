require 'spec_helper'

describe "API call to delete video files" do
  it_should_behave_like "Successful response"
  
  before do
    @video = BitsOnTheRun::store('videos/create', 'spec/test.mp4')
    @responses = BitsOnTheRun::call('videos/delete', :video_key => @video.media.key)
  end
  
  it "should contain confirmation about deleted video" do
    @responses.each do |r|
      r.ok?.should be_true
    end
  end
end
