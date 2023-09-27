class Reply < ApplicationRecord
  # Associations with table tweets and users
  belongs_to :tweets, class_name: "Tweet", foreign_key: :tweet_id
  belongs_to :users, class_name: "User", foreign_key: :user_id
  # Validating if content exists and if is in a length betweent 1 and 255
  # If content is not provided throw message: is too short (minimum is 1 character)", "Please enter your text"
  validates :quote, length: { within:(1...255)}, presence: { message: "Please enter your text" }
  # Retrieve replies from a tweet
  scope :replies_tweet , -> (tweet_id) { where(tweet_id: tweet_id) }
end
