class Tweet < ApplicationRecord
  belongs_to :user
  # Self references
  has_many :retweets, class_name: "Tweet", foreign_key: :retweet_id
  has_many :quotes, class_name: "Tweet", foreign_key: :quote_id
  # A bookmark belongs to a single Tweet
  has_many :bookmarks
  #has_many :hashtags
  has_many :likes
  has_many :replies, class_name: "Reply"
  # Validating if content exists and if in a length betweent 1 and 255
  # If content is not provided throw message: is too short (minimum is 1 character)", "Please enter your text"
  validates :content, length: {  maximum: 255 }, presence: { message: "Please enter your text" }
  validates :quote, length: { maximum: 255 }
  validates :content, presence: true
  validates_associated :user, :retweets

  # Retweets counts: Create a new scope that retrieves the number of retweets
  scope :retweets_count, -> (tweet_id){ where(retweet_id: tweet_id).count }
  # Retweets counts: Create a new scope that retrieves the number of retweets
  scope :quotes_count, -> (tweet_id){ where(quote_id: tweet_id).count }
  
  # Retweet method: Create a method that encapsulates the retweet logic accepting a user a parameter
  def create_retweet(user_id)
    original_tweet = Tweet.find(self.id) # Find the original tweet
    retweet_content = original_tweet.content # Access the content of the original tweet
    retweet = Tweet.create(user_id: user_id, content: retweet_content, retweet_id: self.id)
  end

  # Create a method that encapsulates the retweet logic accepting a user an a text body as parameter
  def create_quoted_retweet(user_id, quote)
    original_tweet = Tweet.find(self.id) # Find the original tweet
    tweet_content = original_tweet.content # Access the content of the original tweet
    quoted = Tweet.create(user_id: user_id, content: tweet_content, quote_id: self.id, quote: quote)
  end
  # Creating replies
  def create_reply(user_id, reply)
    original_tweet = Tweet.find(self.id) # Find the original tweet
    tweet_reply = Reply.create(tweet_id: self.id, user_id: user_id, quote: reply)
  end

  # Like a tweet: Create a method that encapsulates the like logic accepting a user
  def liked_tweet(user_id)
    tweet = Tweet.find(self.id) # Finding the tweet
    liked = Like.create(tweet_id: self.id, user_id: user_id)
  end
end
