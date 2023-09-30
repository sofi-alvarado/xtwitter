class Tagging < ApplicationRecord
  belongs_to :tweets, class_name: "Tweet"
  belongs_to :hashtags, class_name: "Hashtag"
end
