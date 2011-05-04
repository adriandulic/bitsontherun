require 'spec_helper'

describe "API call to retrieve account" do
  it_should_behave_like "Successful response"
  
  before do
    @responses = []
    @call = stub_botr_request(:call, 'account', 'accounts/show', :account_key => BitsOnTheRun.key)
    @responses << @call.execute
  end
  
  it "should contain information about specific account" do
    @responses.each do |r|
      r.find(:account, :cdn, :name).should == "BitGravity"
      r.find([:account, :cdn, :name]).should == "BitGravity"
      r.find(:account, [:cdn, :name]).should == "BitGravity"
      r.account(:cdn, :name).should == "BitGravity"
      r.account([:cdn, :name]).should == "BitGravity"
      r.account.cdn(:name).should == "BitGravity"
      r.account.cdn.name.should == "BitGravity"
      r.account.key.should == "key"
      r.account.secret.should == "secret"
      r.account.type.should == "user"
    end
  end
end
