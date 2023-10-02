class Tweet < ApplicationRecord
  belongs_to :user
  # Self references
  has_many :retweets, class_name: "Tweet", foreign_key: :retweet_id
  has_many :quotes, class_name: "Tweet", foreign_key: :quote_id
  # A bookmark belongs to a single Tweet
  has_many :bookmarks
  has_many :taggings
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
  def self.create_retweet(tweet_id, user_id)
    retweet = Tweet.create(user_id: user_id, content: self.content, retweet_id: tweet_id)
  end

  # Create a method that encapsulates the retweet logic accepting a user an a text body as parameter
  def self.create_quoted_retweet(tweet_id, user_id, quote)
    quoted = Tweet.create(user_id: user_id, content: self.content, quote_id: tweet_id, quote: quote)
  end

  # Creating replies
  def self.create_reply(tweet_id, user_id, reply)
    tweet_reply = Reply.create(tweet_id: tweet_id, user_id: user_id, quote: reply)
  end

  # Like a tweet: Create a method that encapsulates the like logic accepting a user
  def self.liked_tweet(tweet_id, user_id)
    liked = Like.create(tweet_id: tweet_id, user_id: user_id)
  end

  def self.bookmarked_tweet(tweet_id, user_id)
    bookmarked = Bookmark.create(tweet_id: tweet_id, user_id: user_id)
  end

  def self.tagging_tweet(tweet_id, hashtag_id)
    tagging = Taggins.create(tweet_id: tweet_id, hashtag_id: hashtag_id)
  end

  def self.create_hashtags(tweet)
    hashtags = tweet.content.scan(/#\w+/)
    tweet.hashtags ||= "" # Initialize if nil
    hashtags.each do |hashtag_words|
      hashtag_name = hashtag_words.downcase 
      hashtag = Hashtag.find_or_create_by(name: hashtag_name)
      unless tweet.hashtags.include?(hashtag_name)
        tweet.hashtags += " #{hashtag_name}" # Add the hashtag to the string
      end
    end
  end
end
