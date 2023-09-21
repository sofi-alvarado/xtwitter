class Tweet < ApplicationRecord
  belongs_to :user
  #self reference
  belongs_to :retweet, class_name: "Tweet", optional: true
end
