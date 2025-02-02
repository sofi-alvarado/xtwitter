class Like < ApplicationRecord
  belongs_to :tweet
  belongs_to :user
  #Validating that a user like a tweet just one 
  #User can like its own tweet
  validates :user_id, uniqueness: { scope: :tweet_id, message: "cannot like more than once" }

end