Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do 
     resources :tweets do
      member do
        get 'new', to: 'tweets#new'
        post 'create', to: 'tweets#create'
        get 'edit', to: 'tweets#edit'
        patch 'update', to: 'tweets#update'
        post 'like', to: 'tweets#like'
        delete 'unlike', to: 'tweets#unlike'
        post 'retweet', to: 'tweets#retweet'
        post 'quote', to: 'tweets#quote'
        post 'reply', to: 'tweets#reply'
        post 'bookmark', to: 'tweets#bookmark'
        get 'stats', to: 'tweets#stats'
      end
    end
  end

  namespace :web do

    resources :users do
      member do
        get 'user_tweets', to: 'tweets#user_tweets'
        get 'tweets_and_replies', to: 'tweets#user_tweets_and_replies'
      end
    end

    resources :tweets do
      member do
        root "tweets#index"
        get 'new', to: 'tweets#new'
        post 'create', to: 'tweets#create'
        get 'edit', to: 'tweets#edit'
        patch 'update', to: 'tweets#update'
      end
    end 

  end

end
