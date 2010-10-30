require 'spec_helper'

describe "API call to retrieve version" do
  it_should_behave_like "Successful response"
  
  before(:each) do
    @call = Botr::API.new(:call)
    @call.method('version')
    @response = @call.execute
  end
  
  it "should contain information about API current version" do
    @response.should have_key :version
  end
end

describe "API call to retrieve account" do
  it_should_behave_like "Successful response"
  
  before(:each) do
    @call = Botr::API.new(:call)
    @call.method('accounts/show', :account_login => 'bajeczka')
    @response = @call.execute
  end
  
  it "should contain information about specific account" do
    @response.should have_key :account
  end
end
