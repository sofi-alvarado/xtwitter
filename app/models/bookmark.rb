class Bookmark < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  scope :bookmarks, -> (user_id) {where(user_id: user_id)}
end
