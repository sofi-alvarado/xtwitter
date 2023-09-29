require 'rails_helper'

RSpec.describe "tweets/index", type: :view do
  before(:each) do
    assign(:tweets, [
      Tweet.create!(
        user_id: "User",
        created_at: "Created At",
        updated_at: "Updated At",
        content: "Content",
        hashtags: "Hashtags",
        retweet_id: "Retweet",
        quote_id: "Quote",
        quote: "Quote"
      ),
      Tweet.create!(
        user_id: "User",
        created_at: "Created At",
        updated_at: "Updated At",
        content: "Content",
        hashtags: "Hashtags",
        retweet_id: "Retweet",
        quote_id: "Quote",
        quote: "Quote"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("User".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Created At".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Updated At".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Content".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Hashtags".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Retweet".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Quote".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Quote".to_s), count: 2
  end
end
