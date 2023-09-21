class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user

  #add association validations to your model
  validates_associated :tweet, :user

  #User like
  validates: user_id, uniqueness: true
  #Liked tweet
  validates: tweet_id, uniqueness: true

end
