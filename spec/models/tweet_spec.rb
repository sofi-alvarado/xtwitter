require 'rails_helper'

RSpec.describe Tweet, type: :model do

  let(:user) { create(:user) }
  let(:tweet) { create(:tweet, user: user) }

  describe "validations" do
    it { should validate_presence_of(:content).with_message("Please enter your text") }
    it { should validate_length_of(:content).is_at_most(255) }
    it { should validate_length_of(:quote).is_at_most(255) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:retweets).class_name("Tweet").with_foreign_key(:retweet_id) }
    it { should have_many(:quotes).class_name("Tweet").with_foreign_key(:quote_id) }
    it { should have_many(:bookmarks) }
    it { should have_many(:taggings) }
    it { should have_many(:likes) }
    it { should have_many(:replies).class_name("Reply") }
  end

  describe "scopes" do
    describe "retweets_count" do
      it "count of retweets for a tweet" do
        retweeted_tweet = create(:tweet, retweet_id: tweet.id)
        expect(Tweet.retweets_count(tweet.id)).to eq(1)
      end
    end

    describe "quotes_count" do
      it "count of quotes for a tweet" do
        quoted_tweet = create(:tweet, quote_id: tweet.id)
        expect(Tweet.quotes_count(tweet.id)).to eq(1)
      end
    end

  end

  describe "methods" do
      it "creates a retweet" do
        retweet = Tweet.create_retweet(tweet.id, user.id)
        expect(retweet).to be_a(Tweet)
        expect(retweet.user_id).to eq(user.id)
        expect(retweet.content).to eq(tweet.content)
        expect(retweet.retweet_id).to eq(tweet.id)
      end

      it "creates a quoted tweet" do
        quote = "This is a quote."
        quoted_retweet = Tweet.create_quoted_retweet(tweet.id, user.id, quote)

        expect(quoted_retweet).to be_a(Tweet)
        expect(quoted_retweet.user_id).to eq(user.id)
        expect(quoted_retweet.content).to eq(tweet.content)
        expect(quoted_retweet.quote_id).to eq(tweet.id)
        expect(quoted_retweet.quote).to eq(quote)
      end

      it "creates a like for the tweet by the specified user" do
        liked_tweet = Tweet.liked_tweet(tweet.id, user.id)
        expect(liked_tweet.user_id).to eq(user.id)
        expect(liked_tweet.tweet_id).to eq(tweet.id)
      end

      it "creates a bookmark tweet by the specified user" do
        bookmarked_tweet = Tweet.bookmarked_tweet(tweet.id, user.id)
        expect(bookmarked_tweet.user_id).to eq(user.id)
        expect(bookmarked_tweet.tweet_id).to eq(tweet.id)
      end

      it "creates a bookmark tweet by the specified user" do
        bookmarked_tweet = Tweet.bookmarked_tweet(tweet.id, user.id)
        expect(bookmarked_tweet.user_id).to eq(user.id)
        expect(bookmarked_tweet.tweet_id).to eq(tweet.id)
      end

    
      describe 'create_hashtags' do
        it 'creates hashtags for a tweet' do
          tweet = create(:tweet, content: 'This is a #sample tweet with #hashtags')
          # no existing hashtags
          expect(Hashtag.count).to eq(0)
          Tweet.create_hashtags(tweet)
          expect(Hashtag.count).to eq(2) # Assuming two unique hashtags
          # Check that the tweet's hashtags attribute was updated
          expect(tweet.hashtags).to eq(" #sample #hashtags")
        end
        it 'handles tweets without hashtags' do
          tweet = create(:tweet, content: 'This is a tweet without hashtags')
          expect(Hashtag.count).to eq(0)
          Tweet.create_hashtags(tweet)
          expect(Hashtag.count).to eq(0)
          expect(tweet.hashtags).to eq("")
        end
      end
  end
end

   