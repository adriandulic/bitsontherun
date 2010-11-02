require 'spec_helper'

shared_examples_for "Successful response" do
  it "should contain status attribute with value #ok" do
    @responses.each do |r|
      r.status.should eql("ok")
      r.ok?.should be_true
      r.error?.should be_false
    end
  end
end

shared_examples_for "Error response" do
  it "should contain status attribute with value #error" do
    @responses.each do |r|
      r.status.should eql("error")
      r.ok?.should be_false
      r.error?.should be_true
      r.code.should_not be_nil
      r.title.should_not be_nil
      r.message.should_not be_nil
    end
  end
end
