require 'rails_helper'

RSpec.describe 'User routes', type: :routing do
    it 'routes GET /user_tweets/:user_id to tweets#index for user tweets' do
        expect(get: '/user_tweets/1').to route_to('tweets#index', user_id: '1')
    end

    it 'routes GET /user_tweets_and_replies/:user_id to tweets#index for user tweets and replies' do
        expect(get: '/user_tweets_and_replies/1').to route_to('tweets#index', user_id: '1', with_replies: '1')
    end
end