require 'rails_helper'

RSpec.describe "Tweets", type: :request do
  describe "GET /" do
    it "returns a successful response" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /tweets" do
    it "creates a new tweet" do
      post create_tweet_path
      expect(response).to have_http_status(302)
    end
  end

  describe "PATCH /tweets/:id" do
    it "updates an existing tweet" do
      tweet = create(:tweet)
      patch update_tweet_path(tweet)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /tweets/:id/like" do
    it "likes an existing tweet" do
      tweet = create(:tweet)
      post likes_tweet_path(tweet)
      expect(response).to have_http_status(302)
  end

  describe "DELETE /tweets/:id/unlike" do
    it "unlikes an existing tweet" do
      tweet = create(:tweet)
      delete unlikes_tweet_path(tweet)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /tweets/:id/retweet" do
    it "retweets an existing tweet" do
      tweet = create(:tweet)
      post retweets_path(tweet)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /tweets/:id/quote" do
    it "quotes an existing tweet" do
      tweet = create(:tweet)
      post quotes_path(tweet)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /tweets/:id/reply" do
    it "replies to an existing tweet" do
      tweet = create(:tweet)
      post reply_tweets_path(tweet)
      expect(response).to have_http_status(302)
    end
  end

  describe "POST /tweets/:id/bookmark" do
    it "bookmarks an existing tweet" do
      tweet = create(:tweet)
      post bookmark_tweets_path(tweet)
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /tweets/:id/stats" do
    it "returns a successful response" do
      tweet = create(:tweet)
      get stats_tweets_path(tweet)
      expect(response).to have_http_status(200)
    end
  end
end
end
