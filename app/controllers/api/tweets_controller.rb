class Api::TweetsController < ApplicationController
  before_action :set_api_tweet, only: %i[ show update destroy ]

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
    @tweet = Tweet.new
  end

  # POST /api/tweets
  # POST /api/tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/tweets/1
  # PATCH/PUT /api/tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to tweet_url(@tweet), notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
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
