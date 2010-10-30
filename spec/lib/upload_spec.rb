require 'spec_helper'

describe "API call to upload new video file" do
  it_should_behave_like "Successful response"

  before(:each) do
    @response = BitsOnTheRun::API.upload('/Users/adriandulic/Movies/test.mp4')
  end
  
  it "should return information about uploaded video" do
    @response.should have_key :file
    @response[:file].should have_key :size
    @response[:file][:size].to_i.should > 0
  end
end
