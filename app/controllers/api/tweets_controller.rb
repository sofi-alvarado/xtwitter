class Api::TweetsController < ApplicationController
  before_action :set_api_tweet, only: %i[ show update destroy ]

  # GET /api/tweets
  # GET /api/tweets.json
  def index
    @api_tweets = Api::Tweet.all
    render json: @api_tweets
  end

  # GET /api/tweets/1
  # GET /api/tweets/1.json
  def show
  end

  # POST /api/tweets
  # POST /api/tweets.json
  def create
    @api_tweet = Api::Tweet.new(api_tweet_params)

    if @api_tweet.save
      render :show, status: :created, location: @api_tweet
    else
      render json: @api_tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/tweets/1
  # PATCH/PUT /api/tweets/1.json
  def update
    if @api_tweet.update(api_tweet_params)
      render :show, status: :ok, location: @api_tweet
    else
      render json: @api_tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/tweets/1
  # DELETE /api/tweets/1.json
  def destroy
    @api_tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_tweet
      @api_tweet = Api::Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_tweet_params
      params.fetch(:api_tweet, {})
    end
end
