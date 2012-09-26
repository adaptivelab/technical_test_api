require 'spec_helper'

describe "tweets/show" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :message => "Message",
      :user_handle => "User Handle",
      :followers => 1,
      :sentiment => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Message/)
    rendered.should match(/User Handle/)
    rendered.should match(/1/)
    rendered.should match(/1.5/)
  end
end
