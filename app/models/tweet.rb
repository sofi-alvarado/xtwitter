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
end
