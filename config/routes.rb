Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  
  resources :tweets do
    member do
      post 'like', to: 'tweets#like'
      delete 'unlike', to: 'tweets#unlike'
      post 'retweet', to: 'tweets#retweet'
      post 'quote', to: 'tweets#quote'
      post 'reply', to: 'tweets#reply'
      post 'bookmark', to: 'tweets#bookmark'
      get 'stats', to: 'tweets#stats'
    end
  end

  resources :tweets, only: [:new, :create]
  resources :tweets, only: [:edit, :update]

  resources :users do
    member do
      get 'user_tweets', to: 'tweets#user_tweets'
      get 'tweets_and_replies', to: 'tweets#user_tweets_and_replies'
    end
  end
 

end
