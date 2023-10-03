json.array! @tweets, partial: "api/tweets/tweet", as: :tweet

=begin
json.id tweet.id
    json.user_id tweet.user_id
    json.created_at tweet.created_at
    json.updated_at tweet.updated_at
    json.content tweet.content
    json.hashtags tweet.hashtags
    json.retweet_id tweet.retweet_id 
    json.quote_id tweet.quote_id 
    json.quote tweet.quote

=end