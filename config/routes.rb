Rails.application.routes.draw do

  root 'tweets#index'
  resources :tweets, only: [:create, :update] do
    member do
      # Like Tweet: Route a user would use to like an existent tweet
      post 'like', to: 'tweets#like', as: 'like'
      # Unlike Tweet: Route a user would use to unlike an existent tweet
      delete 'unlike', to: 'tweets#unlike', as: 'unlike'
      # Retweet: Route a user would use to retweet an existent tweet
      post 'retweet', to: 'tweets#retweet', as: 'retweet'
      # Quote: Route a user would use to Quote an existent tweet
      post 'quote', to: 'tweets#quote', as: 'quote'
      # Reply: Route a user would use to reply an existent tweet
      post 'reply', to: 'tweets#reply', as: 'reply'
      # Bookmark: Route a user would use to bookmark an existent tweet
      post 'bookmark', to: 'tweets#bookmark', as: 'bookmark'
      # Tweet Stats: Route a user would use to get the stats of how many times an existent tweet have been quoted, retweeted, replied, bookmarked or liked.
      get 'stats', to: 'tweets#stats', as: 'stats'
    end
    collection do
      # Create tweet: Route a user would use to create a new tweet
      post 'create_tweet', to: 'tweets#create', as: 'create_tweet'
    end
    #Update tweet: Route a user would use to update an existent tweet
    patch '', to: 'tweets#update', as: 'update_tweet'
  end

  resources :users, only: [] do
    member do
      # User Tweets: Route a user would use to see any user (him/her self included) tweets, also this route should be paginated, meaning the results should be return in blocks
      get 'user_tweets', to: 'tweets#user_tweets', as: 'user_tweets'
      # User Tweets & Replies: Route a user would use to see any user (him/her self included) tweets 
      get 'user_tweets_and_replies', to: 'tweets#user_tweets_and_replies', as: 'tweets_and_replies'
    end
  end

end
