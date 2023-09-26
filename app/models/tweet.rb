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
  validates :content, length: { within:(1...255)}
  validates :content, presence: true
  validates_associated :user, :retweets


  #scope for retrieving tweets from a user
  #if you want to list all the tweets from a user
  #run rails c, create a new instance
  # t = Tweet.tweets_user(user_id) and then t.reload!
  scope :tweets_user , -> (user_id) { where(user_id: user_id) }

  scope :retweets, -> { where.not(retweet_id: nil) }
  validates :content, presence: true, on: :create_retweet, if: -> { content.present? }
  
  def create_retweet(user_id)
    retweet = Tweet.new(user_id: user_id, retweet_id: self.id)

    if retweet.save(validate: false)
      retweet
    else
      # Handle validation errors if any
      # You can access validation errors with retweet.errors
      nil
    end
  end
end
