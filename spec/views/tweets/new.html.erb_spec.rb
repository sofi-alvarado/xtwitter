require 'rails_helper'

RSpec.describe "tweets/new", type: :view do
  before(:each) do
    assign(:tweet, Tweet.new(
      user_id: "MyString",
      created_at: "MyString",
      updated_at: "MyString",
      content: "MyString",
      hashtags: "MyString",
      retweet_id: "MyString",
      quote_id: "MyString",
      quote: "MyString"
    ))
  end

  it "renders new tweet form" do
    render

    assert_select "form[action=?][method=?]", tweets_path, "post" do

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
