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

  validates :content, presence: true, if: :is_retweet?
  validates_associated :user, :retweets

  def is_retweet?
    :retweet_id.nil?
  end

  #scope for retrieving tweets from a user
  #if you want to list all the tweets from a user
  #run rails c, create a new instance
  # t = Tweet.tweets_user(user_id) and then t.reload!
  scope :tweets_user , -> (user_id) { where(user_id: user_id) }
end
