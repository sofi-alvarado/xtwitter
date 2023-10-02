require 'rails_helper'

RSpec.describe 'Tweet routes', type: :routing do
  it 'routes POST /tweets to tweets#create' do
    expect(post: '/tweets').to route_to('tweets#create')
  end

  it 'routes PUT /tweets/:id to tweets#update' do
    expect(put: '/tweets/1').to route_to('tweets#update', id: '1')
  end

  it 'routes POST /tweets/:id/like to likes#create' do
    expect(post: '/tweets/1/like').to route_to('likes#create', tweet_id: '1')
  end

  it 'routes DELETE /tweets/:id/unlike to likes#destroy' do
    expect(delete: '/tweets/1/unlike').to route_to('likes#destroy', tweet_id: '1')
  end

  it 'routes POST /tweets/:id/retweet to retweets#create' do
    expect(post: '/tweets/1/retweet').to route_to('retweets#create', tweet_id: '1')
  end

  it 'routes POST /tweets/:id/quote to quotes#create' do
    expect(post: '/tweets/1/quote').to route_to('quotes#create', tweet_id: '1')
  end

  it 'routes POST /tweets/:id/reply to replies#create' do
    expect(post: '/tweets/1/reply').to route_to('replies#create', tweet_id: '1')
  end

  it 'routes POST /tweets/:id/bookmark to bookmarks#create' do
    expect(post: '/tweets/1/bookmark').to route_to('bookmarks#create', tweet_id: '1')
  end

  it 'routes GET /tweet_stats/:id to tweet_stats#show' do
    expect(get: '/tweet_stats/1').to route_to('tweet_stats#show', id: '1')
    end
end
