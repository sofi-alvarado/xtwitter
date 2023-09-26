class Tweet < ApplicationRecord
  belongs_to :user
  #self reference
  has_many :retweets, class_name: "Tweet", foreign_key: :retweet_id
  #a bookmark belongs to a single Tweet
  has_many :bookmarks
  has_many :hashtags
  has_many :likes

  #Validating if content exists and if in a length betweent 1 and 255
  #If content is not provided throw message: is too short (minimum is 1 character)", "Please enter your text"
  validates :content, length: { within:(1...255)}, presence: { message: "Please enter your text" }

  validates :content, presence: true
  validates_associated :user, :retweets
  validates :content, presence: true, on: :create_retweet, if: -> { content.present? }

 

  #Retweets counts: Create a new scope that retrieves the number of retweets
  scope :retweets_count, -> (tweet_id){ where(retweet_id: tweet_id).count }
  
  
  #Retweet method: Create a method that encapsulates the retweet logic accepting a user a parameter
  def create_retweet(user_id)
    original_tweet = Tweet.find(self.id) # Find the original tweet
    retweet_content = original_tweet.content # Access the content of the original tweet
    retweet = Tweet.create(user_id: user_id, content: retweet_content, retweet_id: self.id)
    retweet
  end
end
