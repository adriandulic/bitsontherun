require 'spec_helper'

describe "API call to retrieve account" do
  it_should_behave_like "Successful response"
  
  before do
    @responses = []
    @responses << BitsOnTheRun::call('accounts/show', :account_login => 'bajeczka')
    
    @manual = BitsOnTheRun::API.new(:call)
    @manual.method('accounts/show', :account_login => 'bajeczka')
    @responses << @manual.execute
  end
  
  it "should contain information about specific account" do
    @responses.each do |r|
      r.find(:account, :cdn, :name).should be_instance_of String
      r.find([:account, :cdn, :name]).should be_instance_of String
      r.find(:account, [:cdn, :name]).should be_instance_of String
      r.account(:cdn, :name).should be_instance_of String
      r.account([:cdn, :name]).should be_instance_of String
      r.account.cdn(:name).should be_instance_of String
      r.account.cdn.name.should be_instance_of String
    end
  end
end
