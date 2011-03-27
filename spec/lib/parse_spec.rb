require 'spec_helper'

describe "Response JSON parser" do
  before do
    @json = File.open('spec/support/test.json').read
  end
  
  it "should parse JSON string to Hash" do
    output = BitsOnTheRun::Parser.parse(@json)
    output.should be_instance_of Hash
    output.should have_key :status
    output.should have_key :other
    output[:status].should == "ok"
    output[:other].should have_key :name
    output[:other][:name].should == "Valid"
  end
end
