class Bookmark < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  #add association validations to your model
  validates_associated :tweet, :user

  scope :bookmarks, -> (user_id) {where(user_id: user_id)}
end
