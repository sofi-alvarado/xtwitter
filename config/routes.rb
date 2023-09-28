Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Route a user would use to create a new tweet
  post '/tweets', to: 'tweets#create'
  # Route a user would use to update an existent tweet
  patch '/tweets/:id', to: 'tweets#update'  
  # Route a user would use to like an existent tweet
  post '/tweets/:id/like', to: 'tweets#like'
  # Route a user would use to unlike an existent tweet
  delete '/tweets/:id/unlike', to: 'tweets#unlike'
  # Route a user would use to retweet an existent tweet
  post '/tweets/:id/retweet', to: 'tweets#retweet'
  # Route a user would use to Quote an existent tweet
  post '/tweets/:id/quote', to: 'tweets#quote'
  # Route a user would use to reply an existent tweet
  post '/tweets/:id/reply', to: 'tweets#reply'
  # Route a user would use to bookmark an existent tweet
  post '/tweets/:id/bookmark', to: 'tweets#bookmark'
  # Route a user would use to see any user (him/her self included) tweets, also this route should be paginated, meaning the results should be return in blocks
  get '/user_tweets', to: 'tweets#user_tweets'
  # Route a user would use to see any user (him/her self included) tweets AND replies
  get '/user_tweets_and_replies', to: 'tweets#user_tweets_and_replies'
  # Route a user would use to get the stats of how many times an existent tweet have been quoted, retweeted, replied, bookmarked or liked
  get '/tweets/:id/stats', to: 'tweets#stats'
end
