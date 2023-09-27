require 'rails_helper'

RSpec.describe Tweet, type: :model do
  it "creates a Tweet" do 
    tweet = create(:tweet)
  end

  context "associations" do
    it { should belong_to(:user)}
    it { should have_many(:retweets) }
    it { should have_many(:quotes) } 
    it { should have_many(:bookmarks) }
    it { should have_many(:likes) }
    it { should have_many(:replies) }
  end

end
