require 'rails_helper'

RSpec.describe "Users", type: :request do
    describe "GET /user_tweets" do
        it "returns a successful response" do
          get user_tweets_path
          expect(response).to have_http_status(200)
        end
      end
      
      describe "GET /user_tweets_and_replies" do
        it "returns a successful response" do
          get tweets_and_replies_path
          expect(response).to have_http_status(200)
        end
      end
end
