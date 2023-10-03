Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :tweets do
    # Defines the root path route ("/")
    root "tweets#index"
    # Route a user would use to create a new tweet
    post '/tweets', to: 'tweets#create', as: 'create_tweet'
    # Route a user would use to update an existent tweet
    patch '/tweets/:id', to: 'tweets#update', as: 'update_tweet'
    # Route a user would use to like an existent tweet
    post '/tweets/:id/like', to: 'tweets#like',  as: 'likes_tweet'
    # Route a user would use to unlike an existent tweet
    delete '/tweets/:id/unlike', to: 'tweets#unlike', as: 'unlikes_tweet'
    # Route a user would use to retweet an existent tweet
    post '/tweets/:id/retweet', to: 'tweets#retweet', as: 'retweets'
    # Route a user would use to Quote an existent tweet
    post '/tweets/:id/quote', to: 'tweets#quote', as: 'quotes'
    # Route a user would use to reply an existent tweet
    post '/tweets/:id/reply', to: 'tweets#reply', as: 'reply_tweets'
    # Route a user would use to bookmark an existent tweet
    post '/tweets/:id/bookmark', to: 'tweets#bookmark', as: 'bookmark_tweets'
    # Route a user would use to get the stats of how many times an existent tweet have been quoted, retweeted, replied, bookmarked or liked
    get '/tweets/:id/stats', to: 'tweets#stats', as: 'stats_tweets'
  end

  resources :users do
      # Route a user would use to create a new user
      post '/users', to: 'users#create', as: 'create_user'
      # Route a user would use to see any user (him/her self included) tweets, also this route should be paginated, meaning the results should be return in blocks
      get '/user_tweets', to: 'tweets#user_tweets', as: 'user_tweets'
      # Route a user would use to see any user (him/her self included) tweets AND replies
      get '/user_tweets_and_replies', to: 'tweets#user_tweets_and_replies', as: 'tweets_and_replies'
  end
end
