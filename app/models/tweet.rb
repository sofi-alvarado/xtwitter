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

  validates :content, length: { maximum: 255}, presence: true
end
 