class Api::TweetsController < Api::ApiController
  before_action :set_default_format
  skip_before_action :authenticate_user!
  before_action :set_api_tweet, only: %i[ show update ]
  

  # PATCH/PUT /api/tweets/1
  # PATCH/PUT /api/tweets/1.json
  def update
    if @tweet.update(api_tweet_params)
      render :show, status: :ok, location: @tweet
    else
      render json: @tweet.errors, status: :unprocessable_entity
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
