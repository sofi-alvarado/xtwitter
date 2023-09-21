class Tweet < ApplicationRecord
  belongs_to :user
  #self reference
  belongs_to :retweet, class_name: "Tweet", optional: true
  #a bookmark belongs to a single Tweet
  has_one :bookmarks
  has_and_belongs_to_many :hashtags, through: :taggings

  #Validating if content exists and if in a length betweent 1 and 255
  #If content is not provided throw message: is too short (minimum is 1 character)", "Please enter your text"
  validates :content, length: { within:(1...255)}, presence: { message: "Please enter your text" }

  validates :content, presence: true, if: :uniqueness_tweet_id?
  
  def uniqueness_tweet_id?
    :retweet_id.nil?
  end
  
end

#validates :legacy_code, format: {with: /regex/}
#presence validates the attribute is not nil, or if its present
#absence the opposite of presence
#validates :email, uniqueness: true
 