require 'rails_helper'


RSpec.describe "/api/tweets", type: :request do
 
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tweet.create! valid_attributes
      get api_tweets_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tweet = Tweet.create! valid_attributes
      get api_tweet_url(tweet), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Api::Tweet" do
        expect {
          post api_tweets_url,
               params: { tweet: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Tweet, :count).by(1)
      end

      it "renders a JSON response with the new api_tweet" do
        post api_tweets_url,
             params: { tweet: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Api::Tweet" do
        expect {
          post api_tweets_url,
               params: { tweet: invalid_attributes }, as: :json
        }.to change(Tweet, :count).by(0)
      end

      it "renders a JSON response with errors for the new api_tweet" do
        post api_tweets_url,
             params: { tweet: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested api_tweet" do
        tweet = Tweet.create! valid_attributes
        patch api_tweet_url(tweet),
              params: { tweet: new_attributes }, headers: valid_headers, as: :json
        tweet.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the api_tweet" do
        tweet = Tweet.create! valid_attributes
        patch api_tweet_url(tweet),
              params: { tweet: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the api_tweet" do
        tweet = Tweet.create! valid_attributes
        patch api_tweet_url(tweet),
              params: { tweet: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested api_tweet" do
      tweet = Tweet.create! valid_attributes
      expect {
        delete api_tweet_url(tweet), headers: valid_headers, as: :json
      }.to change(Tweet, :count).by(-1)
    end
  end
end
