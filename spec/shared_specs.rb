require 'spec_helper'

shared_examples_for "Successful response" do
  it "should contain status attribute with value '# ok'" do
    @response.should have_key :status
    @response[:status].should == "ok"
  end
end
