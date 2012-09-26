require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :message => "Message",
        :user_handle => "User Handle",
        :followers => 1,
        :sentiment => 1.5
      ),
      stub_model(Tweet,
        :message => "Message",
        :user_handle => "User Handle",
        :followers => 1,
        :sentiment => 1.5
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => "User Handle".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
