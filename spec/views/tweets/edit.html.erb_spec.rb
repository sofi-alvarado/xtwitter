require 'rails_helper'

RSpec.describe "tweets/edit", type: :view do
  let(:tweet) {
    Tweet.create!(
      user_id: "MyString",
      created_at: "MyString",
      updated_at: "MyString",
      content: "MyString",
      hashtags: "MyString",
      retweet_id: "MyString",
      quote_id: "MyString",
      quote: "MyString"
    )
  }

  before(:each) do
    assign(:tweet, tweet)
  end

  it "renders the edit tweet form" do
    render

    assert_select "form[action=?][method=?]", tweet_path(tweet), "post" do

      assert_select "input[name=?]", "tweet[user_id]"

      assert_select "input[name=?]", "tweet[created_at]"

      assert_select "input[name=?]", "tweet[updated_at]"

      assert_select "input[name=?]", "tweet[content]"

      assert_select "input[name=?]", "tweet[hashtags]"

      assert_select "input[name=?]", "tweet[retweet_id]"

      assert_select "input[name=?]", "tweet[quote_id]"

      assert_select "input[name=?]", "tweet[quote]"
    end
  end
end
