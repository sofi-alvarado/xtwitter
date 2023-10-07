Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registration: 'users/registrations'
  }
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get "tweets/index"
  # to recieve or send data
  # show create delete 
  #create for tweets
  # config/routes.rb

root to: 'web/tweets#sign_in_or_redirect'

  namespace :web do
  
    
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
  
  namespace :api do 
    resources :authentication do
      member do
       post 'log_in', to: 'authentication#create'
      end 
    end  
    resources :registration do
      member do
       post 'create', to: 'registration#create'
      end 
    end 
    resources :sessions do
      member do
       post 'log_in', to: 'sessions#create'
       delete 'log_out', to: 'sessions#destroy'
      end 
    end 
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


end
