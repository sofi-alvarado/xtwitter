require 'rails_helper'

RSpec.describe Like, type: :model do

  describe "associations" do
    it { should belong_to(:tweet) }
    it { should belong_to(:user) }
  end

  context "validations" do
    it 'validates uniqueness of user_id scoped to tweet_id' do
      # Create a tweet and user records
      tweet = FactoryBot.create(:tweet)
      user = FactoryBot.create(:user)
      existing_like = FactoryBot.create(:like, user: user, tweet: tweet)
      like = FactoryBot.build(:like, user: user, tweet: tweet)
      like.user_id = user.id
      like.tweet_id = tweet.id
      expect(like).to validate_uniqueness_of(:user_id)
        .scoped_to(:tweet_id).with_message("cannot like more than once")
    end
  end
end
