require 'spec_helper'

describe "API call to store new video file" do
  it_should_behave_like "Successful response"
  
  before do
    @responses = []
    @file = 'spec/test.mp4'
    @responses << BitsOnTheRun::store('videos/create', @file)
    
    @manual = BitsOnTheRun::API.new(:store)
    @manual.method('videos/create')
    @manual.file(@file)
    @responses << @manual.execute
  end
  
  it "should contain information about uploaded video" do
    @responses.each do |r|
      r.file(:md5).size.should eql(32)
      r.file(:size).to_i.should > 0
    end
  end
end
