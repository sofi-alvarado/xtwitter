class Tagging < ApplicationRecord
  belongs_to :tweets, class_name: "Tweet", foreign_key: "tweet_id"
  belongs_to :hashtags, class_name: "Hashtag", foreign_key: "hashtag_id"
end
