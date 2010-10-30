describe "Ruby::Botr" do
  before(:all) do
    @api = Ruby::Botr::Base.new('Ax4kflJt', 'nUwCMz1UaciitFj6uEEpoXHn')
  end
  
  it "just works" do
    @api.call('version').should_not be_nil
  end
end