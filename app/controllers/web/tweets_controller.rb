class Web::TweetsController < ApplicationController
    before_action :authenticate_user!,  except: [:sign_in_or_redirect]
    before_action :set_tweet, only: %i[ show edit update destroy ]

    # GET /tweets or /tweets.json
    def index
      @tweets = Tweet.all
    end
  
    # GET /tweets/1 or /tweets/1.json
    def show
        @tweet = Tweet.find(params[:id])
        # Additional code to display the tweet details in the show view
    end 
      
  
    # GET /tweets/new
    def new
      @tweet = Tweet.new(user: current_user)
    end
  
    # GET /tweets/1/edit
    def edit 
      @tweet = Tweet.find(params[:id])
    end
  
    # POST /tweets or /tweets.json
    def create
      @tweet = Tweet.new(tweet_params)
  
      respond_to do |format|
        if @tweet.save
          format.html { redirect_to web_tweet_url(@tweet), notice: "Tweet was successfully created." }
          format.json { render :show, status: :created, location: @tweet }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tweet.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /tweets/1 or /tweets/1.json
    def update
      respond_to do |format|
        if @tweet.update(tweet_params)
          format.html { redirect_to web_tweet_url(@tweet), notice: "Tweet was successfully updated." }
          format.json { render :show, status: :ok, location: @tweet }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @tweet.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /tweets/1 or /tweets/1.json
    def destroy
      @tweet.destroy
  
      respond_to do |format|
        format.html { redirect_to web_tweets_url, notice: "Tweet was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def sign_in_or_redirect
      if user_signed_in?
        redirect_to web_tweets_path
      else
        @random_tweets = Tweet.order("RANDOM()").limit(10)
        render 'web/tweets/public_tweets' 
      end
    end
  
    private

      # Use callbacks to share common setup or constraints between actions.
      def set_tweet
        @tweet = Tweet.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def tweet_params
        params.require(:tweet).permit(:user_id, :created_at, :updated_at, :content, :hashtags, :retweet_id, :quote_id, :quote)
      end
end
