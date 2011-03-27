require 'spec_helper'

describe "API call to store new video file" do
  context "Store an existing file" do
    it_should_behave_like "Successful response"
    
    before do
      @responses = []
      @call = BitsOnTheRun::API.new(:store).method('videos/create')
      @call.file('spec/test.mp4')
      stub_request(:get, Regexp.new(BitsOnTheRun::URL)).to_return(:body => File.new("spec/support/create.json"), :status => 200)
      stub_request(:post, @call.build_store_url).to_return(:body => File.new("spec/support/store.json"), :status => 200)
      @responses << @call.execute
    end
    
    it "should contain information about uploaded video" do
      @responses.each do |r|
        r.video(:md5).should == "6d4063f37eed1e847ed17b7be6364546"
        r.video(:size).should == "21545452"
      end
    end
  end
  
  context "Store a user uploaded file" do
    it_should_behave_like "Successful response"
    
    before do
      @responses = []
      @call = BitsOnTheRun::API.new(:call).method('videos/create')
      stub_request(:get, @call.build_url).to_return(:body => File.new("spec/support/create.json"), :status => 200)
      @responses << @call.execute
    end
    
    it "should contain a video key and params to build the upload URL" do
      @responses.each do |r|
        r.video.link.protocol.should == "http"
        r.video.link.address.should == "upload.bitsontherun.com"
        r.video.link.path.should == "/v1/videos/upload"
        r.video.link.query.key.should == "vtQmcboj"
        r.video.link.query.token.should == "e2bbad0fd889d5d2e30047596cfe3789778257d2"
      end
    end
    
    it "should allow to create upload url" do
      @responses.each do |r|
        r.upload_url.should == "http://#{r.video.link.address}/v1/videos/upload?api_format=json&key=#{r.video.link.query.key}&token=#{r.video.link.query.token}"
      end
    end
  end
end
