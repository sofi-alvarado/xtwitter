class Api::TweetsController < ApplicationController
  before_action :set_api_tweet, only: %i[ show edit update destroy ]

  # GET /api/tweets
  # GET /api/tweets.json
  def index
    @tweets = Tweet.all
    render json: @tweets
  end

  # GET /api/tweets/1
  # GET /api/tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])
    render json: @tweet
  end

  # GET /tweets/new
  def new
    
  end

  # POST /api/tweets
  # POST /api/tweets.json
  def create
    @tweet = Tweet.new(api_tweet_params)
    if @tweet.save
      render :show, status: :created, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/tweets/1
  # PATCH/PUT /api/tweets/1.json
  def update
    if @tweet.update(api_tweet_params)
      render :show, status: :ok, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/tweets/1
  # DELETE /api/tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_tweet_params
      params.require(:tweet).permit(:user_id, :created_at, :updated_at, :content, :hashtags, :retweet_id, :quote_id, :quote)
    end

end
