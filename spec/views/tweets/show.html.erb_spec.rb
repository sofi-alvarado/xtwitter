require 'rails_helper'
=begin
RSpec.describe "tweets/show", type: :view do
  before(:each) do
    assign(:tweet, Tweet.create!(
      user_id: "User",
      created_at: "Created At",
      updated_at: "Updated At",
      content: "Content",
      hashtags: "Hashtags",
      retweet_id: "Retweet",
      quote_id: "Quote",
      quote: "Quote"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Created At/)
    expect(rendered).to match(/Updated At/)
    expect(rendered).to match(/Content/)
    expect(rendered).to match(/Hashtags/)
    expect(rendered).to match(/Retweet/)
    expect(rendered).to match(/Quote/)
    expect(rendered).to match(/Quote/)
  end
end
=end