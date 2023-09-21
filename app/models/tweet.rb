class Tweet < ApplicationRecord
  belongs_to :user
  #self reference
  belongs_to :retweet, class_name: "Tweet", optional: true
  #a Tweet can have many replies
  has_many :replies
end
