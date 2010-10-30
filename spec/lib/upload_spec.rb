require 'spec_helper'

describe "API call to upload new video file" do
  it "should return upload uri information" do
      @call = Botr::API.new(:call)
      @call.method('videos/create')
      @response = @call.execute
      
      @upload = Botr::API.new(:upload)
      @upload.upload('/Users/adriandulic/Movies/test.mp4', @response)
      @response = @upload.execute
      
      puts @response.inspect
  end
end
