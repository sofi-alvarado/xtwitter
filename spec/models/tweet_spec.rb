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
    describe "creating a retweet" do
      it "creates a retweet" do
        retweet = tweet.create_retweet(user.id)
        expect(retweet.user_id).to eq(user.id)
        expect(retweet.content).to eq(tweet.content)
        expect(retweet.retweet_id).to eq(tweet.id)
      end
    end

    describe "create_quoted_retweet" do
      it "creates a quoted tweet" do
        quote = "This is a quote."
        quoted_retweet = tweet.create_quoted_retweet(user.id, quote)
        expect(quoted_retweet.user_id).to eq(user.id)
        expect(quoted_retweet.content).to eq(tweet.content)
        expect(quoted_retweet.quote_id).to eq(tweet.id)
        expect(quoted_retweet.quote).to eq(quote)
      end
    end

    describe "liking a tweet" do
      it "creates a like for the tweet by the specified user" do
        liked_tweet = tweet.liked_tweet(user.id)
        expect(liked_tweet.user_id).to eq(user.id)
        expect(liked_tweet.tweet_id).to eq(tweet.id)
      end
    end

  end
end

=begin
# spec/requests/tweets_spec.rb

require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  let(:user) { create(:user) } # Assuming you have a User model and a user factory

  describe "POST /tweets" do
    context "when creating a tweet successfully" do
      it "creates a new tweet" do
        sign_in user
        tweet_params = { content: "This is a test tweet" }

        post '/tweets', params: { tweet: tweet_params }

        expect(response).to have_http_status(:created)
        expect(response).to redirect_to(tweet_path(Tweet.last))
        expect(Tweet.last.content).to eq("This is a test tweet")
      end
    end

    context "when creating a tweet fails due to invalid data" do
      it "does not create a tweet and returns unprocessable entity" do
        sign_in user
        tweet_params = { content: "" } # Invalid content

        post '/tweets', params: { tweet: tweet_params }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new) # Assuming there's a 'new' view for tweets
      end
    end

    context "when creating a tweet without authentication" do
      it "returns unauthorized" do
        tweet_params = { content: "This is a test tweet" }

        post '/tweets', params: { tweet: tweet_params }

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  # Add similar examples for other routes and features...
end

=end

# spec/routing/tweet_routes_spec.rb

