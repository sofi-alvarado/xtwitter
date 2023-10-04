Rails.application.routes.draw do
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "tweets#index"

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
    resources :users do
      member do
        get 'users', to: 'users#show'
        get 'edit', to: 'users#edit'
        get 'update', to: 'users#update'
        get 'user_tweets', to: 'tweets#user_tweets'
        get 'tweets_and_replies', to: 'tweets#user_tweets_and_replies'
      end
    end
  end

  namespace :web do
    get 'register', to: 'users#new'
    post '/users', to: 'users#create'
    
    resources :tweets do
      member do
        get 'new', to: 'tweets#new'
        post 'create', to: 'tweets#create'
        get 'edit', to: 'tweets#edit'
        patch 'update', to: 'tweets#update'
      end
    end 

    resources :users do
      member do
        get 'show', to: 'users#show'
        get 'edit', to: 'users#edit'
        get 'update', to: 'users#update'
        get 'user_tweets', to: 'tweets#user_tweets'
        get 'tweets_and_replies', to: 'tweets#user_tweets_and_replies'
      end
    end

  end

end
