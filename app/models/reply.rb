class Reply < ApplicationRecord
  #Associations with table tweets and users
  belongs_to :tweet
  belongs_to :user
end
