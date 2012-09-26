require 'spec_helper'

describe "tweets/edit" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :message => "MyString",
      :user_handle => "MyString",
      :followers => 1,
      :sentiment => 1.5
    ))
  end

  it "renders the edit tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path(@tweet), :method => "post" do
      assert_select "input#tweet_message", :name => "tweet[message]"
      assert_select "input#tweet_user_handle", :name => "tweet[user_handle]"
      assert_select "input#tweet_followers", :name => "tweet[followers]"
      assert_select "input#tweet_sentiment", :name => "tweet[sentiment]"
    end
  end
end
