json.extract! api_tweet, :id, :created_at, :updated_at
json.url api_tweet_url(api_tweet, format: :json)
