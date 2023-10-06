class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
    end


    def root_redirect
        if user_signed_in?
          redirect_to tweets_path
        else
          @random_tweets = Tweet.order("RANDOM()").limit(10)
          render 'tweets/index'
        end
    end
end
