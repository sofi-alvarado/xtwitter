class Tweet < ApplicationRecord
  belongs_to :user
  #self reference
  belongs_to :retweet, class_name: "Tweet", optional: true
  #a Tweet can have many replies
  has_many :replies
  #a bookmark belongs to a single Tweet
  has_one :bookmarks
  #a Tweet can have many likes
  has_many :likes
  #a Tweet can have many taggins
  has_many :taggings
  has_and_belongs_to_many :hashtags, through: :taggings

  #Validating if content exists and if in a length betweent 1 and 255
  validates :content, length: { within:(1...255)}, presence: true
  
  
end

#validates :legacy_code, format: {with: /regex/}
#presence validates the attribute is not nil, or if its present
#absence the opposite of presence
#validates :email, uniqueness: true
 